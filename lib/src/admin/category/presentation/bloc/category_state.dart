import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kud_shop/src/admin/category/domain/entities/category_entity.dart';

part 'category_state.freezed.dart';

@freezed
sealed class CategoryState with _$CategoryState {
  const factory CategoryState.initial() = CategoryInitial;
  const factory CategoryState.loading() = CategoryLoading;
  const factory CategoryState.loaded(
    List<CategoryEntity> categories,
  ) = CategoryLoaded;
  const factory CategoryState.actionSuccess(
    List<CategoryEntity> categories,
  ) = CategoryActionSuccess;
  const factory CategoryState.error(String message) = CategoryError;
}