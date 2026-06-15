import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kud_shop/component/themes/app_text_style.dart';
import 'package:kud_shop/component/widgets/app_loading.dart';
import 'package:kud_shop/component/widgets/app_snackbar.dart';
import 'package:kud_shop/core/injection/injection.dart';
import 'package:kud_shop/core/navigation/app_routes.dart';
import 'package:kud_shop/src/admin/product/domain/entities/product_entity.dart';
import 'package:kud_shop/src/admin/product/presentation/bloc/product_bloc.dart';
import 'package:kud_shop/src/admin/product/presentation/bloc/product_event.dart';
import 'package:kud_shop/src/admin/product/presentation/bloc/product_state.dart';
import '../widget/product_card.dart';

class AdminProductPage extends StatelessWidget {
  const AdminProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<ProductBloc>()..add(const ProductEvent.load()),
      child: const _ProductView(),
    );
  }
}

class _ProductView extends StatelessWidget {
  const _ProductView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text('Kelola Produk'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          // ─── Tombol Kelola Kategori ──────────────────
          TextButton.icon(
            onPressed: () => context.push(AppRoutes.adminCategory),
            icon: const Icon(Icons.category_outlined, size: 18),
            label: const Text('Kategori'),
          ),
        ],
      ),
      // ─── FAB Tambah Produk ───────────────────────────
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push(AppRoutes.adminProductAdd),
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: BlocConsumer<ProductBloc, ProductState>(
        listener: (context, state) {
          if (state is ProductActionSuccess) {
            AppSnackbar.success(context, 'Berhasil');
          }
          if (state is ProductError) {
            AppSnackbar.error(context, state.message);
          }
        },
        builder: (context, state) {
          if (state is ProductLoading) {
            return const Center(child: AppLoadingIndicator(size: 36));
          }

          final products = switch (state) {
            ProductLoaded(:final products) => products,
            ProductActionSuccess(:final products) => products,
            _ => <ProductEntity>[],
          };

          if (products.isEmpty &&
              state is! ProductLoading &&
              state is! ProductInitial) {
            return _buildEmpty(context);
          }

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: products.length,
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              return ProductCard(
                product: products[index],
                // ─── Navigasi ke halaman edit ──────────
                onEdit: () => context.push(
                  AppRoutes.adminProductEdit,
                  extra: products[index],
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildEmpty(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.medication_outlined,
            size: 64,
            color: Colors.grey.shade400,
          ),
          const SizedBox(height: 16),
          Text(
            'Belum ada produk',
            style: AppTextStyle.bodyMedium.copyWith(
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Tap + untuk menambah produk',
            style: AppTextStyle.bodySmall.copyWith(color: Colors.grey.shade400),
          ),
        ],
      ),
    );
  }
}
