import 'package:freezed_annotation/freezed_annotation.dart';

part 'employee_event.freezed.dart';

@freezed
sealed class EmployeeEvent with _$EmployeeEvent {
  const factory EmployeeEvent.getEmployees()       = GetEmployeesEvent;
   const factory EmployeeEvent.loadMore()          = LoadMoreEmployeesEvent;
  const factory EmployeeEvent.search(String query) = SearchEmployeeEvent;
}