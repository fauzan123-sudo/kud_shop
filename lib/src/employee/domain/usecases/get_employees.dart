import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/employee.dart';
import '../repositories/employee_repository.dart';

class GetEmployeesParams extends Equatable {
  final int page;
  const GetEmployeesParams({this.page = 1});

  @override
  List<Object> get props => [page];
}

class GetEmployees extends UseCase<List<Employee>, GetEmployeesParams> {
  final EmployeeRepository repository;
  GetEmployees(this.repository);

  @override
  Future<Either<Failure, List<Employee>>> call(GetEmployeesParams params) {
    return repository.getEmployees(page: params.page);
  }
}
