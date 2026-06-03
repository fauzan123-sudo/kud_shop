import 'package:freezed_annotation/freezed_annotation.dart';

part 'employee_detail_event.freezed.dart';

@freezed
sealed class EmployeeDetailEvent with _$EmployeeDetailEvent {
  const factory EmployeeDetailEvent.getDetail(int id) = GetEmployeeDetailEvent;
}