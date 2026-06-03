import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/employee.dart';

part 'employee_detail_state.freezed.dart';

@freezed
sealed class EmployeeDetailState with _$EmployeeDetailState {
  const factory EmployeeDetailState.initial() = EmployeeDetailInitial;
  const factory EmployeeDetailState.loading() = EmployeeDetailLoading;
  const factory EmployeeDetailState.loaded(Employee employee) =
      EmployeeDetailLoaded;
  const factory EmployeeDetailState.error(String message) = EmployeeDetailError;
}
