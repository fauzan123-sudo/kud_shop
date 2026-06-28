import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kud_shop/src/admin/category/domain/entities/category_entity.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
abstract class CategoryModel with _$CategoryModel {
  const factory CategoryModel({
    required int id,
    required String name,
    @JsonKey(name: 'icon_url') String? iconUrl,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}

extension CategoryModelX on CategoryModel {
  CategoryEntity toEntity() => CategoryEntity(
        id: id,
        name: name,
        iconUrl: iconUrl,
        createdAt: createdAt,
      );
}