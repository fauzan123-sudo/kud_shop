import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kud_shop/component/themes/app_text_style.dart';
import 'package:kud_shop/component/widgets/app_snackbar.dart';
import 'package:kud_shop/core/injection/injection.dart';
import 'package:kud_shop/src/admin/dashboard/presentation/widget/dashboard_stats_grid.dart';
import 'package:kud_shop/src/admin/dashboard/presentation/widget/dashboard_stock_table.dart';
import '../bloc/admin_dashboard_bloc.dart';


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
                DashboardStatsGrid(stats: stats),
                const SizedBox(height: 20),

                // ─── Tabel Stok Produk ─────────────────────────
                _buildSectionTitle('Status Stok Produk'),
                const SizedBox(height: 10),
                DashboardStockTable(products: stats.allProducts),
                const SizedBox(height: 16),
              ],
            ),
          );
        },
      ),
    );
  }
  // ─── Tabel Stok ───────────────────────────────────────────


  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: AppTextStyle.bodyMedium.copyWith(fontWeight: FontWeight.w700),
    );
  }
}


