import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kud_shop/component/themes/app_text_style.dart';
import 'package:kud_shop/component/widgets/app_snackbar.dart';
import 'package:kud_shop/component/widgets/button/app_button.dart';
import 'package:kud_shop/component/widgets/loading/loading_widget.dart';
import 'package:kud_shop/core/navigation/app_routes.dart';
import 'package:kud_shop/core/navigation/route_observer.dart';
import 'package:kud_shop/core/utils/currency_formatter.dart';
import '../bloc/cart_bloc.dart';
import '../bloc/cart_event.dart';
import '../bloc/cart_state.dart';
import '../widget/cart_item_tile.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> with RouteAware {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final route = ModalRoute.of(context);
    if (route is PageRoute) {
      appRouteObserver.subscribe(this, route);
    }
  }

  @override
  void dispose() {
    appRouteObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPopNext() {
    context.read<CartBloc>().add(const CartLoad());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text('Keranjang'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: BlocConsumer<CartBloc, CartState>(
        listener: (context, state) {
          if (state is CartError) {
            AppSnackbar.error(context, state.message);
          }
        },
        builder: (context, state) {
          if (state is CartLoading || state is CartInitial) {
            return const LoadingWidget();
          }

          if (state is CartError) {
            return _buildEmpty(
              icon: Icons.error_outline,
              message: state.message,
            );
          }

          final cartState = state as CartLoaded;

          if (cartState.isEmpty) {
            return _buildEmpty(
              icon: Icons.shopping_cart_outlined,
              message: 'Keranjang kamu masih kosong',
            );
          }

          return Column(
            children: [
              Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    Checkbox(
                      value: cartState.isAllSelected,
                      onChanged: (val) {
                        context.read<CartBloc>().add(
                          CartSelectAll(selectAll: val ?? false),
                        );
                      },
                    ),
                    const Text('Pilih Semua'),
                    const Spacer(),
                    if (cartState.selectedIds.isNotEmpty)
                      Text(
                        '${cartState.selectedIds.length} dipilih',
                        style: AppTextStyle.caption.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                  ],
                ),
              ),
              const Divider(height: 1),

              // List item
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: cartState.items.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 8),
                  itemBuilder: (context, index) {
                    final item = cartState.items[index];
                    final isSelected = cartState.selectedIds.contains(item.id);

                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Checkbox(
                          value: isSelected,
                          onChanged: (_) {
                            context.read<CartBloc>().add(
                              CartToggleSelect(cartItemId: item.id),
                            );
                          },
                        ),
                        Expanded(
                          child: CartItemTile(
                            item: item,
                            onQuantityChanged: (newQty) {
                              context.read<CartBloc>().add(
                                CartUpdateQuantity(
                                  cartItemId: item.id,
                                  quantity: newQty,
                                ),
                              );
                            },
                            onRemove: () {
                              context.read<CartBloc>().add(
                                CartRemoveItem(cartItemId: item.id),
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),

              // Summary bar
              _buildSummaryBar(context, cartState),
            ],
          );
        },
      ),
    );
  }

  Widget _buildSummaryBar(BuildContext context, CartLoaded state) {
    final hasIssue = state.selectedItems.any(
      (item) => item.isOutOfStock || item.exceedsStock,
    );
    final hasSelected = state.selectedIds.isNotEmpty;

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
                Text(
                  hasSelected
                      ? 'Total (${state.totalQuantity} item)'
                      : 'Pilih item untuk checkout',
                  style: AppTextStyle.bodyMedium,
                ),
                if (hasSelected)
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
              label: hasSelected
                  ? 'Checkout (${state.selectedItems.length} item)'
                  : 'Checkout',
              onPressed: (!hasSelected || hasIssue)
                  ? null
                  : () {
                      context.push(
                        AppRoutes.customerCheckout,
                        extra: {'items': state.selectedItems},
                      );
                    },
            ),
            if (hasIssue) ...[
              const SizedBox(height: 8),
              Text(
                'Periksa kembali item yang stoknya tidak cukup',
                style: AppTextStyle.caption.copyWith(color: Colors.red),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildEmpty({required IconData icon, required String message}) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 64, color: Colors.grey.shade400),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: AppTextStyle.bodyMedium.copyWith(
                color: Colors.grey.shade600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
