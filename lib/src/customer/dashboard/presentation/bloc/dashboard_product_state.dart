import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kud_shop/src/admin/product/domain/entities/product_entity.dart';

part 'dashboard_product_state.freezed.dart';

@freezed
abstract class DashboardProductState with _$DashboardProductState {
  const factory DashboardProductState.initial() = DashboardProductInitial;
  const factory DashboardProductState.loading() = DashboardProductLoading;
  const factory DashboardProductState.loaded({
    required List<ProductEntity> allProducts,
    required List<ProductEntity> filteredProducts,
    @Default('') String query,
  }) = DashboardProductLoaded;
  const factory DashboardProductState.error(String message) =
      DashboardProductError;
}