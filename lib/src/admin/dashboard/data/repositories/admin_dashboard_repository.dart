import 'package:dartz/dartz.dart';
import 'package:kud_shop/core/error/error_handler.dart';
import 'package:kud_shop/core/error/failure.dart';
import '../datasources/admin_dashboard_datasource.dart';

abstract class AdminDashboardRepository {
  Future<Either<Failure, DashboardStats>> getDashboardStats();
}

class AdminDashboardRepositoryImpl implements AdminDashboardRepository {
  final AdminDashboardDataSource dataSource;

  AdminDashboardRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, DashboardStats>> getDashboardStats() async {
    try {
      final result = await dataSource.getDashboardStats();
      return Right(result);
    } catch (e) {
      return handleError(e);
    }
  }
}