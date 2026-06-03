import 'package:dartz/dartz.dart';
import 'package:flutter_ui_playground/core/error/exception.dart';
import 'package:flutter_ui_playground/src/employee/data/datasources/employee_local_datasource.dart';
import '../../../../core/error/error_handler.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/employee.dart';
import '../../domain/repositories/employee_repository.dart';
import '../datasources/employee_remote_datasource.dart';
import '../models/employee_model.dart';

class EmployeeRepositoryImpl implements EmployeeRepository {
  final EmployeeRemoteDataSource remoteDataSource;
  final EmployeeLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  EmployeeRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Employee>>> getEmployees({int page = 1}) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await remoteDataSource.getEmployees(page: page);
        // ← hanya cache halaman pertama
        if (page == 1) await localDataSource.cacheEmployees(result);
        return Right(result.map((e) => e.toEntity()).toList());
      } catch (e) {
        return handleError(e);
      }
    } else {
      try {
        // ← offline hanya bisa halaman pertama dari cache
        final cached = await localDataSource.getCachedEmployees();
        return Right(cached.map((e) => e.toEntity()).toList());
      } on CacheException {
        return const Left(CacheFailure());
      } catch (e) {
        return handleError(e);
      }
    }
  }

  @override
  Future<Either<Failure, Employee>> getEmployeeById(int id) async {
    if (!await networkInfo.isConnected) return const Left(NetworkFailure());
    try {
      final result = await remoteDataSource.getEmployeeById(id);
      return Right(result.toEntity());
    } catch (e) {
      return handleError(e);
    }
  }
}
