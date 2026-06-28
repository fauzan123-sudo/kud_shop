part of 'admin_dashboard_bloc.dart';

@freezed
abstract class AdminDashboardEvent with _$AdminDashboardEvent {
  const factory AdminDashboardEvent.load() = AdminDashboardLoad;
}