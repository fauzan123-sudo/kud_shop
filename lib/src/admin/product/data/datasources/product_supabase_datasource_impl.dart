import 'package:kud_shop/core/error/exception.dart';
import 'package:kud_shop/src/admin/product/data/datasources/product_supabase_datasource.dart';
import 'package:kud_shop/src/admin/product/data/models/product_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


class ProductSupabaseDataSourceImpl implements ProductSupabaseDataSource {
  final SupabaseClient supabase;

  ProductSupabaseDataSourceImpl(this.supabase);

  @override
  Future<List<ProductModel>> getProducts() async {
    try {
      final response = await supabase
          .from('products')
          .select()
          .order('name', ascending: true);

      return (response as List)
          .map((json) => ProductModel.fromJson(json))
          .toList();
    } catch (e) {
      throw ServerException(message: 'Gagal mengambil data produk');
    }
  }

  @override
  Future<List<ProductModel>> getProductsByCategory(int categoryId) async {
    try {
      final response = await supabase
          .from('products')
          .select()
          .eq('category_id', categoryId)
          .order('name', ascending: true);

      return (response as List)
          .map((json) => ProductModel.fromJson(json))
          .toList();
    } catch (e) {
      throw ServerException(message: 'Gagal mengambil data produk');
    }
  }

  @override
  Future<ProductModel> getProductById(int id) async {
    try {
      final response = await supabase
          .from('products')
          .select()
          .eq('id', id)
          .single();

      return ProductModel.fromJson(response);
    } catch (e) {
      throw ServerException(message: 'Produk tidak ditemukan');
    }
  }

  @override
  Future<ProductModel> createProduct({
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
      final response = await supabase
          .from('products')
          .insert({
            'category_id': categoryId,
            'name': name,
            'description': description,
            'price': price,
            'stock': stock,
            'image_url': imageUrl,
            'unit': unit,
            'is_active': isActive,
          })
          .select()
          .single();

      return ProductModel.fromJson(response);
    } catch (e) {
      throw ServerException(message: 'Gagal menambah produk');
    }
  }

  @override
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
  }) async {
    try {
      final response = await supabase
          .from('products')
          .update({
            'category_id': categoryId,
            'name': name,
            'description': description,
            'price': price,
            'stock': stock,
            'image_url': imageUrl,
            'unit': unit,
            'is_active': isActive,
            'updated_at': DateTime.now().toIso8601String(),
          })
          .eq('id', id)
          .select()
          .single();

      return ProductModel.fromJson(response);
    } catch (e) {
      throw ServerException(message: 'Gagal mengubah produk');
    }
  }

  @override
  Future<void> deleteProduct({required int id}) async {
    try {
      await supabase.from('products').delete().eq('id', id);
    } catch (e) {
      throw ServerException(message: 'Gagal menghapus produk');
    }
  }
}
