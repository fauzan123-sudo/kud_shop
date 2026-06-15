import 'package:dartz/dartz.dart';
import 'package:kud_shop/core/error/failure.dart';
import '../entities/product_entity.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<ProductEntity>>> getProducts();
  Future<Either<Failure, List<ProductEntity>>> getProductsByCategory(int categoryId);
  Future<Either<Failure, ProductEntity>> getProductById(int id);
  Future<Either<Failure, ProductEntity>> createProduct({
    required int? categoryId,
    required String name,
    String? description,
    required double price,
    required int stock,
    String? imageUrl,
    required String unit,
    required bool isActive,
  });
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
  });
  Future<Either<Failure, void>> deleteProduct({required int id});
}