import 'package:kud_shop/src/admin/category/domain/entities/category_entity.dart';
import 'package:kud_shop/src/admin/product/domain/entities/product_entity.dart';

abstract class CustomerProductState {
  const CustomerProductState();
}

class CustomerProductInitial extends CustomerProductState {
  const CustomerProductInitial();
}

class CustomerProductLoading extends CustomerProductState {
  const CustomerProductLoading();
}

class CustomerProductLoaded extends CustomerProductState {
  final List<ProductEntity> allProducts;
  final List<ProductEntity> filteredProducts;
  final List<CategoryEntity> categories;
  final String query;
  final int? selectedCategoryId;

  const CustomerProductLoaded({
    required this.allProducts,
    required this.filteredProducts,
    required this.categories,
    this.query = '',
    this.selectedCategoryId,
  });

  CustomerProductLoaded copyWith({
    List<ProductEntity>? allProducts,
    List<ProductEntity>? filteredProducts,
    List<CategoryEntity>? categories,
    String? query,
    int? selectedCategoryId,
    bool clearCategory = false,
  }) {
    return CustomerProductLoaded(
      allProducts: allProducts ?? this.allProducts,
      filteredProducts: filteredProducts ?? this.filteredProducts,
      categories: categories ?? this.categories,
      query: query ?? this.query,
      selectedCategoryId:
          clearCategory ? null : (selectedCategoryId ?? this.selectedCategoryId),
    );
  }
}

class CustomerProductError extends CustomerProductState {
  final String message;
  const CustomerProductError(this.message);
}