import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kud_shop/src/admin/category/domain/entities/category_entity.dart';
import 'package:kud_shop/src/admin/category/presentation/bloc/category_bloc.dart';
import 'package:kud_shop/src/admin/category/presentation/bloc/category_event.dart';

class CategoryDialog extends StatefulWidget {
  final CategoryEntity? category; 

  const CategoryDialog({super.key, this.category});

  @override
  State<CategoryDialog> createState() => _CategoryDialogState();
}

class _CategoryDialogState extends State<CategoryDialog> {
  late final TextEditingController _controller;
  bool get _isEdit => widget.category != null;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.category?.name ?? '');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onSubmit() {
    final name = _controller.text.trim();
    if (name.isEmpty) return;

    if (_isEdit) {
      context.read<CategoryBloc>().add(
        CategoryEvent.update(id: widget.category!.id, name: name),
      );
    } else {
      context.read<CategoryBloc>().add(CategoryEvent.create(name: name));
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(_isEdit ? 'Edit Kategori' : 'Tambah Kategori'),
      content: TextField(
        controller: _controller,
        autofocus: true,
        textCapitalization: TextCapitalization.words,
        onSubmitted: (_) => _onSubmit(),
        decoration: InputDecoration(
          hintText: 'Nama kategori',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Batal'),
        ),
        ElevatedButton(
          onPressed: _onSubmit,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue.shade600,
            foregroundColor: Colors.white,
          ),
          child: Text(_isEdit ? 'Simpan' : 'Tambah'),
        ),
      ],
    );
  }
}

// ─── Helper function untuk show dialog ────────────────────────
void showCategoryDialog(BuildContext context, {CategoryEntity? category}) {
  showDialog(
    context: context,
    builder: (_) => BlocProvider.value(
      value: context.read<CategoryBloc>(),
      child: CategoryDialog(category: category),
    ),
  );
}
