import 'package:dartz/dartz.dart';
import 'package:kud_shop/core/error/failure.dart';
import 'package:kud_shop/core/usecases/usecase.dart';
import '../entities/product_entity.dart';
import '../repositories/product_repository.dart';

class GetProducts extends UseCase<List<ProductEntity>, NoParams> {
  final ProductRepository repository;
  GetProducts(this.repository);

  @override
  Future<Either<Failure, List<ProductEntity>>> call(NoParams params) {
    return repository.getProducts();
  }
}