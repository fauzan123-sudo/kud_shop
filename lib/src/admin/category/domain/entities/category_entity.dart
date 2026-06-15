import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_entity.freezed.dart';

@freezed
abstract class CategoryEntity with _$CategoryEntity {
  const factory CategoryEntity({
    required int id,
    required String name,
    String? iconUrl,
    required DateTime createdAt,
  }) = _CategoryEntity;
}