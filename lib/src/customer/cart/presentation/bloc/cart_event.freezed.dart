// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CartEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CartEvent()';
}


}

/// @nodoc
class $CartEventCopyWith<$Res>  {
$CartEventCopyWith(CartEvent _, $Res Function(CartEvent) __);
}


/// Adds pattern-matching-related methods to [CartEvent].
extension CartEventPatterns on CartEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CartLoad value)?  load,TResult Function( CartAddItem value)?  addItem,TResult Function( CartUpdateQuantity value)?  updateQuantity,TResult Function( CartRemoveItem value)?  removeItem,TResult Function( CartToggleSelect value)?  toggleSelect,TResult Function( CartSelectAll value)?  selectAll,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CartLoad() when load != null:
return load(_that);case CartAddItem() when addItem != null:
return addItem(_that);case CartUpdateQuantity() when updateQuantity != null:
return updateQuantity(_that);case CartRemoveItem() when removeItem != null:
return removeItem(_that);case CartToggleSelect() when toggleSelect != null:
return toggleSelect(_that);case CartSelectAll() when selectAll != null:
return selectAll(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CartLoad value)  load,required TResult Function( CartAddItem value)  addItem,required TResult Function( CartUpdateQuantity value)  updateQuantity,required TResult Function( CartRemoveItem value)  removeItem,required TResult Function( CartToggleSelect value)  toggleSelect,required TResult Function( CartSelectAll value)  selectAll,}){
final _that = this;
switch (_that) {
case CartLoad():
return load(_that);case CartAddItem():
return addItem(_that);case CartUpdateQuantity():
return updateQuantity(_that);case CartRemoveItem():
return removeItem(_that);case CartToggleSelect():
return toggleSelect(_that);case CartSelectAll():
return selectAll(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CartLoad value)?  load,TResult? Function( CartAddItem value)?  addItem,TResult? Function( CartUpdateQuantity value)?  updateQuantity,TResult? Function( CartRemoveItem value)?  removeItem,TResult? Function( CartToggleSelect value)?  toggleSelect,TResult? Function( CartSelectAll value)?  selectAll,}){
final _that = this;
switch (_that) {
case CartLoad() when load != null:
return load(_that);case CartAddItem() when addItem != null:
return addItem(_that);case CartUpdateQuantity() when updateQuantity != null:
return updateQuantity(_that);case CartRemoveItem() when removeItem != null:
return removeItem(_that);case CartToggleSelect() when toggleSelect != null:
return toggleSelect(_that);case CartSelectAll() when selectAll != null:
return selectAll(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  load,TResult Function( int productId,  int quantity)?  addItem,TResult Function( int cartItemId,  int quantity)?  updateQuantity,TResult Function( int cartItemId)?  removeItem,TResult Function( int cartItemId)?  toggleSelect,TResult Function( bool selectAll)?  selectAll,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CartLoad() when load != null:
return load();case CartAddItem() when addItem != null:
return addItem(_that.productId,_that.quantity);case CartUpdateQuantity() when updateQuantity != null:
return updateQuantity(_that.cartItemId,_that.quantity);case CartRemoveItem() when removeItem != null:
return removeItem(_that.cartItemId);case CartToggleSelect() when toggleSelect != null:
return toggleSelect(_that.cartItemId);case CartSelectAll() when selectAll != null:
return selectAll(_that.selectAll);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  load,required TResult Function( int productId,  int quantity)  addItem,required TResult Function( int cartItemId,  int quantity)  updateQuantity,required TResult Function( int cartItemId)  removeItem,required TResult Function( int cartItemId)  toggleSelect,required TResult Function( bool selectAll)  selectAll,}) {final _that = this;
switch (_that) {
case CartLoad():
return load();case CartAddItem():
return addItem(_that.productId,_that.quantity);case CartUpdateQuantity():
return updateQuantity(_that.cartItemId,_that.quantity);case CartRemoveItem():
return removeItem(_that.cartItemId);case CartToggleSelect():
return toggleSelect(_that.cartItemId);case CartSelectAll():
return selectAll(_that.selectAll);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  load,TResult? Function( int productId,  int quantity)?  addItem,TResult? Function( int cartItemId,  int quantity)?  updateQuantity,TResult? Function( int cartItemId)?  removeItem,TResult? Function( int cartItemId)?  toggleSelect,TResult? Function( bool selectAll)?  selectAll,}) {final _that = this;
switch (_that) {
case CartLoad() when load != null:
return load();case CartAddItem() when addItem != null:
return addItem(_that.productId,_that.quantity);case CartUpdateQuantity() when updateQuantity != null:
return updateQuantity(_that.cartItemId,_that.quantity);case CartRemoveItem() when removeItem != null:
return removeItem(_that.cartItemId);case CartToggleSelect() when toggleSelect != null:
return toggleSelect(_that.cartItemId);case CartSelectAll() when selectAll != null:
return selectAll(_that.selectAll);case _:
  return null;

}
}

}

/// @nodoc


class CartLoad implements CartEvent {
  const CartLoad();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartLoad);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CartEvent.load()';
}


}




/// @nodoc


class CartAddItem implements CartEvent {
  const CartAddItem({required this.productId, this.quantity = 1});
  

 final  int productId;
@JsonKey() final  int quantity;

/// Create a copy of CartEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CartAddItemCopyWith<CartAddItem> get copyWith => _$CartAddItemCopyWithImpl<CartAddItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartAddItem&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}


@override
int get hashCode => Object.hash(runtimeType,productId,quantity);

@override
String toString() {
  return 'CartEvent.addItem(productId: $productId, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class $CartAddItemCopyWith<$Res> implements $CartEventCopyWith<$Res> {
  factory $CartAddItemCopyWith(CartAddItem value, $Res Function(CartAddItem) _then) = _$CartAddItemCopyWithImpl;
@useResult
$Res call({
 int productId, int quantity
});




}
/// @nodoc
class _$CartAddItemCopyWithImpl<$Res>
    implements $CartAddItemCopyWith<$Res> {
  _$CartAddItemCopyWithImpl(this._self, this._then);

  final CartAddItem _self;
  final $Res Function(CartAddItem) _then;

/// Create a copy of CartEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? productId = null,Object? quantity = null,}) {
  return _then(CartAddItem(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class CartUpdateQuantity implements CartEvent {
  const CartUpdateQuantity({required this.cartItemId, required this.quantity});
  

 final  int cartItemId;
 final  int quantity;

/// Create a copy of CartEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CartUpdateQuantityCopyWith<CartUpdateQuantity> get copyWith => _$CartUpdateQuantityCopyWithImpl<CartUpdateQuantity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartUpdateQuantity&&(identical(other.cartItemId, cartItemId) || other.cartItemId == cartItemId)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}


@override
int get hashCode => Object.hash(runtimeType,cartItemId,quantity);

@override
String toString() {
  return 'CartEvent.updateQuantity(cartItemId: $cartItemId, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class $CartUpdateQuantityCopyWith<$Res> implements $CartEventCopyWith<$Res> {
  factory $CartUpdateQuantityCopyWith(CartUpdateQuantity value, $Res Function(CartUpdateQuantity) _then) = _$CartUpdateQuantityCopyWithImpl;
@useResult
$Res call({
 int cartItemId, int quantity
});




}
/// @nodoc
class _$CartUpdateQuantityCopyWithImpl<$Res>
    implements $CartUpdateQuantityCopyWith<$Res> {
  _$CartUpdateQuantityCopyWithImpl(this._self, this._then);

  final CartUpdateQuantity _self;
  final $Res Function(CartUpdateQuantity) _then;

/// Create a copy of CartEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? cartItemId = null,Object? quantity = null,}) {
  return _then(CartUpdateQuantity(
cartItemId: null == cartItemId ? _self.cartItemId : cartItemId // ignore: cast_nullable_to_non_nullable
as int,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class CartRemoveItem implements CartEvent {
  const CartRemoveItem({required this.cartItemId});
  

 final  int cartItemId;

/// Create a copy of CartEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CartRemoveItemCopyWith<CartRemoveItem> get copyWith => _$CartRemoveItemCopyWithImpl<CartRemoveItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartRemoveItem&&(identical(other.cartItemId, cartItemId) || other.cartItemId == cartItemId));
}


@override
int get hashCode => Object.hash(runtimeType,cartItemId);

@override
String toString() {
  return 'CartEvent.removeItem(cartItemId: $cartItemId)';
}


}

/// @nodoc
abstract mixin class $CartRemoveItemCopyWith<$Res> implements $CartEventCopyWith<$Res> {
  factory $CartRemoveItemCopyWith(CartRemoveItem value, $Res Function(CartRemoveItem) _then) = _$CartRemoveItemCopyWithImpl;
@useResult
$Res call({
 int cartItemId
});




}
/// @nodoc
class _$CartRemoveItemCopyWithImpl<$Res>
    implements $CartRemoveItemCopyWith<$Res> {
  _$CartRemoveItemCopyWithImpl(this._self, this._then);

  final CartRemoveItem _self;
  final $Res Function(CartRemoveItem) _then;

/// Create a copy of CartEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? cartItemId = null,}) {
  return _then(CartRemoveItem(
cartItemId: null == cartItemId ? _self.cartItemId : cartItemId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class CartToggleSelect implements CartEvent {
  const CartToggleSelect({required this.cartItemId});
  

 final  int cartItemId;

/// Create a copy of CartEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CartToggleSelectCopyWith<CartToggleSelect> get copyWith => _$CartToggleSelectCopyWithImpl<CartToggleSelect>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartToggleSelect&&(identical(other.cartItemId, cartItemId) || other.cartItemId == cartItemId));
}


@override
int get hashCode => Object.hash(runtimeType,cartItemId);

@override
String toString() {
  return 'CartEvent.toggleSelect(cartItemId: $cartItemId)';
}


}

/// @nodoc
abstract mixin class $CartToggleSelectCopyWith<$Res> implements $CartEventCopyWith<$Res> {
  factory $CartToggleSelectCopyWith(CartToggleSelect value, $Res Function(CartToggleSelect) _then) = _$CartToggleSelectCopyWithImpl;
@useResult
$Res call({
 int cartItemId
});




}
/// @nodoc
class _$CartToggleSelectCopyWithImpl<$Res>
    implements $CartToggleSelectCopyWith<$Res> {
  _$CartToggleSelectCopyWithImpl(this._self, this._then);

  final CartToggleSelect _self;
  final $Res Function(CartToggleSelect) _then;

/// Create a copy of CartEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? cartItemId = null,}) {
  return _then(CartToggleSelect(
cartItemId: null == cartItemId ? _self.cartItemId : cartItemId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class CartSelectAll implements CartEvent {
  const CartSelectAll({required this.selectAll});
  

 final  bool selectAll;

/// Create a copy of CartEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CartSelectAllCopyWith<CartSelectAll> get copyWith => _$CartSelectAllCopyWithImpl<CartSelectAll>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartSelectAll&&(identical(other.selectAll, selectAll) || other.selectAll == selectAll));
}


@override
int get hashCode => Object.hash(runtimeType,selectAll);

@override
String toString() {
  return 'CartEvent.selectAll(selectAll: $selectAll)';
}


}

/// @nodoc
abstract mixin class $CartSelectAllCopyWith<$Res> implements $CartEventCopyWith<$Res> {
  factory $CartSelectAllCopyWith(CartSelectAll value, $Res Function(CartSelectAll) _then) = _$CartSelectAllCopyWithImpl;
@useResult
$Res call({
 bool selectAll
});




}
/// @nodoc
class _$CartSelectAllCopyWithImpl<$Res>
    implements $CartSelectAllCopyWith<$Res> {
  _$CartSelectAllCopyWithImpl(this._self, this._then);

  final CartSelectAll _self;
  final $Res Function(CartSelectAll) _then;

/// Create a copy of CartEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? selectAll = null,}) {
  return _then(CartSelectAll(
selectAll: null == selectAll ? _self.selectAll : selectAll // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
