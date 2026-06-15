import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:kud_shop/core/error/failure.dart';
import 'package:kud_shop/core/usecases/usecase.dart';
import '../entities/category_entity.dart';
import '../repositories/category_repository.dart';

class CreateCategory extends UseCase<CategoryEntity, CreateCategoryParams> {
  final CategoryRepository repository;
  CreateCategory(this.repository);

  @override
  Future<Either<Failure, CategoryEntity>> call(CreateCategoryParams params) {
    return repository.createCategory(name: params.name);
  }
}

class CreateCategoryParams extends Equatable {
  final String name;
  const CreateCategoryParams({required this.name});

  @override
  List<Object> get props => [name];
}