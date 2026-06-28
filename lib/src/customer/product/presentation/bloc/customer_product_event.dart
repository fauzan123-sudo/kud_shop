import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_product_event.freezed.dart';

@freezed
abstract class CustomerProductEvent with _$CustomerProductEvent {
  const factory CustomerProductEvent.load() = CustomerProductLoad;
  const factory CustomerProductEvent.searchChanged(String query) =
      CustomerProductSearchChanged;
  const factory CustomerProductEvent.categoryChanged(int? categoryId) =
      CustomerProductCategoryChanged;
}