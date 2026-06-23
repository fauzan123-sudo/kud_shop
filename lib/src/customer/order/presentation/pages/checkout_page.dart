import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kud_shop/component/themes/app_text_style.dart';
import 'package:kud_shop/component/widgets/app_snackbar.dart';
import 'package:kud_shop/component/widgets/button/app_button.dart';
import 'package:kud_shop/component/widgets/loading/loading_widget.dart';
import 'package:kud_shop/core/injection/injection.dart';
import 'package:kud_shop/core/usecases/usecase.dart';
import 'package:kud_shop/core/utils/currency_formatter.dart';
import 'package:kud_shop/src/customer/address/domain/entities/address_entity.dart';
import 'package:kud_shop/src/customer/address/domain/usecases/get_addresses.dart';
import 'package:kud_shop/src/customer/address/presentation/pages/address_list_page.dart';
import 'package:kud_shop/src/customer/cart/domain/entities/cart_item_entity.dart';
import 'package:kud_shop/src/customer/cart/domain/usecases/get_cart_items.dart';
import 'package:kud_shop/src/customer/order/presentation/pages/checkout_summary_item.dart';
import 'package:kud_shop/src/customer/order/presentation/pages/payment_proof_page.dart';
import '../../domain/usecases/create_order.dart';
import '../widget/checkout_summary_item.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  static const double _shippingFee = 10000;
  static const String _bankAccountNumber = '09928-2881-98-0021';

  bool _isLoadingInitial = true;
  bool _isSubmitting = false;
  String? _loadError;

  List<CartItemEntity>? _cartItems;
  AddressEntity? _selectedAddress;
  String _deliveryMethod = 'pickup';
  String _paymentMethod = 'transfer';

  @override
  void initState() {
    super.initState();
    _loadInitialData();
  }

  Future<void> _loadInitialData() async {
    setState(() => _isLoadingInitial = true);

    final cartResult = await sl<GetCartItems>()(const NoParams());
    final addressResult = await sl<GetAddresses>()(const NoParams());

    if (!mounted) return;

    cartResult.fold(
      (failure) => setState(() => _loadError = failure.message),
      (items) => setState(() => _cartItems = items),
    );

    addressResult.fold((failure) {}, (addresses) {
      if (addresses.isNotEmpty) {
        final defaultAddr = addresses.firstWhere(
          (a) => a.isDefault,
          orElse: () => addresses.first,
        );
        setState(() => _selectedAddress = defaultAddr);
      }
    });

    setState(() => _isLoadingInitial = false);
  }

  Future<void> _onPickAddress() async {
    final result = await Navigator.push<AddressEntity>(
      context,
      MaterialPageRoute(
        builder: (_) => const AddressListPage(isSelectionMode: true),
      ),
    );
    if (result != null) {
      setState(() => _selectedAddress = result);
    }
  }

  double get _subtotal {
    if (_cartItems == null) return 0;
    return _cartItems!.fold(0, (sum, item) => sum + item.subtotal);
  }

  double get _shippingCost => _deliveryMethod == 'delivery' ? _shippingFee : 0;

  double get _totalPrice => _subtotal + _shippingCost;

  Future<void> _onSubmitOrder() async {
    if (_selectedAddress == null) {
      AppSnackbar.error(context, 'Pilih alamat pengiriman terlebih dahulu');
      return;
    }

    setState(() => _isSubmitting = true);

    final result = await sl<CreateOrder>()(
      CreateOrderParams(
        addressId: _selectedAddress!.id,
        deliveryMethod: _deliveryMethod,
        paymentMethod: _paymentMethod,
      ),
    );

    if (!mounted) return;

    result.fold(
      (failure) {
        setState(() => _isSubmitting = false);
        AppSnackbar.error(context, failure.message);
      },
      (order) {
        // context.read<CartBloc>().add(const CartLoad());

        if (_paymentMethod == 'transfer') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => PaymentProofPage(order: order)),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => OrderSuccessPage(order: order)),
          );
        }
      },
    );
  }

  void _onCopyAccountNumber() {
    Clipboard.setData(const ClipboardData(text: _bankAccountNumber));
    AppSnackbar.success(context, 'Nomor rekening disalin');
  }

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
      body: _buildBody(),
      bottomNavigationBar: _isLoadingInitial || _loadError != null
          ? null
          : _buildBottomBar(),
    );
  }

  Widget _buildBody() {
    if (_isLoadingInitial) {
      return const LoadingWidget();
    }

    if (_loadError != null) {
      return Center(
        child: Text(
          _loadError!,
          style: AppTextStyle.bodyMedium.copyWith(color: Colors.grey),
        ),
      );
    }

    if (_cartItems == null || _cartItems!.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_cart_outlined,
              size: 64,
              color: Colors.grey.shade400,
            ),
            const SizedBox(height: 16),
            Text(
              'Keranjang kamu kosong',
              style: AppTextStyle.bodyMedium.copyWith(
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionCard(
            title: 'Alamat Pengiriman',
            trailing: TextButton(
              onPressed: _onPickAddress,
              child: Text(_selectedAddress == null ? 'Pilih' : 'Ganti'),
            ),
            child: _selectedAddress == null
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
                        _selectedAddress!.recipientName,
                        style: AppTextStyle.label,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        _selectedAddress!.phone,
                        style: AppTextStyle.bodySmall.copyWith(
                          color: Colors.grey.shade600,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        _selectedAddress!.address,
                        style: AppTextStyle.bodySmall,
                      ),
                    ],
                  ),
          ),
          const SizedBox(height: 12),

          _buildSectionCard(
            title: 'Pesanan (${_cartItems!.length} produk)',
            child: Column(
              children: _cartItems!
                  .map((item) => CheckoutSummaryItem(item: item))
                  .toList(),
            ),
          ),
          const SizedBox(height: 12),

          _buildSectionCard(
            title: 'Metode Pengiriman',
            child: Column(
              children: [
                _buildRadioOption(
                  label: 'Ambil di tempat (Pickup)',
                  subtitle: 'Gratis',
                  value: 'pickup',
                  groupValue: _deliveryMethod,
                  onChanged: (v) => setState(() => _deliveryMethod = v!),
                ),
                _buildRadioOption(
                  label: 'Diantar (Delivery)',
                  subtitle: 'Biaya kirim Rp ${CurrencyFormatter.format(_shippingFee)}',
                  value: 'delivery',
                  groupValue: _deliveryMethod,
                  onChanged: (v) => setState(() => _deliveryMethod = v!),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),

          _buildSectionCard(
            title: 'Metode Pembayaran',
            child: Column(
              children: [
                _buildRadioOption(
                  label: 'Transfer Bank',
                  value: 'transfer',
                  groupValue: _paymentMethod,
                  onChanged: (v) => setState(() => _paymentMethod = v!),
                ),
                if (_paymentMethod == 'transfer') _buildBankAccountInfo(),
                _buildRadioOption(
                  label: 'Bayar di Tempat (COD)',
                  value: 'cod',
                  groupValue: _paymentMethod,
                  onChanged: (v) => setState(() => _paymentMethod = v!),
                ),
              ],
            ),
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }

  Widget _buildBankAccountInfo() {
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(Icons.account_balance, size: 18, color: Colors.blue.shade700),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'No. Rekening',
                  style: AppTextStyle.caption.copyWith(
                    color: Colors.grey.shade600,
                  ),
                ),
                Text(
                  _bankAccountNumber,
                  style: AppTextStyle.bodyMedium.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          TextButton.icon(
            onPressed: _onCopyAccountNumber,
            icon: const Icon(Icons.copy, size: 14),
            label: const Text('Copy', style: TextStyle(fontSize: 12)),
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              minimumSize: const Size(0, 32),
            ),
          ),
        ],
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
    required String groupValue,
    required ValueChanged<String?> onChanged,
  }) {
    return RadioListTile<String>(
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
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

  Widget _buildBottomBar() {
    final canSubmit =
        !_isSubmitting &&
        (_cartItems?.isNotEmpty ?? false) &&
        _selectedAddress != null;

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
                  'Rp ${CurrencyFormatter.format(_subtotal)}',
                  style: AppTextStyle.bodySmall,
                ),
              ],
            ),
            if (_shippingCost > 0) ...[
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Ongkos Kirim', style: AppTextStyle.bodySmall),
                  Text(
                    'Rp ${CurrencyFormatter.format(_shippingCost)}',
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
                  'Rp ${CurrencyFormatter.format(_totalPrice)}',
                  style: AppTextStyle.h3.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            AppButton(
              label: 'Buat Pesanan',
              isLoading: _isSubmitting,
              onPressed: canSubmit ? _onSubmitOrder : null,
            ),
          ],
        ),
      ),
    );
  }

}
