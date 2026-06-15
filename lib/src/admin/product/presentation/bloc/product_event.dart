import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_event.freezed.dart';

@freezed
sealed class ProductEvent with _$ProductEvent {
  const factory ProductEvent.load() = ProductLoad;

  const factory ProductEvent.create({
    required int? categoryId,
    required String name,
    String? description,
    required double price,
    required int stock,
    String? imageUrl,
    required String unit,
    @Default(true) bool isActive,
  }) = ProductCreate;

  const factory ProductEvent.update({
    required int id,
    required int? categoryId,
    required String name,
    String? description,
    required double price,
    required int stock,
    String? imageUrl,
    required String unit,
    required bool isActive,
  }) = ProductUpdate;

  const factory ProductEvent.delete({required int id}) = ProductDelete;
}
