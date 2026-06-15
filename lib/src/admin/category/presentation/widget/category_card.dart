import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kud_shop/src/admin/category/domain/entities/category_entity.dart';
import 'package:kud_shop/src/admin/category/presentation/bloc/category_bloc.dart';
import 'package:kud_shop/src/admin/category/presentation/bloc/category_event.dart';
import 'category_dialog.dart';

class CategoryCard extends StatelessWidget {
  final CategoryEntity category;

  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(10),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        leading: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(Icons.category, color: Colors.blue.shade600),
        ),
        title: Text(
          category.name,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // ─── Edit ────────────────────────────────────
            IconButton(
              icon: Icon(Icons.edit_outlined, color: Colors.blue.shade600),
              onPressed: () => showCategoryDialog(context, category: category),
            ),
            // ─── Delete ──────────────────────────────────
            IconButton(
              icon: const Icon(Icons.delete_outline, color: Colors.red),
              onPressed: () => _showDeleteConfirm(context),
            ),
          ],
        ),
      ),
    );
  }

  void _showDeleteConfirm(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Hapus Kategori'),
        content: Text('Yakin ingin menghapus kategori "${category.name}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<CategoryBloc>().add(
                CategoryEvent.delete(id: category.id),
              );
              Navigator.pop(dialogContext);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: const Text('Hapus'),
          ),
        ],
      ),
    );
  }
}
