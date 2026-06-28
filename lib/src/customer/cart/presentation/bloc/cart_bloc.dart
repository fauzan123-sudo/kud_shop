import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kud_shop/core/usecases/usecase.dart';
import '../../domain/usecases/get_cart_items.dart';
import '../../domain/usecases/add_to_cart.dart';
import '../../domain/usecases/update_cart_quantity.dart';
import '../../domain/usecases/remove_from_cart.dart';
import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final GetCartItems _getCartItems;
  final AddToCart _addToCart;
  final UpdateCartQuantity _updateCartQuantity;
  final RemoveFromCart _removeFromCart;

  CartBloc({
    required GetCartItems getCartItems,
    required AddToCart addToCart,
    required UpdateCartQuantity updateCartQuantity,
    required RemoveFromCart removeFromCart,
  }) : _getCartItems = getCartItems,
       _addToCart = addToCart,
       _updateCartQuantity = updateCartQuantity,
       _removeFromCart = removeFromCart,
       super(const CartState.initial()) {
    on<CartLoad>(_onLoad);
    on<CartAddItem>(_onAddItem);
    on<CartUpdateQuantity>(_onUpdateQuantity);
    on<CartRemoveItem>(_onRemoveItem);
    on<CartToggleSelect>(_onToggleSelect);
    on<CartSelectAll>(_onSelectAll);
  }

  Future<void> _onLoad(CartLoad event, Emitter<CartState> emit) async {
    emit(const CartState.loading());
    final result = await _getCartItems(const NoParams());
    result.fold(
      (failure) => emit(CartState.error(failure.message)),
      (items) => emit(CartState.loaded(items)),
    );
  }

  Future<void> _onAddItem(CartAddItem event, Emitter<CartState> emit) async {
    final result = await _addToCart(
      AddToCartParams(productId: event.productId, quantity: event.quantity),
    );
    await result.fold(
      (failure) async => emit(CartState.error(failure.message)),
      (_) async => _onLoad(const CartLoad(), emit),
    );
  }

  Future<void> _onUpdateQuantity(
    CartUpdateQuantity event,
    Emitter<CartState> emit,
  ) async {
    if (event.quantity <= 0) {
      return _onRemoveItem(CartRemoveItem(cartItemId: event.cartItemId), emit);
    }

    final current = state;
    if (current is CartLoaded) {
      final updatedItems = current.items.map((item) {
        if (item.id == event.cartItemId) {
          return item.copyWith(quantity: event.quantity);
        }
        return item;
      }).toList();
      emit(current.copyWithSelected(items: updatedItems));
    }

    final result = await _updateCartQuantity(
      UpdateCartQuantityParams(
        cartItemId: event.cartItemId,
        quantity: event.quantity,
      ),
    );

    result.fold((failure) => emit(CartState.error(failure.message)), (_) {});
  }

  Future<void> _onRemoveItem(
    CartRemoveItem event,
    Emitter<CartState> emit,
  ) async {
    final currentSelected = state is CartLoaded
        ? (state as CartLoaded).selectedIds
              .where((id) => id != event.cartItemId)
              .toSet()
        : <int>{};

    final result = await _removeFromCart(
      RemoveFromCartParams(cartItemId: event.cartItemId),
    );
    await result.fold(
      (failure) async => emit(CartState.error(failure.message)),
      (_) async {
        final loadResult = await _getCartItems(const NoParams());
        loadResult.fold(
          (failure) => emit(CartState.error(failure.message)),
          (items) => emit(CartState.loaded(items, selectedIds: currentSelected)),
        );
      },
    );
  }

  void _onToggleSelect(CartToggleSelect event, Emitter<CartState> emit) {
    final current = state;
    if (current is! CartLoaded) return;

    final newSelected = Set<int>.from(current.selectedIds);
    if (newSelected.contains(event.cartItemId)) {
      newSelected.remove(event.cartItemId);
    } else {
      newSelected.add(event.cartItemId);
    }

    emit(current.copyWithSelected(selectedIds: newSelected));
  }

  void _onSelectAll(CartSelectAll event, Emitter<CartState> emit) {
    final current = state;
    if (current is! CartLoaded) return;

    final newSelected = event.selectAll
        ? current.items.map((e) => e.id).toSet()
        : <int>{};

    emit(current.copyWithSelected(selectedIds: newSelected));
  }
}