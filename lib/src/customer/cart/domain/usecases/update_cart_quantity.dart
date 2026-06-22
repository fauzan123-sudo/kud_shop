import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:kud_shop/core/error/failure.dart';
import 'package:kud_shop/core/usecases/usecase.dart';
import '../repositories/cart_repository.dart';

class UpdateCartQuantity extends UseCase<void, UpdateCartQuantityParams> {
  final CartRepository repository;
  UpdateCartQuantity(this.repository);

  @override
  Future<Either<Failure, void>> call(UpdateCartQuantityParams params) {
    return repository.updateQuantity(
      cartItemId: params.cartItemId,
      quantity: params.quantity,
    );
  }
}

class UpdateCartQuantityParams extends Equatable {
  final int cartItemId;
  final int quantity;

  const UpdateCartQuantityParams({
    required this.cartItemId,
    required this.quantity,
  });

  @override
  List<Object> get props => [cartItemId, quantity];
}
