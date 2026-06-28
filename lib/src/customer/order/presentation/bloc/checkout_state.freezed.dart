// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkout_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CheckoutState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckoutState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CheckoutState()';
}


}

/// @nodoc
class $CheckoutStateCopyWith<$Res>  {
$CheckoutStateCopyWith(CheckoutState _, $Res Function(CheckoutState) __);
}


/// Adds pattern-matching-related methods to [CheckoutState].
extension CheckoutStatePatterns on CheckoutState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CheckoutInitial value)?  initial,TResult Function( CheckoutLoading value)?  loading,TResult Function( CheckoutLoaded value)?  loaded,TResult Function( CheckoutSuccess value)?  success,TResult Function( CheckoutError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CheckoutInitial() when initial != null:
return initial(_that);case CheckoutLoading() when loading != null:
return loading(_that);case CheckoutLoaded() when loaded != null:
return loaded(_that);case CheckoutSuccess() when success != null:
return success(_that);case CheckoutError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CheckoutInitial value)  initial,required TResult Function( CheckoutLoading value)  loading,required TResult Function( CheckoutLoaded value)  loaded,required TResult Function( CheckoutSuccess value)  success,required TResult Function( CheckoutError value)  error,}){
final _that = this;
switch (_that) {
case CheckoutInitial():
return initial(_that);case CheckoutLoading():
return loading(_that);case CheckoutLoaded():
return loaded(_that);case CheckoutSuccess():
return success(_that);case CheckoutError():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CheckoutInitial value)?  initial,TResult? Function( CheckoutLoading value)?  loading,TResult? Function( CheckoutLoaded value)?  loaded,TResult? Function( CheckoutSuccess value)?  success,TResult? Function( CheckoutError value)?  error,}){
final _that = this;
switch (_that) {
case CheckoutInitial() when initial != null:
return initial(_that);case CheckoutLoading() when loading != null:
return loading(_that);case CheckoutLoaded() when loaded != null:
return loaded(_that);case CheckoutSuccess() when success != null:
return success(_that);case CheckoutError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<CartItemEntity> items,  AddressEntity? selectedAddress,  String deliveryMethod,  String paymentMethod,  bool isSubmitting)?  loaded,TResult Function( OrderEntity order)?  success,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CheckoutInitial() when initial != null:
return initial();case CheckoutLoading() when loading != null:
return loading();case CheckoutLoaded() when loaded != null:
return loaded(_that.items,_that.selectedAddress,_that.deliveryMethod,_that.paymentMethod,_that.isSubmitting);case CheckoutSuccess() when success != null:
return success(_that.order);case CheckoutError() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<CartItemEntity> items,  AddressEntity? selectedAddress,  String deliveryMethod,  String paymentMethod,  bool isSubmitting)  loaded,required TResult Function( OrderEntity order)  success,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case CheckoutInitial():
return initial();case CheckoutLoading():
return loading();case CheckoutLoaded():
return loaded(_that.items,_that.selectedAddress,_that.deliveryMethod,_that.paymentMethod,_that.isSubmitting);case CheckoutSuccess():
return success(_that.order);case CheckoutError():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<CartItemEntity> items,  AddressEntity? selectedAddress,  String deliveryMethod,  String paymentMethod,  bool isSubmitting)?  loaded,TResult? Function( OrderEntity order)?  success,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case CheckoutInitial() when initial != null:
return initial();case CheckoutLoading() when loading != null:
return loading();case CheckoutLoaded() when loaded != null:
return loaded(_that.items,_that.selectedAddress,_that.deliveryMethod,_that.paymentMethod,_that.isSubmitting);case CheckoutSuccess() when success != null:
return success(_that.order);case CheckoutError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class CheckoutInitial implements CheckoutState {
  const CheckoutInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckoutInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CheckoutState.initial()';
}


}




/// @nodoc


class CheckoutLoading implements CheckoutState {
  const CheckoutLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckoutLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CheckoutState.loading()';
}


}




/// @nodoc


class CheckoutLoaded implements CheckoutState {
  const CheckoutLoaded({required final  List<CartItemEntity> items, this.selectedAddress, this.deliveryMethod = 'pickup', this.paymentMethod = 'transfer', this.isSubmitting = false}): _items = items;
  

 final  List<CartItemEntity> _items;
 List<CartItemEntity> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

 final  AddressEntity? selectedAddress;
@JsonKey() final  String deliveryMethod;
@JsonKey() final  String paymentMethod;
@JsonKey() final  bool isSubmitting;

/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckoutLoadedCopyWith<CheckoutLoaded> get copyWith => _$CheckoutLoadedCopyWithImpl<CheckoutLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckoutLoaded&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.selectedAddress, selectedAddress) || other.selectedAddress == selectedAddress)&&(identical(other.deliveryMethod, deliveryMethod) || other.deliveryMethod == deliveryMethod)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),selectedAddress,deliveryMethod,paymentMethod,isSubmitting);

@override
String toString() {
  return 'CheckoutState.loaded(items: $items, selectedAddress: $selectedAddress, deliveryMethod: $deliveryMethod, paymentMethod: $paymentMethod, isSubmitting: $isSubmitting)';
}


}

/// @nodoc
abstract mixin class $CheckoutLoadedCopyWith<$Res> implements $CheckoutStateCopyWith<$Res> {
  factory $CheckoutLoadedCopyWith(CheckoutLoaded value, $Res Function(CheckoutLoaded) _then) = _$CheckoutLoadedCopyWithImpl;
@useResult
$Res call({
 List<CartItemEntity> items, AddressEntity? selectedAddress, String deliveryMethod, String paymentMethod, bool isSubmitting
});


$AddressEntityCopyWith<$Res>? get selectedAddress;

}
/// @nodoc
class _$CheckoutLoadedCopyWithImpl<$Res>
    implements $CheckoutLoadedCopyWith<$Res> {
  _$CheckoutLoadedCopyWithImpl(this._self, this._then);

  final CheckoutLoaded _self;
  final $Res Function(CheckoutLoaded) _then;

/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? items = null,Object? selectedAddress = freezed,Object? deliveryMethod = null,Object? paymentMethod = null,Object? isSubmitting = null,}) {
  return _then(CheckoutLoaded(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<CartItemEntity>,selectedAddress: freezed == selectedAddress ? _self.selectedAddress : selectedAddress // ignore: cast_nullable_to_non_nullable
as AddressEntity?,deliveryMethod: null == deliveryMethod ? _self.deliveryMethod : deliveryMethod // ignore: cast_nullable_to_non_nullable
as String,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AddressEntityCopyWith<$Res>? get selectedAddress {
    if (_self.selectedAddress == null) {
    return null;
  }

  return $AddressEntityCopyWith<$Res>(_self.selectedAddress!, (value) {
    return _then(_self.copyWith(selectedAddress: value));
  });
}
}

/// @nodoc


class CheckoutSuccess implements CheckoutState {
  const CheckoutSuccess(this.order);
  

 final  OrderEntity order;

/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckoutSuccessCopyWith<CheckoutSuccess> get copyWith => _$CheckoutSuccessCopyWithImpl<CheckoutSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckoutSuccess&&(identical(other.order, order) || other.order == order));
}


@override
int get hashCode => Object.hash(runtimeType,order);

@override
String toString() {
  return 'CheckoutState.success(order: $order)';
}


}

/// @nodoc
abstract mixin class $CheckoutSuccessCopyWith<$Res> implements $CheckoutStateCopyWith<$Res> {
  factory $CheckoutSuccessCopyWith(CheckoutSuccess value, $Res Function(CheckoutSuccess) _then) = _$CheckoutSuccessCopyWithImpl;
@useResult
$Res call({
 OrderEntity order
});


$OrderEntityCopyWith<$Res> get order;

}
/// @nodoc
class _$CheckoutSuccessCopyWithImpl<$Res>
    implements $CheckoutSuccessCopyWith<$Res> {
  _$CheckoutSuccessCopyWithImpl(this._self, this._then);

  final CheckoutSuccess _self;
  final $Res Function(CheckoutSuccess) _then;

/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? order = null,}) {
  return _then(CheckoutSuccess(
null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as OrderEntity,
  ));
}

/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderEntityCopyWith<$Res> get order {
  
  return $OrderEntityCopyWith<$Res>(_self.order, (value) {
    return _then(_self.copyWith(order: value));
  });
}
}

/// @nodoc


class CheckoutError implements CheckoutState {
  const CheckoutError(this.message);
  

 final  String message;

/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckoutErrorCopyWith<CheckoutError> get copyWith => _$CheckoutErrorCopyWithImpl<CheckoutError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckoutError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'CheckoutState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $CheckoutErrorCopyWith<$Res> implements $CheckoutStateCopyWith<$Res> {
  factory $CheckoutErrorCopyWith(CheckoutError value, $Res Function(CheckoutError) _then) = _$CheckoutErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$CheckoutErrorCopyWithImpl<$Res>
    implements $CheckoutErrorCopyWith<$Res> {
  _$CheckoutErrorCopyWithImpl(this._self, this._then);

  final CheckoutError _self;
  final $Res Function(CheckoutError) _then;

/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(CheckoutError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
