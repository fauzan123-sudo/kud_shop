import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:kud_shop/core/error/failure.dart';
import 'package:kud_shop/core/usecases/usecase.dart';
import '../entities/product_entity.dart';
import '../repositories/product_repository.dart';

class UpdateProduct extends UseCase<ProductEntity, UpdateProductParams> {
  final ProductRepository repository;
  UpdateProduct(this.repository);

  @override
  Future<Either<Failure, ProductEntity>> call(UpdateProductParams params) {
    return repository.updateProduct(
      id: params.id,
      categoryId: params.categoryId,
      name: params.name,
      description: params.description,
      price: params.price,
      stock: params.stock,
      imageUrl: params.imageUrl,
      unit: params.unit,
      isActive: params.isActive,
    );
  }
}

class UpdateProductParams extends Equatable {
  final int id;
  final int? categoryId;
  final String name;
  final String? description;
  final double price;
  final int stock;
  final String? imageUrl;
  final String unit;
  final bool isActive;

  const UpdateProductParams({
    required this.id,
    this.categoryId,
    required this.name,
    this.description,
    required this.price,
    required this.stock,
    this.imageUrl,
    required this.unit,
    required this.isActive,
  });

  @override
  List<Object?> get props => [
    id,
    categoryId,
    name,
    description,
    price,
    stock,
    imageUrl,
    unit,
    isActive,
  ];
}
