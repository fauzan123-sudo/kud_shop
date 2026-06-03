import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/employee.dart';

abstract class EmployeeRepository {
  Future<Either<Failure, List<Employee>>> getEmployees({int page = 1}); // ← tambah page
  Future<Either<Failure, Employee>> getEmployeeById(int id);
}