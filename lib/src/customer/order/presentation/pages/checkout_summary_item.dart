import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kud_shop/component/themes/app_text_style.dart';
import 'package:kud_shop/component/widgets/button/app_button.dart';
import 'package:kud_shop/core/navigation/app_routes.dart';
import '../../domain/entities/order_entity.dart';

class OrderSuccessPage extends StatelessWidget {
  final OrderEntity order;

  const OrderSuccessPage({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const Spacer(),
              Container(
                width: 96,
                height: 96,
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.check_circle,
                  size: 64,
                  color: Colors.green.shade600,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Pesanan Berhasil Dibuat!',
                style: AppTextStyle.h2,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'Pesanan #${order.id} sedang menunggu konfirmasi',
                style: AppTextStyle.bodyMedium.copyWith(
                  color: Colors.grey.shade600,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),

              _buildOrderSummaryCard(context),

              const Spacer(),
              AppButton(
                label: 'Lihat Pesanan Saya',
                onPressed: () {
                  // TODO: ganti ke AppRoutes.customerOrderHistory
                  // setelah halaman Riwayat Order dibuat.
                  context.go(AppRoutes.customerHome);
                },
              ),
              const SizedBox(height: 12),
              AppButton(
                label: 'Kembali ke Beranda',
                backgroundColor: Colors.white,
                foregroundColor: Theme.of(context).colorScheme.primary,
                onPressed: () {
                  context.go(AppRoutes.customerHome);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOrderSummaryCard(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          _buildRow('Total Pembayaran', 'Rp ${_formatPrice(order.totalPrice)}'),
          const SizedBox(height: 8),
          _buildRow('Metode Pengiriman', _deliveryLabel(order.deliveryMethod)),
          const SizedBox(height: 8),
          _buildRow('Metode Pembayaran', _paymentLabel(order.paymentMethod)),
        ],
      ),
    );
  }

  Widget _buildRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppTextStyle.bodySmall.copyWith(color: Colors.grey.shade600),
        ),
        Text(
          value,
          style: AppTextStyle.bodyMedium.copyWith(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

  String _deliveryLabel(String method) {
    return method == 'pickup' ? 'Ambil di Tempat' : 'Diantar';
  }

  String _paymentLabel(String method) {
    return method == 'transfer' ? 'Transfer Bank' : 'Bayar di Tempat (COD)';
  }

  String _formatPrice(double price) {
    return price
        .toStringAsFixed(0)
        .replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (m) => '${m[1]}.',
        );
  }
}
