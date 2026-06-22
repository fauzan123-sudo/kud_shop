import 'package:kud_shop/src/admin/product/domain/entities/product_entity.dart';

abstract class DashboardProductState {
  const DashboardProductState();
}

class DashboardProductInitial extends DashboardProductState {
  const DashboardProductInitial();
}

class DashboardProductLoading extends DashboardProductState {
  const DashboardProductLoading();
}

class DashboardProductLoaded extends DashboardProductState {
  final List<ProductEntity> allProducts;
  final List<ProductEntity> filteredProducts;
  final String query;

  const DashboardProductLoaded({
    required this.allProducts,
    required this.filteredProducts,
    this.query = '',
  });

  DashboardProductLoaded copyWith({
    List<ProductEntity>? allProducts,
    List<ProductEntity>? filteredProducts,
    String? query,
  }) {
    return DashboardProductLoaded(
      allProducts: allProducts ?? this.allProducts,
      filteredProducts: filteredProducts ?? this.filteredProducts,
      query: query ?? this.query,
    );
  }
}

class DashboardProductError extends DashboardProductState {
  final String message;
  const DashboardProductError(this.message);
}
