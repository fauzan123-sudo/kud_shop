import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kud_shop/src/admin/product/domain/entities/product_entity.dart';

part 'product_state.freezed.dart';

@freezed
sealed class ProductState with _$ProductState {
  const factory ProductState.initial() = ProductInitial;
  const factory ProductState.loading() = ProductLoading;
  const factory ProductState.loaded(List<ProductEntity> products) = ProductLoaded;
  const factory ProductState.actionSuccess(List<ProductEntity> products) = ProductActionSuccess;
  const factory ProductState.error(String message) = ProductError;
}