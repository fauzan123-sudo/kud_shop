import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kud_shop/component/themes/app_text_style.dart';
import 'package:kud_shop/component/widgets/app_snackbar.dart';
import 'package:kud_shop/component/widgets/button/app_button.dart';
import 'package:kud_shop/core/injection/injection.dart';
import 'package:kud_shop/core/utils/currency_formatter.dart';
import 'package:kud_shop/src/admin/product/domain/entities/product_entity.dart';
import 'package:kud_shop/src/customer/address/domain/entities/address_entity.dart';
import 'package:kud_shop/src/customer/address/presentation/pages/address_list_page.dart';
import 'package:kud_shop/src/customer/cart/domain/entities/cart_item_entity.dart';
import 'package:kud_shop/src/customer/order/presentation/bloc/checkout_bloc.dart';
import 'package:kud_shop/src/customer/order/presentation/bloc/checkout_event.dart';
import 'package:kud_shop/src/customer/order/presentation/bloc/checkout_state.dart';
import 'package:kud_shop/src/customer/order/presentation/pages/order_success_page.dart';
import 'package:kud_shop/src/customer/order/presentation/pages/payment_proof_page.dart';
import '../widget/checkout_summary_item.dart';

class CheckoutPage extends StatelessWidget {
  final Map<String, dynamic>? buyNowData;

  const CheckoutPage({super.key, this.buyNowData});

  bool get isBuyNow =>
      buyNowData != null && buyNowData!.containsKey('isBuyNow');

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final bloc = sl<CheckoutBloc>();
        if (isBuyNow) {
          bloc.add(
            CheckoutBuyNow(
              // ← ini masih sama karena nama class sama
              product: buyNowData!['product'] as ProductEntity,
              quantity: buyNowData!['quantity'] as int,
            ),
          );
        } else if (buyNowData != null && buyNowData!.containsKey('items')) {
          bloc.add(
            CheckoutLoadFromItems(
              items: buyNowData!['items'] as List<CartItemEntity>,
            ),
          );
        } else {
          bloc.add(const CheckoutLoad());
        }
        return bloc;
      },
      child: BlocConsumer<CheckoutBloc, CheckoutState>(
        listener: (context, state) {
          if (state is CheckoutSuccess) {
            if (state.order.paymentMethod == 'transfer') {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => PaymentProofPage(order: state.order),
                ),
              );
            } else {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => OrderSuccessPage(order: state.order),
                ),
              );
            }
          }
          if (state is CheckoutError) {
            AppSnackbar.error(context, state.message);
          }
        },
        builder: (context, state) {
          if (state is CheckoutLoading || state is CheckoutInitial) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          if (state is! CheckoutLoaded) return const SizedBox();

          return _CheckoutView(state: state);
        },
      ),
    );
  }
}

// ─── View terpisah ────────────────────────────────────────────
class _CheckoutView extends StatelessWidget {
  final CheckoutLoaded state;

  const _CheckoutView({required this.state});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text('Checkout'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Alamat
            _buildAddressSection(context),
            const SizedBox(height: 12),

            // Produk
            _buildProductSection(context),
            const SizedBox(height: 12),

            // Metode pengiriman
            _buildDeliverySection(context),
            const SizedBox(height: 12),

            // Metode pembayaran
            _buildPaymentSection(context),
            const SizedBox(height: 100),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomBar(context),
    );
  }

  Widget _buildAddressSection(BuildContext context) {
    return _buildSectionCard(
      title: 'Alamat Pengiriman',
      trailing: TextButton(
        onPressed: () async {
          final selected = await Navigator.push<AddressEntity>(
            context,
            MaterialPageRoute(
              builder: (_) => const AddressListPage(isSelectionMode: true),
            ),
          );
          if (selected != null && context.mounted) {
            context.read<CheckoutBloc>().add(CheckoutAddressSelected(selected));
          }
        },
        child: Text(state.selectedAddress == null ? 'Pilih' : 'Ganti'),
      ),
      child: state.selectedAddress == null
          ? Text(
              'Belum ada alamat dipilih',
              style: AppTextStyle.bodySmall.copyWith(
                color: Colors.red.shade600,
              ),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  state.selectedAddress!.recipientName,
                  style: AppTextStyle.label,
                ),
                const SizedBox(height: 2),
                Text(
                  state.selectedAddress!.phone,
                  style: AppTextStyle.bodySmall.copyWith(
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  state.selectedAddress!.address,
                  style: AppTextStyle.bodySmall,
                ),
              ],
            ),
    );
  }

  Widget _buildProductSection(BuildContext context) {
    return _buildSectionCard(
      title: 'Pesanan (${state.items.length} produk)',
      child: Column(
        children: state.items
            .map(
              (item) => CheckoutSummaryItem(
                item: item,
                onQuantityChanged: (newQty) {
                  context.read<CheckoutBloc>().add(
                    CheckoutQuantityChanged(
                      cartItemId: item.id,
                      quantity: newQty,
                    ),
                  );
                },
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _buildDeliverySection(BuildContext context) {
    return _buildSectionCard(
      title: 'Metode Pengiriman',
      child: RadioGroup<String>(
        groupValue: state.deliveryMethod,
        onChanged: (v) =>
            context.read<CheckoutBloc>().add(CheckoutDeliveryMethodChanged(v!)),
        child: Column(
          children: [
            _buildRadioOption(
              label: 'Ambil di tempat (Pickup)',
              subtitle: 'Gratis',
              value: 'pickup',
            ),
            _buildRadioOption(
              label: 'Diantar (Delivery)',
              subtitle: 'Biaya kirim Rp 10.000',
              value: 'delivery',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentSection(BuildContext context) {
    return _buildSectionCard(
      title: 'Metode Pembayaran',
      child: RadioGroup<String>(
        groupValue: state.paymentMethod,
        onChanged: (v) =>
            context.read<CheckoutBloc>().add(CheckoutPaymentMethodChanged(v!)),
        child: Column(
          children: [
            _buildRadioOption(label: 'Transfer Bank', value: 'transfer'),
            _buildRadioOption(label: 'Bayar di Tempat (COD)', value: 'cod'),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(15),
            blurRadius: 12,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Subtotal', style: AppTextStyle.bodySmall),
                Text(
                  'Rp ${CurrencyFormatter.format(state.subtotal)}',
                  style: AppTextStyle.bodySmall,
                ),
              ],
            ),
            if (state.shippingCost > 0) ...[
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Ongkos Kirim', style: AppTextStyle.bodySmall),
                  Text(
                    'Rp ${CurrencyFormatter.format(state.shippingCost)}',
                    style: AppTextStyle.bodySmall,
                  ),
                ],
              ),
            ],
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Total Pembayaran', style: AppTextStyle.bodyMedium),
                Text(
                  'Rp ${CurrencyFormatter.format(state.totalPrice)}',
                  style: AppTextStyle.h3.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            AppButton(
              label: 'Buat Pesanan',
              isLoading: state.isSubmitting,
              onPressed: state.selectedAddress == null || state.isSubmitting
                  ? null
                  : () => context.read<CheckoutBloc>().add(
                      const CheckoutSubmit(),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionCard({
    required String title,
    Widget? trailing,
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(8),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: AppTextStyle.label),
              if (trailing != null) trailing,
            ],
          ),
          const SizedBox(height: 10),
          child,
        ],
      ),
    );
  }

  Widget _buildRadioOption({
    required String label,
    String? subtitle,
    required String value,
  }) {
    return RadioListTile<String>(
      value: value,
      title: Text(label, style: AppTextStyle.bodyMedium),
      subtitle: subtitle != null
          ? Text(
              subtitle,
              style: AppTextStyle.caption.copyWith(color: Colors.grey.shade600),
            )
          : null,
      contentPadding: EdgeInsets.zero,
      dense: true,
    );
  }
}
