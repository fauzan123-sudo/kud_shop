import 'package:kud_shop/src/admin/product/data/models/product_model.dart';

abstract class ProductSupabaseDataSource {
  Future<List<ProductModel>> getProducts();
  Future<List<ProductModel>> getProductsByCategory(int categoryId);
  Future<ProductModel> getProductById(int id);
  Future<ProductModel> createProduct({
    required int? categoryId,
    required String name,
    String? description,
    required double price,
    required int stock,
    String? imageUrl,
    required String unit,
    required bool isActive,
  });
  Future<ProductModel> updateProduct({
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
  Future<void> deleteProduct({required int id});
}
