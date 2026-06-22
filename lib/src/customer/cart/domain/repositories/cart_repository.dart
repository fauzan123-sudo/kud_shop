import 'package:dartz/dartz.dart';
import 'package:kud_shop/core/error/failure.dart';
import '../entities/cart_item_entity.dart';

abstract class CartRepository {
  Future<Either<Failure, List<CartItemEntity>>> getCartItems();

  Future<Either<Failure, void>> addToCart({
    required int productId,
    required int quantity,
  });

  Future<Either<Failure, void>> updateQuantity({
    required int cartItemId,
    required int quantity,
  });

  Future<Either<Failure, void>> removeFromCart({required int cartItemId});

  Future<Either<Failure, void>> clearCart();
}
