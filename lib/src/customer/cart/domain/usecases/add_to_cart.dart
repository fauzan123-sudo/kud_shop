import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:kud_shop/core/error/failure.dart';
import 'package:kud_shop/core/usecases/usecase.dart';
import '../repositories/cart_repository.dart';

class AddToCart extends UseCase<void, AddToCartParams> {
  final CartRepository repository;
  AddToCart(this.repository);

  @override
  Future<Either<Failure, void>> call(AddToCartParams params) {
    return repository.addToCart(
      productId: params.productId,
      quantity: params.quantity,
    );
  }
}

class AddToCartParams extends Equatable {
  final int productId;
  final int quantity;

  const AddToCartParams({required this.productId, this.quantity = 1});

  @override
  List<Object> get props => [productId, quantity];
}
