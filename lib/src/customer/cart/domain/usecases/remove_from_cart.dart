import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:kud_shop/core/error/failure.dart';
import 'package:kud_shop/core/usecases/usecase.dart';
import '../repositories/cart_repository.dart';

class RemoveFromCart extends UseCase<void, RemoveFromCartParams> {
  final CartRepository repository;
  RemoveFromCart(this.repository);

  @override
  Future<Either<Failure, void>> call(RemoveFromCartParams params) {
    return repository.removeFromCart(cartItemId: params.cartItemId);
  }
}

class RemoveFromCartParams extends Equatable {
  final int cartItemId;
  const RemoveFromCartParams({required this.cartItemId});

  @override
  List<Object> get props => [cartItemId];
}
