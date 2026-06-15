import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kud_shop/core/usecases/usecase.dart';
import 'package:kud_shop/src/admin/category/domain/usecases/get_categories.dart';
import 'package:kud_shop/src/admin/category/domain/usecases/create_category.dart';
import 'package:kud_shop/src/admin/category/domain/usecases/update_category.dart';
import 'package:kud_shop/src/admin/category/domain/usecases/delete_category.dart';
import 'category_event.dart';
import 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final GetCategories _getCategories;
  final CreateCategory _createCategory;
  final UpdateCategory _updateCategory;
  final DeleteCategory _deleteCategory;

  CategoryBloc({
    required GetCategories getCategories,
    required CreateCategory createCategory,
    required UpdateCategory updateCategory,
    required DeleteCategory deleteCategory,
  }) : _getCategories = getCategories,
       _createCategory = createCategory,
       _updateCategory = updateCategory,
       _deleteCategory = deleteCategory,
       super(const CategoryInitial()) {
    on<CategoryLoad>(_onLoad);
    on<CategoryCreate>(_onCreate);
    on<CategoryUpdate>(_onUpdate);
    on<CategoryDelete>(_onDelete);
  }

  Future<void> _onLoad(CategoryLoad event, Emitter<CategoryState> emit) async {
    emit(const CategoryLoading());
    final result = await _getCategories(const NoParams());
    result.fold(
      (failure) => emit(CategoryError(failure.message)),
      (categories) => emit(CategoryLoaded(categories)),
    );
  }

  Future<void> _onCreate(
    CategoryCreate event,
    Emitter<CategoryState> emit,
  ) async {
    emit(const CategoryLoading());
    final result = await _createCategory(
      CreateCategoryParams(name: event.name),
    );
    await result.fold((failure) async => emit(CategoryError(failure.message)), (
      _,
    ) async {
      final listResult = await _getCategories(const NoParams());
      listResult.fold(
        (failure) => emit(CategoryError(failure.message)),
        (categories) => emit(CategoryActionSuccess(categories)),
      );
    });
  }

  Future<void> _onUpdate(
    CategoryUpdate event,
    Emitter<CategoryState> emit,
  ) async {
    emit(const CategoryLoading());
    final result = await _updateCategory(
      UpdateCategoryParams(id: event.id, name: event.name),
    );
    await result.fold((failure) async => emit(CategoryError(failure.message)), (
      _,
    ) async {
      final listResult = await _getCategories(const NoParams());
      listResult.fold(
        (failure) => emit(CategoryError(failure.message)),
        (categories) => emit(CategoryActionSuccess(categories)),
      );
    });
  }

  Future<void> _onDelete(
    CategoryDelete event,
    Emitter<CategoryState> emit,
  ) async {
    emit(const CategoryLoading());
    final result = await _deleteCategory(DeleteCategoryParams(id: event.id));
    await result.fold((failure) async => emit(CategoryError(failure.message)), (
      _,
    ) async {
      final listResult = await _getCategories(const NoParams());
      listResult.fold(
        (failure) => emit(CategoryError(failure.message)),
        (categories) => emit(CategoryActionSuccess(categories)),
      );
    });
  }
}
