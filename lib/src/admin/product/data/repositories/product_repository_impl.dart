import 'package:dartz/dartz.dart';
import 'package:kud_shop/core/error/exception.dart';
import 'package:kud_shop/core/error/failure.dart';
import 'package:kud_shop/src/admin/product/domain/entities/product_entity.dart';
import 'package:kud_shop/src/admin/product/domain/repositories/product_repository.dart';
import '../datasources/product_supabase_datasource.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductSupabaseDataSource dataSource;

  ProductRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      final result = await dataSource.getProducts();
      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (_) {
      return const Left(ServerFailure('Terjadi kesalahan tidak diketahui'));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProductsByCategory(
    int categoryId,
  ) async {
    try {
      final result = await dataSource.getProductsByCategory(categoryId);
      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (_) {
      return const Left(ServerFailure('Terjadi kesalahan tidak diketahui'));
    }
  }

  @override
  Future<Either<Failure, ProductEntity>> getProductById(int id) async {
    try {
      final result = await dataSource.getProductById(id);
      return Right(result.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (_) {
      return const Left(ServerFailure('Terjadi kesalahan tidak diketahui'));
    }
  }

  @override
  Future<Either<Failure, ProductEntity>> createProduct({
    required int? categoryId,
    required String name,
    String? description,
    required double price,
    required int stock,
    String? imageUrl,
    required String unit,
    required bool isActive,
  }) async {
    try {
      final result = await dataSource.createProduct(
        categoryId: categoryId,
        name: name,
        description: description,
        price: price,
        stock: stock,
        imageUrl: imageUrl,
        unit: unit,
        isActive: isActive,
      );
      return Right(result.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (_) {
      return const Left(ServerFailure('Terjadi kesalahan tidak diketahui'));
    }
  }

  @override
  Future<Either<Failure, ProductEntity>> updateProduct({
    required int id,
    required int? categoryId,
    required String name,
    String? description,
    required double price,
    required int stock,
    String? imageUrl,
    required String unit,
    required bool isActive,
  }) async {
    try {
      final result = await dataSource.updateProduct(
        id: id,
        categoryId: categoryId,
        name: name,
        description: description,
        price: price,
        stock: stock,
        imageUrl: imageUrl,
        unit: unit,
        isActive: isActive,
      );
      return Right(result.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (_) {
      return const Left(ServerFailure('Terjadi kesalahan tidak diketahui'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteProduct({required int id}) async {
    try {
      await dataSource.deleteProduct(id: id);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (_) {
      return const Left(ServerFailure('Terjadi kesalahan tidak diketahui'));
    }
  }
}
