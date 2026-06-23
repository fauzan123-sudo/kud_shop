import 'package:dartz/dartz.dart';
import 'package:kud_shop/core/error/error_handler.dart';
import 'package:kud_shop/core/error/failure.dart';
import 'package:kud_shop/src/admin/order/data/datasouces/admin_order_datasource.dart';
import 'package:kud_shop/src/customer/order/domain/entities/order_entity.dart';
import '../../domain/repositories/admin_order_repository.dart';

class AdminOrderRepositoryImpl implements AdminOrderRepository {
  final AdminOrderDataSource dataSource;

  AdminOrderRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, List<OrderEntity>>> getAllOrders() async {
    try {
      final result = await dataSource.getAllOrders();
      return Right(result);
    } catch (e) {
      return handleError(e);
    }
  }

  @override
  Future<Either<Failure, OrderEntity>> updateOrderStatus({
    required int orderId,
    required String status,
  }) async {
    try {
      final result = await dataSource.updateOrderStatus(
        orderId: orderId,
        status: status,
      );
      return Right(result);
    } catch (e) {
      return handleError(e);
    }
  }
}
