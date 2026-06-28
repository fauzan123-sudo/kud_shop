// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkout_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CheckoutEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckoutEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CheckoutEvent()';
}


}

/// @nodoc
class $CheckoutEventCopyWith<$Res>  {
$CheckoutEventCopyWith(CheckoutEvent _, $Res Function(CheckoutEvent) __);
}


/// Adds pattern-matching-related methods to [CheckoutEvent].
extension CheckoutEventPatterns on CheckoutEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CheckoutLoad value)?  load,TResult Function( CheckoutBuyNow value)?  buyNow,TResult Function( CheckoutAddressSelected value)?  addressSelected,TResult Function( CheckoutDeliveryMethodChanged value)?  deliveryMethodChanged,TResult Function( CheckoutPaymentMethodChanged value)?  paymentMethodChanged,TResult Function( CheckoutSubmit value)?  submit,TResult Function( CheckoutLoadFromItems value)?  loadFromItems,TResult Function( CheckoutQuantityChanged value)?  quantityChanged,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CheckoutLoad() when load != null:
return load(_that);case CheckoutBuyNow() when buyNow != null:
return buyNow(_that);case CheckoutAddressSelected() when addressSelected != null:
return addressSelected(_that);case CheckoutDeliveryMethodChanged() when deliveryMethodChanged != null:
return deliveryMethodChanged(_that);case CheckoutPaymentMethodChanged() when paymentMethodChanged != null:
return paymentMethodChanged(_that);case CheckoutSubmit() when submit != null:
return submit(_that);case CheckoutLoadFromItems() when loadFromItems != null:
return loadFromItems(_that);case CheckoutQuantityChanged() when quantityChanged != null:
return quantityChanged(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CheckoutLoad value)  load,required TResult Function( CheckoutBuyNow value)  buyNow,required TResult Function( CheckoutAddressSelected value)  addressSelected,required TResult Function( CheckoutDeliveryMethodChanged value)  deliveryMethodChanged,required TResult Function( CheckoutPaymentMethodChanged value)  paymentMethodChanged,required TResult Function( CheckoutSubmit value)  submit,required TResult Function( CheckoutLoadFromItems value)  loadFromItems,required TResult Function( CheckoutQuantityChanged value)  quantityChanged,}){
final _that = this;
switch (_that) {
case CheckoutLoad():
return load(_that);case CheckoutBuyNow():
return buyNow(_that);case CheckoutAddressSelected():
return addressSelected(_that);case CheckoutDeliveryMethodChanged():
return deliveryMethodChanged(_that);case CheckoutPaymentMethodChanged():
return paymentMethodChanged(_that);case CheckoutSubmit():
return submit(_that);case CheckoutLoadFromItems():
return loadFromItems(_that);case CheckoutQuantityChanged():
return quantityChanged(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CheckoutLoad value)?  load,TResult? Function( CheckoutBuyNow value)?  buyNow,TResult? Function( CheckoutAddressSelected value)?  addressSelected,TResult? Function( CheckoutDeliveryMethodChanged value)?  deliveryMethodChanged,TResult? Function( CheckoutPaymentMethodChanged value)?  paymentMethodChanged,TResult? Function( CheckoutSubmit value)?  submit,TResult? Function( CheckoutLoadFromItems value)?  loadFromItems,TResult? Function( CheckoutQuantityChanged value)?  quantityChanged,}){
final _that = this;
switch (_that) {
case CheckoutLoad() when load != null:
return load(_that);case CheckoutBuyNow() when buyNow != null:
return buyNow(_that);case CheckoutAddressSelected() when addressSelected != null:
return addressSelected(_that);case CheckoutDeliveryMethodChanged() when deliveryMethodChanged != null:
return deliveryMethodChanged(_that);case CheckoutPaymentMethodChanged() when paymentMethodChanged != null:
return paymentMethodChanged(_that);case CheckoutSubmit() when submit != null:
return submit(_that);case CheckoutLoadFromItems() when loadFromItems != null:
return loadFromItems(_that);case CheckoutQuantityChanged() when quantityChanged != null:
return quantityChanged(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  load,TResult Function( ProductEntity product,  int quantity)?  buyNow,TResult Function( AddressEntity address)?  addressSelected,TResult Function( String method)?  deliveryMethodChanged,TResult Function( String method)?  paymentMethodChanged,TResult Function()?  submit,TResult Function( List<CartItemEntity> items)?  loadFromItems,TResult Function( int cartItemId,  int quantity)?  quantityChanged,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CheckoutLoad() when load != null:
return load();case CheckoutBuyNow() when buyNow != null:
return buyNow(_that.product,_that.quantity);case CheckoutAddressSelected() when addressSelected != null:
return addressSelected(_that.address);case CheckoutDeliveryMethodChanged() when deliveryMethodChanged != null:
return deliveryMethodChanged(_that.method);case CheckoutPaymentMethodChanged() when paymentMethodChanged != null:
return paymentMethodChanged(_that.method);case CheckoutSubmit() when submit != null:
return submit();case CheckoutLoadFromItems() when loadFromItems != null:
return loadFromItems(_that.items);case CheckoutQuantityChanged() when quantityChanged != null:
return quantityChanged(_that.cartItemId,_that.quantity);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  load,required TResult Function( ProductEntity product,  int quantity)  buyNow,required TResult Function( AddressEntity address)  addressSelected,required TResult Function( String method)  deliveryMethodChanged,required TResult Function( String method)  paymentMethodChanged,required TResult Function()  submit,required TResult Function( List<CartItemEntity> items)  loadFromItems,required TResult Function( int cartItemId,  int quantity)  quantityChanged,}) {final _that = this;
switch (_that) {
case CheckoutLoad():
return load();case CheckoutBuyNow():
return buyNow(_that.product,_that.quantity);case CheckoutAddressSelected():
return addressSelected(_that.address);case CheckoutDeliveryMethodChanged():
return deliveryMethodChanged(_that.method);case CheckoutPaymentMethodChanged():
return paymentMethodChanged(_that.method);case CheckoutSubmit():
return submit();case CheckoutLoadFromItems():
return loadFromItems(_that.items);case CheckoutQuantityChanged():
return quantityChanged(_that.cartItemId,_that.quantity);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  load,TResult? Function( ProductEntity product,  int quantity)?  buyNow,TResult? Function( AddressEntity address)?  addressSelected,TResult? Function( String method)?  deliveryMethodChanged,TResult? Function( String method)?  paymentMethodChanged,TResult? Function()?  submit,TResult? Function( List<CartItemEntity> items)?  loadFromItems,TResult? Function( int cartItemId,  int quantity)?  quantityChanged,}) {final _that = this;
switch (_that) {
case CheckoutLoad() when load != null:
return load();case CheckoutBuyNow() when buyNow != null:
return buyNow(_that.product,_that.quantity);case CheckoutAddressSelected() when addressSelected != null:
return addressSelected(_that.address);case CheckoutDeliveryMethodChanged() when deliveryMethodChanged != null:
return deliveryMethodChanged(_that.method);case CheckoutPaymentMethodChanged() when paymentMethodChanged != null:
return paymentMethodChanged(_that.method);case CheckoutSubmit() when submit != null:
return submit();case CheckoutLoadFromItems() when loadFromItems != null:
return loadFromItems(_that.items);case CheckoutQuantityChanged() when quantityChanged != null:
return quantityChanged(_that.cartItemId,_that.quantity);case _:
  return null;

}
}

}

/// @nodoc


class CheckoutLoad implements CheckoutEvent {
  const CheckoutLoad();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckoutLoad);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CheckoutEvent.load()';
}


}




/// @nodoc


class CheckoutBuyNow implements CheckoutEvent {
  const CheckoutBuyNow({required this.product, required this.quantity});
  

 final  ProductEntity product;
 final  int quantity;

/// Create a copy of CheckoutEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckoutBuyNowCopyWith<CheckoutBuyNow> get copyWith => _$CheckoutBuyNowCopyWithImpl<CheckoutBuyNow>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckoutBuyNow&&(identical(other.product, product) || other.product == product)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}


@override
int get hashCode => Object.hash(runtimeType,product,quantity);

@override
String toString() {
  return 'CheckoutEvent.buyNow(product: $product, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class $CheckoutBuyNowCopyWith<$Res> implements $CheckoutEventCopyWith<$Res> {
  factory $CheckoutBuyNowCopyWith(CheckoutBuyNow value, $Res Function(CheckoutBuyNow) _then) = _$CheckoutBuyNowCopyWithImpl;
@useResult
$Res call({
 ProductEntity product, int quantity
});


$ProductEntityCopyWith<$Res> get product;

}
/// @nodoc
class _$CheckoutBuyNowCopyWithImpl<$Res>
    implements $CheckoutBuyNowCopyWith<$Res> {
  _$CheckoutBuyNowCopyWithImpl(this._self, this._then);

  final CheckoutBuyNow _self;
  final $Res Function(CheckoutBuyNow) _then;

/// Create a copy of CheckoutEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? product = null,Object? quantity = null,}) {
  return _then(CheckoutBuyNow(
product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as ProductEntity,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of CheckoutEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductEntityCopyWith<$Res> get product {
  
  return $ProductEntityCopyWith<$Res>(_self.product, (value) {
    return _then(_self.copyWith(product: value));
  });
}
}

/// @nodoc


class CheckoutAddressSelected implements CheckoutEvent {
  const CheckoutAddressSelected(this.address);
  

 final  AddressEntity address;

/// Create a copy of CheckoutEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckoutAddressSelectedCopyWith<CheckoutAddressSelected> get copyWith => _$CheckoutAddressSelectedCopyWithImpl<CheckoutAddressSelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckoutAddressSelected&&(identical(other.address, address) || other.address == address));
}


@override
int get hashCode => Object.hash(runtimeType,address);

@override
String toString() {
  return 'CheckoutEvent.addressSelected(address: $address)';
}


}

/// @nodoc
abstract mixin class $CheckoutAddressSelectedCopyWith<$Res> implements $CheckoutEventCopyWith<$Res> {
  factory $CheckoutAddressSelectedCopyWith(CheckoutAddressSelected value, $Res Function(CheckoutAddressSelected) _then) = _$CheckoutAddressSelectedCopyWithImpl;
@useResult
$Res call({
 AddressEntity address
});


$AddressEntityCopyWith<$Res> get address;

}
/// @nodoc
class _$CheckoutAddressSelectedCopyWithImpl<$Res>
    implements $CheckoutAddressSelectedCopyWith<$Res> {
  _$CheckoutAddressSelectedCopyWithImpl(this._self, this._then);

  final CheckoutAddressSelected _self;
  final $Res Function(CheckoutAddressSelected) _then;

/// Create a copy of CheckoutEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? address = null,}) {
  return _then(CheckoutAddressSelected(
null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as AddressEntity,
  ));
}

/// Create a copy of CheckoutEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AddressEntityCopyWith<$Res> get address {
  
  return $AddressEntityCopyWith<$Res>(_self.address, (value) {
    return _then(_self.copyWith(address: value));
  });
}
}

/// @nodoc


class CheckoutDeliveryMethodChanged implements CheckoutEvent {
  const CheckoutDeliveryMethodChanged(this.method);
  

 final  String method;

/// Create a copy of CheckoutEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckoutDeliveryMethodChangedCopyWith<CheckoutDeliveryMethodChanged> get copyWith => _$CheckoutDeliveryMethodChangedCopyWithImpl<CheckoutDeliveryMethodChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckoutDeliveryMethodChanged&&(identical(other.method, method) || other.method == method));
}


@override
int get hashCode => Object.hash(runtimeType,method);

@override
String toString() {
  return 'CheckoutEvent.deliveryMethodChanged(method: $method)';
}


}

/// @nodoc
abstract mixin class $CheckoutDeliveryMethodChangedCopyWith<$Res> implements $CheckoutEventCopyWith<$Res> {
  factory $CheckoutDeliveryMethodChangedCopyWith(CheckoutDeliveryMethodChanged value, $Res Function(CheckoutDeliveryMethodChanged) _then) = _$CheckoutDeliveryMethodChangedCopyWithImpl;
@useResult
$Res call({
 String method
});




}
/// @nodoc
class _$CheckoutDeliveryMethodChangedCopyWithImpl<$Res>
    implements $CheckoutDeliveryMethodChangedCopyWith<$Res> {
  _$CheckoutDeliveryMethodChangedCopyWithImpl(this._self, this._then);

  final CheckoutDeliveryMethodChanged _self;
  final $Res Function(CheckoutDeliveryMethodChanged) _then;

/// Create a copy of CheckoutEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? method = null,}) {
  return _then(CheckoutDeliveryMethodChanged(
null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class CheckoutPaymentMethodChanged implements CheckoutEvent {
  const CheckoutPaymentMethodChanged(this.method);
  

 final  String method;

/// Create a copy of CheckoutEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckoutPaymentMethodChangedCopyWith<CheckoutPaymentMethodChanged> get copyWith => _$CheckoutPaymentMethodChangedCopyWithImpl<CheckoutPaymentMethodChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckoutPaymentMethodChanged&&(identical(other.method, method) || other.method == method));
}


@override
int get hashCode => Object.hash(runtimeType,method);

@override
String toString() {
  return 'CheckoutEvent.paymentMethodChanged(method: $method)';
}


}

/// @nodoc
abstract mixin class $CheckoutPaymentMethodChangedCopyWith<$Res> implements $CheckoutEventCopyWith<$Res> {
  factory $CheckoutPaymentMethodChangedCopyWith(CheckoutPaymentMethodChanged value, $Res Function(CheckoutPaymentMethodChanged) _then) = _$CheckoutPaymentMethodChangedCopyWithImpl;
@useResult
$Res call({
 String method
});




}
/// @nodoc
class _$CheckoutPaymentMethodChangedCopyWithImpl<$Res>
    implements $CheckoutPaymentMethodChangedCopyWith<$Res> {
  _$CheckoutPaymentMethodChangedCopyWithImpl(this._self, this._then);

  final CheckoutPaymentMethodChanged _self;
  final $Res Function(CheckoutPaymentMethodChanged) _then;

/// Create a copy of CheckoutEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? method = null,}) {
  return _then(CheckoutPaymentMethodChanged(
null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class CheckoutSubmit implements CheckoutEvent {
  const CheckoutSubmit();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckoutSubmit);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CheckoutEvent.submit()';
}


}




/// @nodoc


class CheckoutLoadFromItems implements CheckoutEvent {
  const CheckoutLoadFromItems({required final  List<CartItemEntity> items}): _items = items;
  

 final  List<CartItemEntity> _items;
 List<CartItemEntity> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of CheckoutEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckoutLoadFromItemsCopyWith<CheckoutLoadFromItems> get copyWith => _$CheckoutLoadFromItemsCopyWithImpl<CheckoutLoadFromItems>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckoutLoadFromItems&&const DeepCollectionEquality().equals(other._items, _items));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'CheckoutEvent.loadFromItems(items: $items)';
}


}

/// @nodoc
abstract mixin class $CheckoutLoadFromItemsCopyWith<$Res> implements $CheckoutEventCopyWith<$Res> {
  factory $CheckoutLoadFromItemsCopyWith(CheckoutLoadFromItems value, $Res Function(CheckoutLoadFromItems) _then) = _$CheckoutLoadFromItemsCopyWithImpl;
@useResult
$Res call({
 List<CartItemEntity> items
});




}
/// @nodoc
class _$CheckoutLoadFromItemsCopyWithImpl<$Res>
    implements $CheckoutLoadFromItemsCopyWith<$Res> {
  _$CheckoutLoadFromItemsCopyWithImpl(this._self, this._then);

  final CheckoutLoadFromItems _self;
  final $Res Function(CheckoutLoadFromItems) _then;

/// Create a copy of CheckoutEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? items = null,}) {
  return _then(CheckoutLoadFromItems(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<CartItemEntity>,
  ));
}


}

/// @nodoc


class CheckoutQuantityChanged implements CheckoutEvent {
  const CheckoutQuantityChanged({required this.cartItemId, required this.quantity});
  

 final  int cartItemId;
 final  int quantity;

/// Create a copy of CheckoutEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckoutQuantityChangedCopyWith<CheckoutQuantityChanged> get copyWith => _$CheckoutQuantityChangedCopyWithImpl<CheckoutQuantityChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckoutQuantityChanged&&(identical(other.cartItemId, cartItemId) || other.cartItemId == cartItemId)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}


@override
int get hashCode => Object.hash(runtimeType,cartItemId,quantity);

@override
String toString() {
  return 'CheckoutEvent.quantityChanged(cartItemId: $cartItemId, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class $CheckoutQuantityChangedCopyWith<$Res> implements $CheckoutEventCopyWith<$Res> {
  factory $CheckoutQuantityChangedCopyWith(CheckoutQuantityChanged value, $Res Function(CheckoutQuantityChanged) _then) = _$CheckoutQuantityChangedCopyWithImpl;
@useResult
$Res call({
 int cartItemId, int quantity
});




}
/// @nodoc
class _$CheckoutQuantityChangedCopyWithImpl<$Res>
    implements $CheckoutQuantityChangedCopyWith<$Res> {
  _$CheckoutQuantityChangedCopyWithImpl(this._self, this._then);

  final CheckoutQuantityChanged _self;
  final $Res Function(CheckoutQuantityChanged) _then;

/// Create a copy of CheckoutEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? cartItemId = null,Object? quantity = null,}) {
  return _then(CheckoutQuantityChanged(
cartItemId: null == cartItemId ? _self.cartItemId : cartItemId // ignore: cast_nullable_to_non_nullable
as int,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
