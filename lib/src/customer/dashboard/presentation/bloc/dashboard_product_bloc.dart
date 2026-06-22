import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kud_shop/core/usecases/usecase.dart';
import 'package:kud_shop/src/admin/product/domain/entities/product_entity.dart';
import 'package:kud_shop/src/admin/product/domain/usecases/get_products.dart';
import 'dashboard_product_event.dart';
import 'dashboard_product_state.dart';

class DashboardProductBloc
    extends Bloc<DashboardProductEvent, DashboardProductState> {
  final GetProducts _getProducts;

  DashboardProductBloc({required GetProducts getProducts})
    : _getProducts = getProducts,
      super(const DashboardProductInitial()) {
    on<DashboardProductLoad>(_onLoad);
    on<DashboardProductSearchChanged>(_onSearchChanged);
  }

  Future<void> _onLoad(
    DashboardProductLoad event,
    Emitter<DashboardProductState> emit,
  ) async {
    emit(const DashboardProductLoading());
    final result = await _getProducts(const NoParams());
    result.fold((failure) => emit(DashboardProductError(failure.message)), (
      products,
    ) {
      // Hanya tampilkan produk yang aktif & ada stok untuk customer
      final available = products.where((p) => p.isActive).toList();
      emit(
        DashboardProductLoaded(
          allProducts: available,
          filteredProducts: available,
        ),
      );
    });
  }

  void _onSearchChanged(
    DashboardProductSearchChanged event,
    Emitter<DashboardProductState> emit,
  ) {
    final current = state;
    if (current is! DashboardProductLoaded) return;

    final query = event.query.trim().toLowerCase();

    final filtered = query.isEmpty
        ? current.allProducts
        : current.allProducts
              .where((p) => p.name.toLowerCase().contains(query))
              .toList();

    emit(current.copyWith(filteredProducts: filtered, query: event.query));
  }
}

// Re-export supaya import-nya tetap rapi di file lain
typedef ProductEntityList = List<ProductEntity>;
