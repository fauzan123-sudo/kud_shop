import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kud_shop/src/admin/dashboard/data/datasources/admin_dashboard_datasource.dart';
import 'package:kud_shop/src/admin/dashboard/data/repositories/admin_dashboard_repository.dart';

part 'admin_dashboard_event.dart';
part 'admin_dashboard_state.dart';
part 'admin_dashboard_bloc.freezed.dart';

class AdminDashboardBloc
    extends Bloc<AdminDashboardEvent, AdminDashboardState> {
  final AdminDashboardRepository repository;

  AdminDashboardBloc({required this.repository})
    : super(const AdminDashboardState.initial()) {
    on<AdminDashboardLoad>(_onLoad);
  }

  Future<void> _onLoad(
    AdminDashboardLoad event,
    Emitter<AdminDashboardState> emit,
  ) async {
    emit(const AdminDashboardState.loading());
    final result = await repository.getDashboardStats();
    result.fold(
      (failure) => emit(AdminDashboardState.error(failure.message)),
      (stats) => emit(AdminDashboardState.loaded(stats)),
    );
  }
}
