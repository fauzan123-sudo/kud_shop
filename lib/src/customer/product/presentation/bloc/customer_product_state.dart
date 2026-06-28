import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kud_shop/src/admin/category/domain/entities/category_entity.dart';
import 'package:kud_shop/src/admin/product/domain/entities/product_entity.dart';

part 'customer_product_state.freezed.dart';

@freezed
abstract class CustomerProductState with _$CustomerProductState {
  const factory CustomerProductState.initial() = CustomerProductInitial;
  const factory CustomerProductState.loading() = CustomerProductLoading;
  const factory CustomerProductState.loaded({
    required List<ProductEntity> allProducts,
    required List<ProductEntity> filteredProducts,
    required List<CategoryEntity> categories,
    @Default('') String query,
    int? selectedCategoryId,
  }) = CustomerProductLoaded;
  const factory CustomerProductState.error(String message) =
      CustomerProductError;
}