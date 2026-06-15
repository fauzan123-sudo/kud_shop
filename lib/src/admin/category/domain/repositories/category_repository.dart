import 'package:dartz/dartz.dart';
import 'package:kud_shop/core/error/failure.dart';
import '../entities/category_entity.dart';

abstract class CategoryRepository {
  Future<Either<Failure, List<CategoryEntity>>> getCategories();

  Future<Either<Failure, CategoryEntity>> createCategory({
    required String name,
  });

  Future<Either<Failure, CategoryEntity>> updateCategory({
    required int id,
    required String name,
  });

  Future<Either<Failure, void>> deleteCategory({required int id});
}