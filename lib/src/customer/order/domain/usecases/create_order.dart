import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:kud_shop/core/error/failure.dart';
import 'package:kud_shop/core/usecases/usecase.dart';
import '../entities/order_entity.dart';
import '../repositories/order_repository.dart';

class CreateOrder extends UseCase<OrderEntity, CreateOrderParams> {
  final OrderRepository repository;
  CreateOrder(this.repository);

  @override
  Future<Either<Failure, OrderEntity>> call(CreateOrderParams params) {
    return repository.createOrder(
      addressId: params.addressId,
      deliveryMethod: params.deliveryMethod,
      paymentMethod: params.paymentMethod,
      notes: params.notes,
    );
  }
}

class CreateOrderParams extends Equatable {
  final int addressId;
  final String deliveryMethod;
  final String paymentMethod;
  final String? notes;

  const CreateOrderParams({
    required this.addressId,
    required this.deliveryMethod,
    required this.paymentMethod,
    this.notes,
  });

  @override
  List<Object?> get props => [addressId, deliveryMethod, paymentMethod, notes];
}