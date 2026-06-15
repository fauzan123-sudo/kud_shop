import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_event.freezed.dart';

@freezed
sealed class CategoryEvent with _$CategoryEvent {
  const factory CategoryEvent.load() = CategoryLoad;

  const factory CategoryEvent.create({required String name}) = CategoryCreate;

  const factory CategoryEvent.update({
    required int id,
    required String name,
  }) = CategoryUpdate;

  const factory CategoryEvent.delete({required int id}) = CategoryDelete;
}