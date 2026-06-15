import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:kud_shop/core/error/failure.dart';
import 'package:kud_shop/core/usecases/usecase.dart';
import '../repositories/category_repository.dart';

class DeleteCategory extends UseCase<void, DeleteCategoryParams> {
  final CategoryRepository repository;
  DeleteCategory(this.repository);

  @override
  Future<Either<Failure, void>> call(DeleteCategoryParams params) {
    return repository.deleteCategory(id: params.id);
  }
}

class DeleteCategoryParams extends Equatable {
  final int id;
  const DeleteCategoryParams({required this.id});

  @override
  List<Object> get props => [id];
}