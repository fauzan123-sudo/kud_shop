import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/employee.dart';

part 'employee_model.freezed.dart';
part 'employee_model.g.dart';

@freezed
abstract class EmployeeModel with _$EmployeeModel {
  const factory EmployeeModel({
    required int    id,
    @JsonKey(name: 'firstName') required String firstName,
    @JsonKey(name: 'lastName')  required String lastName,
    required String email,
    required String phone,
    required String image,
    @JsonKey(name: 'company') required Map<String, dynamic> company,
  }) = _EmployeeModel;

  factory EmployeeModel.fromJson(Map<String, dynamic> json) =>
      _$EmployeeModelFromJson(json);
}

extension EmployeeModelX on EmployeeModel {
  Employee toEntity() => Employee(
        id:         id,
        name:       '$firstName $lastName'.trim(),
        email:      email,
        phone:      phone,
        position:   (company['title']      as String?) ?? '',
        department: (company['department'] as String?) ?? '',
        avatarUrl:  image,
        isActive:   true,
      );
}