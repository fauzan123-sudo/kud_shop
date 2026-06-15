import 'package:kud_shop/core/error/exception.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/category_model.dart';

abstract class CategorySupabaseDataSource {
  Future<List<CategoryModel>> getCategories();
  Future<CategoryModel> createCategory({required String name});
  Future<CategoryModel> updateCategory({required int id, required String name});
  Future<void> deleteCategory({required int id});
}

class CategorySupabaseDataSourceImpl implements CategorySupabaseDataSource {
  final SupabaseClient supabase;

  CategorySupabaseDataSourceImpl(this.supabase);

  @override
  Future<List<CategoryModel>> getCategories() async {
    try {
      final response = await supabase
          .from('categories')
          .select()
          .order('name', ascending: true);

      return (response as List)
          .map((json) => CategoryModel.fromJson(json))
          .toList();
    } catch (e) {
      throw ServerException(message: 'Gagal mengambil data kategori');
    }
  }

  @override
  Future<CategoryModel> createCategory({required String name}) async {
    try {
      final response = await supabase
          .from('categories')
          .insert({'name': name})
          .select()
          .single();

      return CategoryModel.fromJson(response);
    } catch (e) {
      throw ServerException(message: 'Gagal menambah kategori');
    }
  }

  @override
  Future<CategoryModel> updateCategory({
    required int id,
    required String name,
  }) async {
    try {
      final response = await supabase
          .from('categories')
          .update({'name': name})
          .eq('id', id)
          .select()
          .single();

      return CategoryModel.fromJson(response);
    } catch (e) {
      throw ServerException(message: 'Gagal mengubah kategori');
    }
  }

  @override
  Future<void> deleteCategory({required int id}) async {
    try {
      await supabase.from('categories').delete().eq('id', id);
    } catch (e) {
      throw ServerException(message: 'Gagal menghapus kategori');
    }
  }
}