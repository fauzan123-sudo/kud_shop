part of 'admin_dashboard_bloc.dart';

@freezed
abstract class AdminDashboardState with _$AdminDashboardState {
  const factory AdminDashboardState.initial() = AdminDashboardInitial;
  const factory AdminDashboardState.loading() = AdminDashboardLoading;
  const factory AdminDashboardState.loaded(DashboardStats stats) = AdminDashboardLoaded;
  const factory AdminDashboardState.error(String message) = AdminDashboardError;
}