import 'package:flutter/material.dart';
import 'package:kud_shop/core/utils/currency_formatter.dart';
import 'package:kud_shop/src/admin/dashboard/data/datasources/admin_dashboard_datasource.dart';
import 'package:kud_shop/src/admin/dashboard/presentation/widget/start_card.dart';

class DashboardStatsGrid extends StatelessWidget {
  const DashboardStatsGrid({super.key, required this.stats});
  final DashboardStats stats;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 1.5,
      children: [
        StatCard(
          label: 'Total Order',
          value: stats.totalOrders.toString(),
          icon: Icons.receipt_long_outlined,
          color: Colors.blue,
        ),
        StatCard(
          label: 'Menunggu',
          value: stats.pendingOrders.toString(),
          icon: Icons.hourglass_empty_outlined,
          color: Colors.orange,
        ),
        StatCard(
          label: 'Total Revenue',
          value: 'Rp ${CurrencyFormatter.format(stats.totalRevenue)}',
          icon: Icons.payments_outlined,
          color: Colors.green,
          smallValue: true,
        ),
        StatCard(
          label: 'Total Produk',
          value: stats.totalProducts.toString(),
          icon: Icons.inventory_2_outlined,
          color: Colors.purple,
        ),
      ],
    );
  }
}
