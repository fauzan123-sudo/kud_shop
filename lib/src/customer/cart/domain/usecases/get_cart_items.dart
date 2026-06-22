import 'package:dartz/dartz.dart';
import 'package:kud_shop/core/error/failure.dart';
import 'package:kud_shop/core/usecases/usecase.dart';
import '../entities/cart_item_entity.dart';
import '../repositories/cart_repository.dart';

class GetCartItems extends UseCase<List<CartItemEntity>, NoParams> {
  final CartRepository repository;
  GetCartItems(this.repository);

  @override
  Future<Either<Failure, List<CartItemEntity>>> call(NoParams params) {
    return repository.getCartItems();
  }
}
