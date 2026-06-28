import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_product_event.freezed.dart';

@freezed
abstract class DashboardProductEvent with _$DashboardProductEvent {
  const factory DashboardProductEvent.load() = DashboardProductLoad;
  const factory DashboardProductEvent.searchChanged(String query) =
      DashboardProductSearchChanged;
}