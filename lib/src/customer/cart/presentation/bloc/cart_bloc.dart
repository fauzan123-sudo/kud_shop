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
       super(const CartInitial()) {
    on<CartLoad>(_onLoad);
    on<CartAddItem>(_onAddItem);
    on<CartUpdateQuantity>(_onUpdateQuantity);
    on<CartRemoveItem>(_onRemoveItem);
  }

  Future<void> _onLoad(CartLoad event, Emitter<CartState> emit) async {
    emit(const CartLoading());
    final result = await _getCartItems(const NoParams());
    result.fold(
      (failure) => emit(CartError(failure.message)),
      (items) => emit(CartLoaded(items)),
    );
  }

  Future<void> _onAddItem(CartAddItem event, Emitter<CartState> emit) async {
    final result = await _addToCart(
      AddToCartParams(productId: event.productId, quantity: event.quantity),
    );
    await result.fold(
      (failure) async => emit(CartError(failure.message)),
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

    // Update state lokal dulu (optimistic update) — tidak ada loading/flicker
    final current = state;
    if (current is CartLoaded) {
      final updatedItems = current.items.map((item) {
        if (item.id == event.cartItemId) {
          return item.copyWith(quantity: event.quantity);
        }
        return item;
      }).toList();
      emit(CartLoaded(updatedItems));
    }

    // Sync ke Supabase di background
    final result = await _updateCartQuantity(
      UpdateCartQuantityParams(
        cartItemId: event.cartItemId,
        quantity: event.quantity,
      ),
    );

    result.fold(
      (failure) {
        // Kalau gagal, fetch ulang untuk kembalikan ke data asli
        emit(CartError(failure.message));
      },
      (_) {}, // sukses, tidak perlu fetch ulang
    );
  }

  Future<void> _onRemoveItem(
    CartRemoveItem event,
    Emitter<CartState> emit,
  ) async {
    final result = await _removeFromCart(
      RemoveFromCartParams(cartItemId: event.cartItemId),
    );
    await result.fold(
      (failure) async => emit(CartError(failure.message)),
      (_) async => _onLoad(const CartLoad(), emit),
    );
  }
}
