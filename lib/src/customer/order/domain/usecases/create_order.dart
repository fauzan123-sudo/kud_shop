import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:kud_shop/core/error/failure.dart';
import 'package:kud_shop/core/usecases/usecase.dart';
import 'package:kud_shop/src/customer/cart/domain/entities/cart_item_entity.dart';
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
      isBuyNow: params.isBuyNow,
      buyNowProductId: params.buyNowProductId,
      buyNowQuantity: params.buyNowQuantity,
      selectedCartItemIds: params.selectedCartItemIds,
      cartItems: params.cartItems,
    );
  }
}

class CreateOrderParams extends Equatable {
  final int addressId;
  final String deliveryMethod;
  final String paymentMethod;
  final String? notes;
  final bool isBuyNow;
  final int? buyNowProductId;
  final int? buyNowQuantity;
  final List<int> selectedCartItemIds;
  final List<CartItemEntity> cartItems;

  const CreateOrderParams({
    required this.addressId,
    required this.deliveryMethod,
    required this.paymentMethod,
    this.notes,
    this.isBuyNow = false,      
    this.buyNowProductId,
    this.buyNowQuantity,
    this.selectedCartItemIds = const [],
    this.cartItems = const [],
  });

  @override
  List<Object?> get props => [
    addressId,
    deliveryMethod,
    paymentMethod,
    notes,
    isBuyNow,
    buyNowProductId,
    buyNowQuantity,
  ];
}