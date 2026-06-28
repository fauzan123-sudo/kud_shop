import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:kud_shop/component/themes/app_text_style.dart';
import 'package:kud_shop/core/navigation/app_routes.dart';
import 'package:kud_shop/core/utils/currency_formatter.dart';
import '../../domain/entities/order_entity.dart';

class OrderDetailPage extends StatelessWidget {
  final OrderEntity order;

  const OrderDetailPage({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          if (context.canPop()) {
            context.pop();
          } else {
            context.go(
              AppRoutes.customerOrderHistory,
            ); // dari success → ke riwayat
          }
        }
      },
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          title: const Text('Detail Pesanan'),
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              if (context.canPop()) {
                context.pop();
              } else {
                context.go(AppRoutes.customerOrderHistory);
              }
            },
          ),
        ),
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              _buildCard(child: _buildRow('Order Id', '#${order.id}')),
              const SizedBox(height: 12),
              _buildCard(child: _buildRow('Status', order.statusLabel)),
              const SizedBox(height: 12),
              _buildCard(
                child: _buildRow('Tanggal', _formatDate(order.createdAt)),
              ),
              const SizedBox(height: 12),
              _buildCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Produk', style: AppTextStyle.label),
                    const SizedBox(height: 10),
                    ...order.items.map(_buildProductLine),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              _buildCard(
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        'Total',
                        style: AppTextStyle.bodySmall.copyWith(
                          color: Colors.grey.shade600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Rp ${CurrencyFormatter.format(order.totalPrice)}',
                        style: AppTextStyle.h3,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductLine(OrderItemEntity item) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              '${item.productName} (${item.quantity})',
              style: AppTextStyle.bodyMedium,
            ),
          ),
          Text(
            'Rp ${CurrencyFormatter.format(item.subtotal)}',
            style: AppTextStyle.bodyMedium.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }

  Widget _buildRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$label : ', style: AppTextStyle.label),
        Expanded(child: Text(value, style: AppTextStyle.bodyMedium)),
      ],
    );
  }

  String _formatDate(DateTime date) {
    return DateFormat('EEEE, d MMMM yyyy, HH:mm', 'id_ID').format(date);
  }
}
