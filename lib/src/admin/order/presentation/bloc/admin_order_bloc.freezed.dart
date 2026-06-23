// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_order_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AdminOrderEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdminOrderEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AdminOrderEvent()';
}


}

/// @nodoc
class $AdminOrderEventCopyWith<$Res>  {
$AdminOrderEventCopyWith(AdminOrderEvent _, $Res Function(AdminOrderEvent) __);
}


/// Adds pattern-matching-related methods to [AdminOrderEvent].
extension AdminOrderEventPatterns on AdminOrderEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _LoadOrders value)?  load,TResult Function( _UpdateStatus value)?  updateStatus,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoadOrders() when load != null:
return load(_that);case _UpdateStatus() when updateStatus != null:
return updateStatus(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _LoadOrders value)  load,required TResult Function( _UpdateStatus value)  updateStatus,}){
final _that = this;
switch (_that) {
case _LoadOrders():
return load(_that);case _UpdateStatus():
return updateStatus(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _LoadOrders value)?  load,TResult? Function( _UpdateStatus value)?  updateStatus,}){
final _that = this;
switch (_that) {
case _LoadOrders() when load != null:
return load(_that);case _UpdateStatus() when updateStatus != null:
return updateStatus(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  load,TResult Function( int orderId,  String status)?  updateStatus,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoadOrders() when load != null:
return load();case _UpdateStatus() when updateStatus != null:
return updateStatus(_that.orderId,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  load,required TResult Function( int orderId,  String status)  updateStatus,}) {final _that = this;
switch (_that) {
case _LoadOrders():
return load();case _UpdateStatus():
return updateStatus(_that.orderId,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  load,TResult? Function( int orderId,  String status)?  updateStatus,}) {final _that = this;
switch (_that) {
case _LoadOrders() when load != null:
return load();case _UpdateStatus() when updateStatus != null:
return updateStatus(_that.orderId,_that.status);case _:
  return null;

}
}

}

/// @nodoc


class _LoadOrders implements AdminOrderEvent {
  const _LoadOrders();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadOrders);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AdminOrderEvent.load()';
}


}




/// @nodoc


class _UpdateStatus implements AdminOrderEvent {
  const _UpdateStatus({required this.orderId, required this.status});
  

 final  int orderId;
 final  String status;

/// Create a copy of AdminOrderEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateStatusCopyWith<_UpdateStatus> get copyWith => __$UpdateStatusCopyWithImpl<_UpdateStatus>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateStatus&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,orderId,status);

@override
String toString() {
  return 'AdminOrderEvent.updateStatus(orderId: $orderId, status: $status)';
}


}

/// @nodoc
abstract mixin class _$UpdateStatusCopyWith<$Res> implements $AdminOrderEventCopyWith<$Res> {
  factory _$UpdateStatusCopyWith(_UpdateStatus value, $Res Function(_UpdateStatus) _then) = __$UpdateStatusCopyWithImpl;
@useResult
$Res call({
 int orderId, String status
});




}
/// @nodoc
class __$UpdateStatusCopyWithImpl<$Res>
    implements _$UpdateStatusCopyWith<$Res> {
  __$UpdateStatusCopyWithImpl(this._self, this._then);

  final _UpdateStatus _self;
  final $Res Function(_UpdateStatus) _then;

/// Create a copy of AdminOrderEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? orderId = null,Object? status = null,}) {
  return _then(_UpdateStatus(
orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$AdminOrderState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdminOrderState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AdminOrderState()';
}


}

/// @nodoc
class $AdminOrderStateCopyWith<$Res>  {
$AdminOrderStateCopyWith(AdminOrderState _, $Res Function(AdminOrderState) __);
}


/// Adds pattern-matching-related methods to [AdminOrderState].
extension AdminOrderStatePatterns on AdminOrderState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Loaded value)?  loaded,TResult Function( _Updating value)?  updating,TResult Function( _UpdateSuccess value)?  updateSuccess,TResult Function( _UpdateError value)?  updateError,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Updating() when updating != null:
return updating(_that);case _UpdateSuccess() when updateSuccess != null:
return updateSuccess(_that);case _UpdateError() when updateError != null:
return updateError(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Loaded value)  loaded,required TResult Function( _Updating value)  updating,required TResult Function( _UpdateSuccess value)  updateSuccess,required TResult Function( _UpdateError value)  updateError,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Loaded():
return loaded(_that);case _Updating():
return updating(_that);case _UpdateSuccess():
return updateSuccess(_that);case _UpdateError():
return updateError(_that);case _Error():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Loaded value)?  loaded,TResult? Function( _Updating value)?  updating,TResult? Function( _UpdateSuccess value)?  updateSuccess,TResult? Function( _UpdateError value)?  updateError,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Updating() when updating != null:
return updating(_that);case _UpdateSuccess() when updateSuccess != null:
return updateSuccess(_that);case _UpdateError() when updateError != null:
return updateError(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<OrderEntity> orders)?  loaded,TResult Function( List<OrderEntity> orders)?  updating,TResult Function( List<OrderEntity> orders)?  updateSuccess,TResult Function( List<OrderEntity> orders,  String message)?  updateError,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.orders);case _Updating() when updating != null:
return updating(_that.orders);case _UpdateSuccess() when updateSuccess != null:
return updateSuccess(_that.orders);case _UpdateError() when updateError != null:
return updateError(_that.orders,_that.message);case _Error() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<OrderEntity> orders)  loaded,required TResult Function( List<OrderEntity> orders)  updating,required TResult Function( List<OrderEntity> orders)  updateSuccess,required TResult Function( List<OrderEntity> orders,  String message)  updateError,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Loaded():
return loaded(_that.orders);case _Updating():
return updating(_that.orders);case _UpdateSuccess():
return updateSuccess(_that.orders);case _UpdateError():
return updateError(_that.orders,_that.message);case _Error():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<OrderEntity> orders)?  loaded,TResult? Function( List<OrderEntity> orders)?  updating,TResult? Function( List<OrderEntity> orders)?  updateSuccess,TResult? Function( List<OrderEntity> orders,  String message)?  updateError,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.orders);case _Updating() when updating != null:
return updating(_that.orders);case _UpdateSuccess() when updateSuccess != null:
return updateSuccess(_that.orders);case _UpdateError() when updateError != null:
return updateError(_that.orders,_that.message);case _Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements AdminOrderState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AdminOrderState.initial()';
}


}




/// @nodoc


class _Loading implements AdminOrderState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AdminOrderState.loading()';
}


}




/// @nodoc


class _Loaded implements AdminOrderState {
  const _Loaded(final  List<OrderEntity> orders): _orders = orders;
  

 final  List<OrderEntity> _orders;
 List<OrderEntity> get orders {
  if (_orders is EqualUnmodifiableListView) return _orders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_orders);
}


/// Create a copy of AdminOrderState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&const DeepCollectionEquality().equals(other._orders, _orders));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_orders));

@override
String toString() {
  return 'AdminOrderState.loaded(orders: $orders)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $AdminOrderStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 List<OrderEntity> orders
});




}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of AdminOrderState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? orders = null,}) {
  return _then(_Loaded(
null == orders ? _self._orders : orders // ignore: cast_nullable_to_non_nullable
as List<OrderEntity>,
  ));
}


}

/// @nodoc


class _Updating implements AdminOrderState {
  const _Updating(final  List<OrderEntity> orders): _orders = orders;
  

 final  List<OrderEntity> _orders;
 List<OrderEntity> get orders {
  if (_orders is EqualUnmodifiableListView) return _orders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_orders);
}


/// Create a copy of AdminOrderState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdatingCopyWith<_Updating> get copyWith => __$UpdatingCopyWithImpl<_Updating>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Updating&&const DeepCollectionEquality().equals(other._orders, _orders));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_orders));

@override
String toString() {
  return 'AdminOrderState.updating(orders: $orders)';
}


}

/// @nodoc
abstract mixin class _$UpdatingCopyWith<$Res> implements $AdminOrderStateCopyWith<$Res> {
  factory _$UpdatingCopyWith(_Updating value, $Res Function(_Updating) _then) = __$UpdatingCopyWithImpl;
@useResult
$Res call({
 List<OrderEntity> orders
});




}
/// @nodoc
class __$UpdatingCopyWithImpl<$Res>
    implements _$UpdatingCopyWith<$Res> {
  __$UpdatingCopyWithImpl(this._self, this._then);

  final _Updating _self;
  final $Res Function(_Updating) _then;

/// Create a copy of AdminOrderState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? orders = null,}) {
  return _then(_Updating(
null == orders ? _self._orders : orders // ignore: cast_nullable_to_non_nullable
as List<OrderEntity>,
  ));
}


}

/// @nodoc


class _UpdateSuccess implements AdminOrderState {
  const _UpdateSuccess(final  List<OrderEntity> orders): _orders = orders;
  

 final  List<OrderEntity> _orders;
 List<OrderEntity> get orders {
  if (_orders is EqualUnmodifiableListView) return _orders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_orders);
}


/// Create a copy of AdminOrderState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateSuccessCopyWith<_UpdateSuccess> get copyWith => __$UpdateSuccessCopyWithImpl<_UpdateSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateSuccess&&const DeepCollectionEquality().equals(other._orders, _orders));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_orders));

@override
String toString() {
  return 'AdminOrderState.updateSuccess(orders: $orders)';
}


}

/// @nodoc
abstract mixin class _$UpdateSuccessCopyWith<$Res> implements $AdminOrderStateCopyWith<$Res> {
  factory _$UpdateSuccessCopyWith(_UpdateSuccess value, $Res Function(_UpdateSuccess) _then) = __$UpdateSuccessCopyWithImpl;
@useResult
$Res call({
 List<OrderEntity> orders
});




}
/// @nodoc
class __$UpdateSuccessCopyWithImpl<$Res>
    implements _$UpdateSuccessCopyWith<$Res> {
  __$UpdateSuccessCopyWithImpl(this._self, this._then);

  final _UpdateSuccess _self;
  final $Res Function(_UpdateSuccess) _then;

/// Create a copy of AdminOrderState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? orders = null,}) {
  return _then(_UpdateSuccess(
null == orders ? _self._orders : orders // ignore: cast_nullable_to_non_nullable
as List<OrderEntity>,
  ));
}


}

/// @nodoc


class _UpdateError implements AdminOrderState {
  const _UpdateError(final  List<OrderEntity> orders, this.message): _orders = orders;
  

 final  List<OrderEntity> _orders;
 List<OrderEntity> get orders {
  if (_orders is EqualUnmodifiableListView) return _orders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_orders);
}

 final  String message;

/// Create a copy of AdminOrderState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateErrorCopyWith<_UpdateError> get copyWith => __$UpdateErrorCopyWithImpl<_UpdateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateError&&const DeepCollectionEquality().equals(other._orders, _orders)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_orders),message);

@override
String toString() {
  return 'AdminOrderState.updateError(orders: $orders, message: $message)';
}


}

/// @nodoc
abstract mixin class _$UpdateErrorCopyWith<$Res> implements $AdminOrderStateCopyWith<$Res> {
  factory _$UpdateErrorCopyWith(_UpdateError value, $Res Function(_UpdateError) _then) = __$UpdateErrorCopyWithImpl;
@useResult
$Res call({
 List<OrderEntity> orders, String message
});




}
/// @nodoc
class __$UpdateErrorCopyWithImpl<$Res>
    implements _$UpdateErrorCopyWith<$Res> {
  __$UpdateErrorCopyWithImpl(this._self, this._then);

  final _UpdateError _self;
  final $Res Function(_UpdateError) _then;

/// Create a copy of AdminOrderState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? orders = null,Object? message = null,}) {
  return _then(_UpdateError(
null == orders ? _self._orders : orders // ignore: cast_nullable_to_non_nullable
as List<OrderEntity>,null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Error implements AdminOrderState {
  const _Error(this.message);
  

 final  String message;

/// Create a copy of AdminOrderState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AdminOrderState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $AdminOrderStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of AdminOrderState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
