import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/employee.dart';

part 'employee_state.freezed.dart';

@freezed
sealed class EmployeeState with _$EmployeeState {
  const factory EmployeeState.initial() = EmployeeInitial;
  const factory EmployeeState.loading() = EmployeeLoading;
  const factory EmployeeState.loaded({
    required List<Employee> employees,
    required List<Employee> filtered,
    @Default(false) bool isLoadingMore,  // ← tambah
    @Default(false) bool hasReachedMax,  // ← tambah
    @Default(1) int currentPage,         // ← tambah
  }) = EmployeeLoaded;
  const factory EmployeeState.error(String message) = EmployeeError;
}