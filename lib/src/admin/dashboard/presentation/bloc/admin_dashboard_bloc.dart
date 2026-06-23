import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kud_shop/src/admin/dashboard/data/datasources/admin_dashboard_datasource.dart';
import 'package:kud_shop/src/admin/dashboard/data/repositories/admin_dashboard_repository.dart';

// ─── Events ───────────────────────────────────────────────────
abstract class AdminDashboardEvent {
  const AdminDashboardEvent();
}

class AdminDashboardLoad extends AdminDashboardEvent {
  const AdminDashboardLoad();
}

// ─── States ───────────────────────────────────────────────────
abstract class AdminDashboardState {
  const AdminDashboardState();
}

class AdminDashboardInitial extends AdminDashboardState {
  const AdminDashboardInitial();
}

class AdminDashboardLoading extends AdminDashboardState {
  const AdminDashboardLoading();
}

class AdminDashboardLoaded extends AdminDashboardState {
  final DashboardStats stats;
  const AdminDashboardLoaded(this.stats);
}

class AdminDashboardError extends AdminDashboardState {
  final String message;
  const AdminDashboardError(this.message);
}

// ─── BLoC ─────────────────────────────────────────────────────
class AdminDashboardBloc
    extends Bloc<AdminDashboardEvent, AdminDashboardState> {
  final AdminDashboardRepository repository;

  AdminDashboardBloc({required this.repository})
    : super(const AdminDashboardInitial()) {
    on<AdminDashboardLoad>(_onLoad);
  }

  Future<void> _onLoad(
    AdminDashboardLoad event,
    Emitter<AdminDashboardState> emit,
  ) async {
    emit(const AdminDashboardLoading());
    final result = await repository.getDashboardStats();
    result.fold(
      (failure) => emit(AdminDashboardError(failure.message)),
      (stats) => emit(AdminDashboardLoaded(stats)),
    );
  }
}
