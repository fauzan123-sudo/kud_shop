import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:kud_shop/core/error/failure.dart';
import 'package:kud_shop/core/usecases/usecase.dart';
import '../repositories/product_repository.dart';

class DeleteProduct extends UseCase<void, DeleteProductParams> {
  final ProductRepository repository;
  DeleteProduct(this.repository);

  @override
  Future<Either<Failure, void>> call(DeleteProductParams params) {
    return repository.deleteProduct(id: params.id);
  }
}

class DeleteProductParams extends Equatable {
  final int id;
  const DeleteProductParams({required this.id});

  @override
  List<Object> get props => [id];
}
