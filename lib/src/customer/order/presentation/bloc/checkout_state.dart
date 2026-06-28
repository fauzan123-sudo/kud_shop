import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kud_shop/src/customer/address/domain/entities/address_entity.dart';
import 'package:kud_shop/src/customer/cart/domain/entities/cart_item_entity.dart';
import 'package:kud_shop/src/customer/order/domain/entities/order_entity.dart';

part 'checkout_state.freezed.dart';

@freezed
abstract class CheckoutState with _$CheckoutState {
  const factory CheckoutState.initial() = CheckoutInitial;
  const factory CheckoutState.loading() = CheckoutLoading;
  const factory CheckoutState.loaded({
    required List<CartItemEntity> items,
    AddressEntity? selectedAddress,
    @Default('pickup') String deliveryMethod,
    @Default('transfer') String paymentMethod,
    @Default(false) bool isSubmitting,
  }) = CheckoutLoaded;
  const factory CheckoutState.success(OrderEntity order) = CheckoutSuccess;
  const factory CheckoutState.error(String message) = CheckoutError;
}

extension CheckoutLoadedX on CheckoutLoaded {
  double get subtotal => items.fold(0, (sum, item) => sum + item.subtotal);
  double get shippingCost => deliveryMethod == 'delivery' ? 10000 : 0;
  double get totalPrice => subtotal + shippingCost;
}
