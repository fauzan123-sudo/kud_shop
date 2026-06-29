import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kud_shop/core/usecases/usecase.dart';
import 'package:kud_shop/src/customer/address/domain/entities/address_entity.dart';
import 'package:kud_shop/src/customer/address/domain/usecases/get_addresses.dart';
import 'package:kud_shop/src/customer/cart/domain/entities/cart_item_entity.dart';
import 'package:kud_shop/src/customer/cart/domain/usecases/get_cart_items.dart';
import 'package:kud_shop/src/customer/order/domain/usecases/create_order.dart';
import 'checkout_event.dart';
import 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  final GetCartItems _getCartItems;
  final GetAddresses _getAddresses;
  final CreateOrder _createOrder;

  CheckoutBloc({
    required GetCartItems getCartItems,
    required GetAddresses getAddresses,
    required CreateOrder createOrder,
  }) : _getCartItems = getCartItems,
       _getAddresses = getAddresses,
       _createOrder = createOrder,
       super(const CheckoutState.initial()) {
    on<CheckoutLoad>(_onLoad);
    on<CheckoutBuyNow>(_onBuyNow);
    on<CheckoutAddressSelected>(_onAddressSelected);
    on<CheckoutDeliveryMethodChanged>(_onDeliveryMethodChanged);
    on<CheckoutPaymentMethodChanged>(_onPaymentMethodChanged);
    on<CheckoutSubmit>(_onSubmit);
    on<CheckoutLoadFromItems>(_onLoadFromItems);
    on<CheckoutQuantityChanged>(_onQuantityChanged);
  }

  Future<AddressEntity?> _getDefaultAddress() async {
    final addressResult = await _getAddresses(const NoParams());
    final List<AddressEntity> addresses = addressResult.fold(
      (_) => [],
      (a) => a,
    );
    if (addresses.isEmpty) return null;
    return addresses.firstWhere(
      (a) => a.isDefault,
      orElse: () => addresses.first,
    );
  }

  void _onQuantityChanged(
    CheckoutQuantityChanged event,
    Emitter<CheckoutState> emit,
  ) {
    final current = state;
    if (current is! CheckoutLoaded) return;

    final updatedItems = current.items.map((item) {
      if (item.id == event.cartItemId) {
        return item.copyWith(quantity: event.quantity);
      }
      return item;
    }).toList();

    emit(current.copyWith(items: updatedItems));
  }

  Future<void> _onLoadFromItems(
    CheckoutLoadFromItems event,
    Emitter<CheckoutState> emit,
  ) async {
    emit(const CheckoutState.loading());
    final defaultAddress = await _getDefaultAddress();
    emit(
      CheckoutState.loaded(items: event.items, selectedAddress: defaultAddress),
    );
  }

  Future<void> _onLoad(CheckoutLoad event, Emitter<CheckoutState> emit) async {
    emit(const CheckoutState.loading());

    final cartResult = await _getCartItems(const NoParams());
    final defaultAddress = await _getDefaultAddress();

    cartResult.fold(
      (failure) => emit(CheckoutState.error(failure.message)),
      (items) => emit(
        CheckoutState.loaded(items: items, selectedAddress: defaultAddress),
      ),
    );
  }

  Future<void> _onBuyNow(
    CheckoutBuyNow event,
    Emitter<CheckoutState> emit,
  ) async {
    emit(const CheckoutState.loading());
    final defaultAddress = await _getDefaultAddress();

    emit(
      CheckoutState.loaded(
        items: [
          CartItemEntity(
            id: 0,
            productId: event.product.id,
            productName: event.product.name,
            productPrice: event.product.price,
            productImageUrl: event.product.imageUrl,
            stock: event.product.stock,
            isActive: event.product.isActive,
            quantity: event.quantity,
          ),
        ],
        selectedAddress: defaultAddress,
      ),
    );
  }

  void _onAddressSelected(
    CheckoutAddressSelected event,
    Emitter<CheckoutState> emit,
  ) {
    final current = state;
    if (current is! CheckoutLoaded) return;
    emit(current.copyWith(selectedAddress: event.address));
  }

  void _onDeliveryMethodChanged(
    CheckoutDeliveryMethodChanged event,
    Emitter<CheckoutState> emit,
  ) {
    final current = state;
    if (current is! CheckoutLoaded) return;
    emit(current.copyWith(deliveryMethod: event.method));
  }

  void _onPaymentMethodChanged(
    CheckoutPaymentMethodChanged event,
    Emitter<CheckoutState> emit,
  ) {
    final current = state;
    if (current is! CheckoutLoaded) return;
    emit(current.copyWith(paymentMethod: event.method));
  }

  Future<void> _onSubmit(
    CheckoutSubmit event,
    Emitter<CheckoutState> emit,
  ) async {
    final current = state;
    if (current is! CheckoutLoaded) return;
    if (current.selectedAddress == null) return;

    emit(current.copyWith(isSubmitting: true));

    final isBuyNow = current.items.length == 1 && current.items.first.id == 0;

    final result = await _createOrder(
      CreateOrderParams(
        addressId: current.selectedAddress!.id,
        deliveryMethod: current.deliveryMethod,
        paymentMethod: current.paymentMethod,
        isBuyNow: isBuyNow,
        buyNowProductId: isBuyNow ? current.items.first.productId : null,
        buyNowQuantity: isBuyNow ? current.items.first.quantity : null,
        selectedCartItemIds: isBuyNow
            ? []
            : current.items.map((e) => e.id).toList(),
        cartItems: current.items,
      ),
    );

    result.fold(
      (failure) => emit(CheckoutState.error(failure.message)),
      (order) => emit(CheckoutState.success(order)),
    );
  }
}
