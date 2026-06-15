import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:kud_shop/core/error/failure.dart';
import 'package:kud_shop/core/usecases/usecase.dart';
import '../entities/product_entity.dart';
import '../repositories/product_repository.dart';

class CreateProduct extends UseCase<ProductEntity, CreateProductParams> {
  final ProductRepository repository;
  CreateProduct(this.repository);

  @override
  Future<Either<Failure, ProductEntity>> call(CreateProductParams params) {
    return repository.createProduct(
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

class CreateProductParams extends Equatable {
  final int? categoryId;
  final String name;
  final String? description;
  final double price;
  final int stock;
  final String? imageUrl;
  final String unit;
  final bool isActive;

  const CreateProductParams({
    this.categoryId,
    required this.name,
    this.description,
    required this.price,
    required this.stock,
    this.imageUrl,
    required this.unit,
    this.isActive = true,
  });

  @override
  List<Object?> get props => [
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
