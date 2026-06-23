import 'package:dartz/dartz.dart';
import 'package:kud_shop/core/error/failure.dart';
import 'package:kud_shop/src/customer/order/domain/entities/order_entity.dart';

abstract class AdminOrderRepository {
  Future<Either<Failure, List<OrderEntity>>> getAllOrders();

  Future<Either<Failure, OrderEntity>> updateOrderStatus({
    required int orderId,
    required String status,
  });
}