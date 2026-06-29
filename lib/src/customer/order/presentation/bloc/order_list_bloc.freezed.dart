// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_list_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OrderListEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderListEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OrderListEvent()';
}


}

/// @nodoc
class $OrderListEventCopyWith<$Res>  {
$OrderListEventCopyWith(OrderListEvent _, $Res Function(OrderListEvent) __);
}


/// Adds pattern-matching-related methods to [OrderListEvent].
extension OrderListEventPatterns on OrderListEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( OrderListLoad value)?  load,required TResult orElse(),}){
final _that = this;
switch (_that) {
case OrderListLoad() when load != null:
return load(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( OrderListLoad value)  load,}){
final _that = this;
switch (_that) {
case OrderListLoad():
return load(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( OrderListLoad value)?  load,}){
final _that = this;
switch (_that) {
case OrderListLoad() when load != null:
return load(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  load,required TResult orElse(),}) {final _that = this;
switch (_that) {
case OrderListLoad() when load != null:
return load();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  load,}) {final _that = this;
switch (_that) {
case OrderListLoad():
return load();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  load,}) {final _that = this;
switch (_that) {
case OrderListLoad() when load != null:
return load();case _:
  return null;

}
}

}

/// @nodoc


class OrderListLoad implements OrderListEvent {
  const OrderListLoad();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderListLoad);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OrderListEvent.load()';
}


}




/// @nodoc
mixin _$OrderListState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderListState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OrderListState()';
}


}

/// @nodoc
class $OrderListStateCopyWith<$Res>  {
$OrderListStateCopyWith(OrderListState _, $Res Function(OrderListState) __);
}


/// Adds pattern-matching-related methods to [OrderListState].
extension OrderListStatePatterns on OrderListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( OrderListInitial value)?  initial,TResult Function( OrderListLoading value)?  loading,TResult Function( OrderListLoaded value)?  loaded,TResult Function( OrderListError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case OrderListInitial() when initial != null:
return initial(_that);case OrderListLoading() when loading != null:
return loading(_that);case OrderListLoaded() when loaded != null:
return loaded(_that);case OrderListError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( OrderListInitial value)  initial,required TResult Function( OrderListLoading value)  loading,required TResult Function( OrderListLoaded value)  loaded,required TResult Function( OrderListError value)  error,}){
final _that = this;
switch (_that) {
case OrderListInitial():
return initial(_that);case OrderListLoading():
return loading(_that);case OrderListLoaded():
return loaded(_that);case OrderListError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( OrderListInitial value)?  initial,TResult? Function( OrderListLoading value)?  loading,TResult? Function( OrderListLoaded value)?  loaded,TResult? Function( OrderListError value)?  error,}){
final _that = this;
switch (_that) {
case OrderListInitial() when initial != null:
return initial(_that);case OrderListLoading() when loading != null:
return loading(_that);case OrderListLoaded() when loaded != null:
return loaded(_that);case OrderListError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<OrderEntity> orders)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case OrderListInitial() when initial != null:
return initial();case OrderListLoading() when loading != null:
return loading();case OrderListLoaded() when loaded != null:
return loaded(_that.orders);case OrderListError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<OrderEntity> orders)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case OrderListInitial():
return initial();case OrderListLoading():
return loading();case OrderListLoaded():
return loaded(_that.orders);case OrderListError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<OrderEntity> orders)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case OrderListInitial() when initial != null:
return initial();case OrderListLoading() when loading != null:
return loading();case OrderListLoaded() when loaded != null:
return loaded(_that.orders);case OrderListError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class OrderListInitial implements OrderListState {
  const OrderListInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderListInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OrderListState.initial()';
}


}




/// @nodoc


class OrderListLoading implements OrderListState {
  const OrderListLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderListLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OrderListState.loading()';
}


}




/// @nodoc


class OrderListLoaded implements OrderListState {
  const OrderListLoaded(final  List<OrderEntity> orders): _orders = orders;
  

 final  List<OrderEntity> _orders;
 List<OrderEntity> get orders {
  if (_orders is EqualUnmodifiableListView) return _orders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_orders);
}


/// Create a copy of OrderListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderListLoadedCopyWith<OrderListLoaded> get copyWith => _$OrderListLoadedCopyWithImpl<OrderListLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderListLoaded&&const DeepCollectionEquality().equals(other._orders, _orders));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_orders));

@override
String toString() {
  return 'OrderListState.loaded(orders: $orders)';
}


}

/// @nodoc
abstract mixin class $OrderListLoadedCopyWith<$Res> implements $OrderListStateCopyWith<$Res> {
  factory $OrderListLoadedCopyWith(OrderListLoaded value, $Res Function(OrderListLoaded) _then) = _$OrderListLoadedCopyWithImpl;
@useResult
$Res call({
 List<OrderEntity> orders
});




}
/// @nodoc
class _$OrderListLoadedCopyWithImpl<$Res>
    implements $OrderListLoadedCopyWith<$Res> {
  _$OrderListLoadedCopyWithImpl(this._self, this._then);

  final OrderListLoaded _self;
  final $Res Function(OrderListLoaded) _then;

/// Create a copy of OrderListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? orders = null,}) {
  return _then(OrderListLoaded(
null == orders ? _self._orders : orders // ignore: cast_nullable_to_non_nullable
as List<OrderEntity>,
  ));
}


}

/// @nodoc


class OrderListError implements OrderListState {
  const OrderListError(this.message);
  

 final  String message;

/// Create a copy of OrderListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderListErrorCopyWith<OrderListError> get copyWith => _$OrderListErrorCopyWithImpl<OrderListError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderListError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'OrderListState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $OrderListErrorCopyWith<$Res> implements $OrderListStateCopyWith<$Res> {
  factory $OrderListErrorCopyWith(OrderListError value, $Res Function(OrderListError) _then) = _$OrderListErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$OrderListErrorCopyWithImpl<$Res>
    implements $OrderListErrorCopyWith<$Res> {
  _$OrderListErrorCopyWithImpl(this._self, this._then);

  final OrderListError _self;
  final $Res Function(OrderListError) _then;

/// Create a copy of OrderListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(OrderListError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
