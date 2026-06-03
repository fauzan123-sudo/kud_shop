import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/employee.dart';
import '../repositories/employee_repository.dart';
import 'package:equatable/equatable.dart';

class GetEmployeeByIdParams extends Equatable {
  final int id;
  const GetEmployeeByIdParams(this.id);

  @override
  List<Object> get props => [id];
}

class GetEmployeeById extends UseCase<Employee, GetEmployeeByIdParams> {
  final EmployeeRepository repository;
  GetEmployeeById(this.repository);

  @override
  Future<Either<Failure, Employee>> call(GetEmployeeByIdParams params) {
    return repository.getEmployeeById(params.id);
  }
}
