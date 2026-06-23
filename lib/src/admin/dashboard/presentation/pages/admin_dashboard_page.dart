import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kud_shop/component/themes/app_text_style.dart';
import 'package:kud_shop/component/widgets/app_snackbar.dart';
import 'package:kud_shop/core/injection/injection.dart';
import 'package:kud_shop/src/admin/dashboard/data/datasources/admin_dashboard_datasource.dart';
import 'package:kud_shop/src/admin/product/domain/entities/product_entity.dart';
import '../bloc/admin_dashboard_bloc.dart';
// import '../datasources/admin_dashboard_datasource.dart';

class AdminDashboardPage extends StatelessWidget {
  const AdminDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<AdminDashboardBloc>()..add(const AdminDashboardLoad()),
      child: const _DashboardView(),
    );
  }
}

class _DashboardView extends StatelessWidget {
  const _DashboardView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Dashboard'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => context.read<AdminDashboardBloc>().add(
              const AdminDashboardLoad(),
            ),
          ),
        ],
      ),
      body: BlocConsumer<AdminDashboardBloc, AdminDashboardState>(
        listener: (context, state) {
          if (state is AdminDashboardError) {
            AppSnackbar.error(context, state.message);
          }
        },
        builder: (context, state) {
          if (state is AdminDashboardLoading ||
              state is AdminDashboardInitial) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is AdminDashboardError) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 48,
                    color: Colors.grey.shade400,
                  ),
                  const SizedBox(height: 12),
                  Text(state.message),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () => context.read<AdminDashboardBloc>().add(
                      const AdminDashboardLoad(),
                    ),
                    child: const Text('Coba lagi'),
                  ),
                ],
              ),
            );
          }

          if (state is! AdminDashboardLoaded) return const SizedBox();
          final stats = state.stats;

          return RefreshIndicator(
            onRefresh: () async => context.read<AdminDashboardBloc>().add(
              const AdminDashboardLoad(),
            ),
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                // ─── Statistik Ringkas ─────────────────────────
                _buildSectionTitle('Ringkasan'),
                const SizedBox(height: 10),
                _buildStatsGrid(stats),
                const SizedBox(height: 20),

                // ─── Grafik Order 30 Hari ──────────────────────
                _buildSectionTitle('Order 30 Hari Terakhir'),
                const SizedBox(height: 10),
                _buildOrderChart(stats.dailySales),
                const SizedBox(height: 20),

                // ─── Tabel Stok Produk ─────────────────────────
                _buildSectionTitle('Status Stok Produk'),
                const SizedBox(height: 10),
                _buildStockTable(stats.allProducts),
                const SizedBox(height: 16),
              ],
            ),
          );
        },
      ),
    );
  }

  // ─── Statistik Grid ───────────────────────────────────────

  Widget _buildStatsGrid(DashboardStats stats) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 1.5,
      children: [
        _StatCard(
          label: 'Total Order',
          value: stats.totalOrders.toString(),
          icon: Icons.receipt_long_outlined,
          color: Colors.blue,
        ),
        _StatCard(
          label: 'Menunggu',
          value: stats.pendingOrders.toString(),
          icon: Icons.hourglass_empty_outlined,
          color: Colors.orange,
        ),
        _StatCard(
          label: 'Total Revenue',
          value: 'Rp ${_formatPrice(stats.totalRevenue)}',
          icon: Icons.payments_outlined,
          color: Colors.green,
          smallValue: true,
        ),
        _StatCard(
          label: 'Total Produk',
          value: stats.totalProducts.toString(),
          icon: Icons.inventory_2_outlined,
          color: Colors.purple,
        ),
      ],
    );
  }

  // ─── Grafik Order ─────────────────────────────────────────

  Widget _buildOrderChart(List<DailySalesData> dailySales) {
    if (dailySales.isEmpty) {
      return _emptyCard('Belum ada data order');
    }

    final maxY =
        dailySales
            .map((d) => d.orderCount.toDouble())
            .reduce((a, b) => a > b ? a : b)
            .ceilToDouble() +
        1;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 200,
            child: BarChart(
              BarChartData(
                maxY: maxY < 2 ? 5 : maxY,
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  getDrawingHorizontalLine: (_) =>
                      FlLine(color: Colors.grey.shade200, strokeWidth: 1),
                ),
                borderData: FlBorderData(show: false),
                titlesData: FlTitlesData(
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 28,
                      getTitlesWidget: (value, _) => Text(
                        value.toInt().toString(),
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 24,
                      interval: 7,
                      getTitlesWidget: (value, _) {
                        final idx = value.toInt();
                        if (idx < 0 || idx >= dailySales.length) {
                          return const SizedBox();
                        }
                        final date = dailySales[idx].date;
                        return Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Text(
                            '${date.day}/${date.month}',
                            style: TextStyle(
                              fontSize: 9,
                              color: Colors.grey.shade500,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                barGroups: dailySales.asMap().entries.map((entry) {
                  return BarChartGroupData(
                    x: entry.key,
                    barRods: [
                      BarChartRodData(
                        toY: entry.value.orderCount.toDouble(),
                        color: Colors.blue.shade400,
                        width: 6,
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(4),
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: Colors.blue.shade400,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                'Jumlah Order per Hari',
                style: AppTextStyle.bodySmall.copyWith(
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ─── Tabel Stok ───────────────────────────────────────────

  Widget _buildStockTable(List<ProductEntity> products) {
    if (products.isEmpty) {
      return _emptyCard('Belum ada produk');
    }

    // Urutkan: out of stock → low stock → aman
    final sorted = [...products]
      ..sort((a, b) {
        int priority(ProductEntity p) {
          if (p.isOutOfStock) return 0;
          if (p.isLowStock) return 1;
          return 2;
        }

        return priority(a).compareTo(priority(b));
      });

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          // Header
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    'Produk',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      'Stok',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      'Status',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          ...sorted.asMap().entries.map((entry) {
            final p = entry.value;
            final isLast = entry.key == sorted.length - 1;
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                          p.name,
                          style: AppTextStyle.bodySmall.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            '${p.stock} ${p.unit}',
                            style: AppTextStyle.bodySmall.copyWith(
                              fontWeight: FontWeight.w600,
                              color: p.isOutOfStock
                                  ? Colors.red
                                  : p.isLowStock
                                  ? Colors.orange
                                  : Colors.black87,
                            ),
                          ),
                        ),
                      ),
                      Expanded(child: Center(child: _buildStockBadge(p))),
                    ],
                  ),
                ),
                if (!isLast) const Divider(height: 1),
              ],
            );
          }),
        ],
      ),
    );
  }

  Widget _buildStockBadge(ProductEntity p) {
    final Color color;
    final String label;

    if (p.isOutOfStock) {
      color = Colors.red;
      label = 'Habis';
    } else if (p.isLowStock) {
      color = Colors.orange;
      label = 'Menipis';
    } else {
      color = Colors.green;
      label = 'Aman';
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withAlpha(25),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 10,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: AppTextStyle.bodyMedium.copyWith(fontWeight: FontWeight.w700),
    );
  }

  Widget _emptyCard(String message) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          message,
          style: AppTextStyle.bodySmall.copyWith(color: Colors.grey.shade500),
        ),
      ),
    );
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

// ─── Stat Card ────────────────────────────────────────────────

class _StatCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color color;
  final bool smallValue;

  const _StatCard({
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
    this.smallValue = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: color.withAlpha(25),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: color, size: 18),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: TextStyle(
                  fontSize: smallValue ? 14 : 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                label,
                style: AppTextStyle.bodySmall.copyWith(
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
