import 'package:dartz/dartz.dart';
import 'package:kud_shop/core/error/failure.dart';
import 'package:kud_shop/core/usecases/usecase.dart';
import 'package:kud_shop/src/customer/order/domain/entities/order_entity.dart';
import '../repositories/admin_order_repository.dart';

class UpdateOrderStatus extends UseCase<OrderEntity, UpdateOrderStatusParams> {
  final AdminOrderRepository repository;
  UpdateOrderStatus(this.repository);

  @override
  Future<Either<Failure, OrderEntity>> call(UpdateOrderStatusParams params) {
    return repository.updateOrderStatus(
      orderId: params.orderId,
      status: params.status,
    );
  }
}

class UpdateOrderStatusParams {
  final int orderId;
  final String status;

  const UpdateOrderStatusParams({
    required this.orderId,
    required this.status,
  });
}