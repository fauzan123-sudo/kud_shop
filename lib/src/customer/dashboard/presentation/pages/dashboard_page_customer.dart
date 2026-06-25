import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kud_shop/component/themes/app_text_style.dart';
import 'package:kud_shop/component/widgets/loading/loading_widget.dart';
import 'package:kud_shop/core/injection/injection.dart';
import 'package:kud_shop/core/navigation/app_routes.dart';
import '../bloc/dashboard_product_bloc.dart';
import '../bloc/dashboard_product_event.dart';
import '../bloc/dashboard_product_state.dart';
import '../widget/product_search_bar.dart';
import '../widget/customer_product_card.dart';

class DashboardPageCustomer extends StatelessWidget {
  const DashboardPageCustomer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          sl<DashboardProductBloc>()..add(const DashboardProductLoad()),
      child: const _DashboardView(),
    );
  }
}

class _DashboardView extends StatelessWidget {
  const _DashboardView();

  static const int _previewCount = 6;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: BlocBuilder<DashboardProductBloc, DashboardProductState>(
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: () async {
              context.read<DashboardProductBloc>().add(
                const DashboardProductLoad(),
              );
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // const WelcomeBanner(),
                  const SizedBox(height: 30),

                  // ─── Search bar ───────────────────────
                  ProductSearchBar(
                    onChanged: (query) {
                      context.read<DashboardProductBloc>().add(
                        DashboardProductSearchChanged(query),
                      );
                    },
                  ),
                  // ─── Header list produk ───────────────
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Produk', style: AppTextStyle.h3),
                      TextButton(
                        onPressed: () =>
                            context.push(AppRoutes.customerProduct),
                        child: const Text('Lihat Semua'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // ─── Konten produk ────────────────────
                  _buildProductSection(context, state),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildProductSection(
    BuildContext context,
    DashboardProductState state,
  ) {
    if (state is DashboardProductLoading || state is DashboardProductInitial) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 40),
        child: LoadingWidget(),
      );
    }

    if (state is DashboardProductError) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Center(
          child: Text(
            state.message,
            style: AppTextStyle.bodyMedium.copyWith(color: Colors.grey),
          ),
        ),
      );
    }

    final loaded = state as DashboardProductLoaded;

    if (loaded.filteredProducts.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Center(
          child: Column(
            children: [
              Icon(Icons.search_off, size: 48, color: Colors.grey.shade400),
              const SizedBox(height: 12),
              Text(
                loaded.query.isEmpty
                    ? 'Belum ada produk'
                    : 'Produk "${loaded.query}" tidak ditemukan',
                style: AppTextStyle.bodyMedium.copyWith(
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
        ),
      );
    }

    // Saat search aktif, tampilkan semua hasil. Saat tidak search,
    // batasi jumlah preview di dashboard.
    final isSearching = loaded.query.isNotEmpty;
    final displayed = isSearching
        ? loaded.filteredProducts
        : loaded.filteredProducts.take(_previewCount).toList();

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: displayed.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.62,
      ),
      itemBuilder: (context, index) {
        final product = displayed[index];
        return CustomerProductCard(
          product: product,
          onTap: () {
            context.push(AppRoutes.customerProductDetail, extra: product);
          },
        );
      },
    );
  }
}
