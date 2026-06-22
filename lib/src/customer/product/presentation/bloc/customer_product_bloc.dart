import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kud_shop/core/usecases/usecase.dart';
import 'package:kud_shop/src/admin/category/domain/entities/category_entity.dart';
import 'package:kud_shop/src/admin/category/domain/usecases/get_categories.dart';
import 'package:kud_shop/src/admin/product/domain/entities/product_entity.dart';
import 'package:kud_shop/src/admin/product/domain/usecases/get_products.dart';
import 'customer_product_event.dart';
import 'customer_product_state.dart';

class CustomerProductBloc
    extends Bloc<CustomerProductEvent, CustomerProductState> {
  final GetProducts _getProducts;
  final GetCategories _getCategories;

  CustomerProductBloc({
    required GetProducts getProducts,
    required GetCategories getCategories,
  })  : _getProducts = getProducts,
        _getCategories = getCategories,
        super(const CustomerProductInitial()) {
    on<CustomerProductLoad>(_onLoad);
    on<CustomerProductSearchChanged>(_onSearchChanged);
    on<CustomerProductCategoryChanged>(_onCategoryChanged);
  }

  Future<void> _onLoad(
    CustomerProductLoad event,
    Emitter<CustomerProductState> emit,
  ) async {
    emit(const CustomerProductLoading());

    final productsResult = await _getProducts(const NoParams());

    await productsResult.fold(
      (failure) async => emit(CustomerProductError(failure.message)),
      (products) async {
        final categoriesResult = await _getCategories(const NoParams());
        final categories = categoriesResult.fold(
          (_) => const <CategoryEntity>[],
          (c) => c,
        );

        final available = products.where((p) => p.isActive).toList();

        emit(
          CustomerProductLoaded(
            allProducts: available,
            filteredProducts: available,
            categories: categories,
          ),
        );
      },
    );
  }

  void _onSearchChanged(
    CustomerProductSearchChanged event,
    Emitter<CustomerProductState> emit,
  ) {
    final current = state;
    if (current is! CustomerProductLoaded) return;

    final filtered = _applyFilters(
      products: current.allProducts,
      query: event.query,
      categoryId: current.selectedCategoryId,
    );

    emit(current.copyWith(filteredProducts: filtered, query: event.query));
  }

  void _onCategoryChanged(
    CustomerProductCategoryChanged event,
    Emitter<CustomerProductState> emit,
  ) {
    final current = state;
    if (current is! CustomerProductLoaded) return;

    final filtered = _applyFilters(
      products: current.allProducts,
      query: current.query,
      categoryId: event.categoryId,
    );

    emit(
      current.copyWith(
        filteredProducts: filtered,
        selectedCategoryId: event.categoryId,
        clearCategory: event.categoryId == null,
      ),
    );
  }

  List<ProductEntity> _applyFilters({
    required List<ProductEntity> products,
    required String query,
    int? categoryId,
  }) {
    final lowerQuery = query.trim().toLowerCase();

    return products.where((p) {
      final matchesQuery =
          lowerQuery.isEmpty || p.name.toLowerCase().contains(lowerQuery);
      final matchesCategory =
          categoryId == null || p.categoryId == categoryId;
      return matchesQuery && matchesCategory;
    }).toList();
  }
}