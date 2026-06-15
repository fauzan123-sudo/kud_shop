import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kud_shop/core/usecases/usecase.dart';
import 'package:kud_shop/src/admin/product/domain/usecases/get_products.dart';
import 'package:kud_shop/src/admin/product/domain/usecases/create_product.dart';
import 'package:kud_shop/src/admin/product/domain/usecases/update_product.dart';
import 'package:kud_shop/src/admin/product/domain/usecases/delete_product.dart';
import 'product_event.dart';
import 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProducts _getProducts;
  final CreateProduct _createProduct;
  final UpdateProduct _updateProduct;
  final DeleteProduct _deleteProduct;

  ProductBloc({
    required GetProducts getProducts,
    required CreateProduct createProduct,
    required UpdateProduct updateProduct,
    required DeleteProduct deleteProduct,
  })  : _getProducts = getProducts,
        _createProduct = createProduct,
        _updateProduct = updateProduct,
        _deleteProduct = deleteProduct,
        super(const ProductInitial()) {
    on<ProductLoad>(_onLoad);
    on<ProductCreate>(_onCreate);
    on<ProductUpdate>(_onUpdate);
    on<ProductDelete>(_onDelete);
  }

  Future<void> _onLoad(ProductLoad event, Emitter<ProductState> emit) async {
    emit(const ProductLoading());
    final result = await _getProducts(const NoParams());
    result.fold(
      (failure) => emit(ProductError(failure.message)),
      (products) => emit(ProductLoaded(products)),
    );
  }

  Future<void> _onCreate(
    ProductCreate event,
    Emitter<ProductState> emit,
  ) async {
    emit(const ProductLoading());
    final result = await _createProduct(
      CreateProductParams(
        categoryId: event.categoryId,
        name: event.name,
        description: event.description,
        price: event.price,
        stock: event.stock,
        imageUrl: event.imageUrl,
        unit: event.unit,
        isActive: event.isActive,
      ),
    );
    await result.fold(
      (failure) async => emit(ProductError(failure.message)),
      (_) async {
        final listResult = await _getProducts(const NoParams());
        listResult.fold(
          (failure) => emit(ProductError(failure.message)),
          (products) => emit(ProductActionSuccess(products)),
        );
      },
    );
  }

  Future<void> _onUpdate(
    ProductUpdate event,
    Emitter<ProductState> emit,
  ) async {
    emit(const ProductLoading());
    final result = await _updateProduct(
      UpdateProductParams(
        id: event.id,
        categoryId: event.categoryId,
        name: event.name,
        description: event.description,
        price: event.price,
        stock: event.stock,
        imageUrl: event.imageUrl,
        unit: event.unit,
        isActive: event.isActive,
      ),
    );
    await result.fold(
      (failure) async => emit(ProductError(failure.message)),
      (_) async {
        final listResult = await _getProducts(const NoParams());
        listResult.fold(
          (failure) => emit(ProductError(failure.message)),
          (products) => emit(ProductActionSuccess(products)),
        );
      },
    );
  }

  Future<void> _onDelete(
    ProductDelete event,
    Emitter<ProductState> emit,
  ) async {
    emit(const ProductLoading());
    final result = await _deleteProduct(DeleteProductParams(id: event.id));
    await result.fold(
      (failure) async => emit(ProductError(failure.message)),
      (_) async {
        final listResult = await _getProducts(const NoParams());
        listResult.fold(
          (failure) => emit(ProductError(failure.message)),
          (products) => emit(ProductActionSuccess(products)),
        );
      },
    );
  }
}