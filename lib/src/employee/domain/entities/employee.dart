import 'package:freezed_annotation/freezed_annotation.dart';
part 'employee.freezed.dart';

@freezed
abstract class Employee with _$Employee {
  const factory Employee({
    required int    id,
    required String name,
    required String email,
    required String phone,
    required String position,
    required String department,
    required String avatarUrl,
    required bool   isActive,
  }) = _Employee;
}