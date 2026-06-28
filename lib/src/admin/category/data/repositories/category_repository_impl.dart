import 'package:dartz/dartz.dart';
import 'package:kud_shop/core/error/exception.dart';
import 'package:kud_shop/core/error/failure.dart';
import 'package:kud_shop/src/admin/category/data/models/category_model.dart';
import 'package:kud_shop/src/admin/category/domain/entities/category_entity.dart';
import 'package:kud_shop/src/admin/category/domain/repositories/category_repository.dart';
import '../datasources/category_supabase_datasource.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategorySupabaseDataSource dataSource;

  CategoryRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories() async {
    try {
      final result = await dataSource.getCategories();
      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (_) {
      return const Left(ServerFailure('Terjadi kesalahan tidak diketahui'));
    }
  }

  @override
  Future<Either<Failure, CategoryEntity>> createCategory({
    required String name,
  }) async {
    try {
      final result = await dataSource.createCategory(name: name);
      return Right(result.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (_) {
      return const Left(ServerFailure('Terjadi kesalahan tidak diketahui'));
    }
  }

  @override
  Future<Either<Failure, CategoryEntity>> updateCategory({
    required int id,
    required String name,
  }) async {
    try {
      final result = await dataSource.updateCategory(id: id, name: name);
      return Right(result.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (_) {
      return const Left(ServerFailure('Terjadi kesalahan tidak diketahui'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteCategory({required int id}) async {
    try {
      await dataSource.deleteCategory(id: id);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (_) {
      return const Left(ServerFailure('Terjadi kesalahan tidak diketahui'));
    }
  }
}