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
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {},
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const Spacer(flex: 3),
                Icon(
                  Icons.inventory_2_outlined,
                  size: 96,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(height: 32),
                const Text(
                  'Terima Kasih',
                  style: AppTextStyle.h2,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  'Mohon Tunggu untuk Proses Pembeliannya',
                  style: AppTextStyle.bodyMedium.copyWith(
                    color: Colors.grey.shade600,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Spacer(flex: 4),
                AppButton(
                  label: 'LIHAT DETAIL PESANAN',
                  onPressed: () {
                    context.go(AppRoutes.customerOrderDetail, extra: order);
                  },
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
