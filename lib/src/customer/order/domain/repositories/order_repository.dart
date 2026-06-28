import 'package:dartz/dartz.dart';
import 'package:kud_shop/core/error/failure.dart';
import 'package:kud_shop/src/customer/cart/domain/entities/cart_item_entity.dart';
import '../entities/order_entity.dart';

abstract class OrderRepository {
  Future<Either<Failure, OrderEntity>> createOrder({
    required int addressId,
    required String deliveryMethod,
    required String paymentMethod,
    String? notes,
    bool isBuyNow = false,
    int? buyNowProductId,
    int? buyNowQuantity,
    List<int> selectedCartItemIds = const [],
    List<CartItemEntity> cartItems = const [],
  });
 
  Future<Either<Failure, List<OrderEntity>>> getMyOrders();
 
  Future<Either<Failure, OrderEntity>> getOrderById(int id);
 
  Future<Either<Failure, String>> uploadPaymentProof({
    required int orderId,
    required List<int> imageBytes,
  });
}