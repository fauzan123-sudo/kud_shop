import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kud_shop/src/admin/product/domain/entities/product_entity.dart';
import 'package:kud_shop/src/customer/address/domain/entities/address_entity.dart';
import 'package:kud_shop/src/customer/cart/domain/entities/cart_item_entity.dart';

part 'checkout_event.freezed.dart';

@freezed
abstract class CheckoutEvent with _$CheckoutEvent {
  const factory CheckoutEvent.load() = CheckoutLoad;
  const factory CheckoutEvent.buyNow({
    required ProductEntity product,
    required int quantity,
  }) = CheckoutBuyNow;
  const factory CheckoutEvent.addressSelected(AddressEntity address) =
      CheckoutAddressSelected;
  const factory CheckoutEvent.deliveryMethodChanged(String method) =
      CheckoutDeliveryMethodChanged;
  const factory CheckoutEvent.paymentMethodChanged(String method) =
      CheckoutPaymentMethodChanged;
  const factory CheckoutEvent.submit() = CheckoutSubmit;
  const factory CheckoutEvent.loadFromItems({
    required List<CartItemEntity> items,
  }) = CheckoutLoadFromItems;
  const factory CheckoutEvent.quantityChanged({
    required int cartItemId,
    required int quantity,
  }) = CheckoutQuantityChanged;
}