import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:kud_shop/core/error/failure.dart';
import 'package:kud_shop/core/usecases/usecase.dart';
import '../entities/category_entity.dart';
import '../repositories/category_repository.dart';

class UpdateCategory extends UseCase<CategoryEntity, UpdateCategoryParams> {
  final CategoryRepository repository;
  UpdateCategory(this.repository);

  @override
  Future<Either<Failure, CategoryEntity>> call(UpdateCategoryParams params) {
    return repository.updateCategory(id: params.id, name: params.name);
  }
}

class UpdateCategoryParams extends Equatable {
  final int id;
  final String name;
  const UpdateCategoryParams({required this.id, required this.name});

  @override
  List<Object> get props => [id, name];
}