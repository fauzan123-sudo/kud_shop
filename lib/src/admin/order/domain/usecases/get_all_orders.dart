import 'package:dartz/dartz.dart';
import 'package:kud_shop/core/error/failure.dart';
import 'package:kud_shop/core/usecases/usecase.dart';
import 'package:kud_shop/src/customer/order/domain/entities/order_entity.dart';
import '../repositories/admin_order_repository.dart';

class GetAllOrders extends UseCase<List<OrderEntity>, NoParams> {
  final AdminOrderRepository repository;
  GetAllOrders(this.repository);

  @override
  Future<Either<Failure, List<OrderEntity>>> call(NoParams params) {
    return repository.getAllOrders();
  }
}