import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kud_shop/component/themes/app_text_style.dart';
import 'package:kud_shop/component/widgets/loading/loading_widget.dart';
import 'package:kud_shop/core/injection/injection.dart';
import 'package:kud_shop/core/navigation/app_routes.dart';
import 'package:kud_shop/src/customer/dashboard/presentation/widget/customer_product_card.dart';
import 'package:kud_shop/src/customer/dashboard/presentation/widget/product_search_bar.dart';
import '../bloc/customer_product_bloc.dart';
import '../bloc/customer_product_event.dart';
import '../bloc/customer_product_state.dart';
import '../widget/category_filter_chips.dart';

class CustomerProductPage extends StatelessWidget {
  const CustomerProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          sl<CustomerProductBloc>()..add(const CustomerProductLoad()),
      child: const _CustomerProductView(),
    );
  }
}

class _CustomerProductView extends StatelessWidget {
  const _CustomerProductView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text('Produk'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: BlocBuilder<CustomerProductBloc, CustomerProductState>(
        builder: (context, state) {
          if (state is CustomerProductLoading ||
              state is CustomerProductInitial) {
            return const LoadingWidget();
          }

          if (state is CustomerProductError) {
            return Center(
              child: Text(
                state.message,
                style: AppTextStyle.bodyMedium.copyWith(color: Colors.grey),
              ),
            );
          }

          final loaded = state as CustomerProductLoaded;

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
                child: Column(
                  children: [
                    ProductSearchBar(
                      onChanged: (query) {
                        context.read<CustomerProductBloc>().add(
                              CustomerProductSearchChanged(query),
                            );
                      },
                    ),
                    const SizedBox(height: 12),
                    CategoryFilterChips(
                      categories: loaded.categories,
                      selectedCategoryId: loaded.selectedCategoryId,
                      onSelected: (categoryId) {
                        context.read<CustomerProductBloc>().add(
                              CustomerProductCategoryChanged(categoryId),
                            );
                      },
                    ),
                  ],
                ),
              ),
              Expanded(child: _buildProductGrid(context, loaded)),
            ],
          );
        },
      ),
    );
  }

  Widget _buildProductGrid(BuildContext context, CustomerProductLoaded state) {
    if (state.filteredProducts.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search_off, size: 48, color: Colors.grey.shade400),
            const SizedBox(height: 12),
            Text(
              'Produk tidak ditemukan',
              style: AppTextStyle.bodyMedium.copyWith(
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      itemCount: state.filteredProducts.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.68,
      ),
      itemBuilder: (context, index) {
        final product = state.filteredProducts[index];
        return CustomerProductCard(
          product: product,
          onTap: () {
            context.push(
              AppRoutes.customerProductDetail,
              extra: product,
            );
          },
        );
      },
    );
  }
}