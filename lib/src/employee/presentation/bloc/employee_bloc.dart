import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_playground/core/constants/app_constants.dart';
import '../../domain/usecases/get_employees.dart';
import 'employee_event.dart';
import 'employee_state.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  final GetEmployees getEmployees;

  EmployeeBloc(this.getEmployees) : super(const EmployeeInitial()) {
    on<GetEmployeesEvent>(_onGetEmployees);
    on<LoadMoreEmployeesEvent>(_onLoadMore); // ← tambah
    on<SearchEmployeeEvent>(_onSearch);
  }

  Future<void> _onGetEmployees(
    GetEmployeesEvent event,
    Emitter<EmployeeState> emit,
  ) async {
    emit(const EmployeeLoading());
    final result = await getEmployees(const GetEmployeesParams(page: 1));
    result.fold(
      (failure) => emit(EmployeeError(failure.message)),
      (employees) => emit(
        EmployeeLoaded(
          employees: employees,
          filtered: employees,
          currentPage: 1,
          hasReachedMax: employees.length < AppConstants.employeeLimit,
        ),
      ),
    );
  }

  Future<void> _onLoadMore(
    LoadMoreEmployeesEvent event,
    Emitter<EmployeeState> emit,
  ) async {
    final current = state;
    if (current is! EmployeeLoaded) return;
    if (current.hasReachedMax || current.isLoadingMore) return;

    // ← tampilkan loading di bawah list
    emit(current.copyWith(isLoadingMore: true));

    final nextPage = current.currentPage + 1;
    final result = await getEmployees(GetEmployeesParams(page: nextPage));

    result.fold((failure) => emit(current.copyWith(isLoadingMore: false)), (
      newEmployees,
    ) {
      if (newEmployees.isEmpty ||
          newEmployees.length < AppConstants.employeeLimit) {
        // ← tidak ada data lagi
        emit(
          current.copyWith(
            isLoadingMore: false,
            hasReachedMax: true,
            employees: [...current.employees, ...newEmployees],
            filtered: [...current.employees, ...newEmployees],
            currentPage: nextPage,
          ),
        );
      } else {
        emit(
          current.copyWith(
            isLoadingMore: false,
            employees: [...current.employees, ...newEmployees],
            filtered: [...current.employees, ...newEmployees],
            currentPage: nextPage,
          ),
        );
      }
    });
  }

  void _onSearch(SearchEmployeeEvent event, Emitter<EmployeeState> emit) {
    final current = state;
    if (current is EmployeeLoaded) {
      final query = event.query.toLowerCase();
      final filtered = query.isEmpty
          ? current.employees
          : current.employees
                .where(
                  (e) =>
                      e.name.toLowerCase().contains(query) ||
                      e.department.toLowerCase().contains(query) ||
                      e.position.toLowerCase().contains(query),
                )
                .toList();
      emit(current.copyWith(filtered: filtered));
    }
  }
}
