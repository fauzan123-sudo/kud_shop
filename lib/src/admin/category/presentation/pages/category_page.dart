import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kud_shop/component/widgets/app_loading.dart';
import 'package:kud_shop/component/widgets/app_snackbar.dart';
import 'package:kud_shop/core/injection/injection.dart';
import 'package:kud_shop/src/admin/category/domain/entities/category_entity.dart';
import '../bloc/category_bloc.dart';
import '../bloc/category_event.dart';
import '../bloc/category_state.dart';
import '../widget/category_card.dart';
import '../widget/category_dialog.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<CategoryBloc>()..add(const CategoryEvent.load()),
      child: const _CategoryView(),
    );
  }
}

class _CategoryView extends StatelessWidget {
  const _CategoryView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text('Kelola Kategori'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showCategoryDialog(context),
        backgroundColor: Colors.blue.shade600,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: BlocConsumer<CategoryBloc, CategoryState>(
        listener: (context, state) {
          if (state is CategoryActionSuccess) {
            AppSnackbar.success(context, 'Berhasil');
          }
          if (state is CategoryError) {
            AppSnackbar.error(context, state.message);
          }
        },
        builder: (context, state) {
          if (state is CategoryLoading) {
            return const Center(child: AppLoadingIndicator(size: 36));
          }

          final categories = switch (state) {
            CategoryLoaded(:final categories) => categories,
            CategoryActionSuccess(:final categories) => categories,
            _ => <CategoryEntity>[],
          };

          if (categories.isEmpty &&
              state is! CategoryLoading &&
              state is! CategoryInitial) {
            return _buildEmpty();
          }

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: categories.length,
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              return CategoryCard(category: categories[index]);
            },
          );
        },
      ),
    );
  }

  Widget _buildEmpty() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.category_outlined, size: 64, color: Colors.grey.shade400),
          const SizedBox(height: 16),
          Text(
            'Belum ada kategori',
            style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
          ),
          const SizedBox(height: 8),
          Text(
            'Tap + untuk menambah kategori',
            style: TextStyle(fontSize: 13, color: Colors.grey.shade400),
          ),
        ],
      ),
    );
  }
}
