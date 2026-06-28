// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AddressState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddressState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AddressState()';
}


}

/// @nodoc
class $AddressStateCopyWith<$Res>  {
$AddressStateCopyWith(AddressState _, $Res Function(AddressState) __);
}


/// Adds pattern-matching-related methods to [AddressState].
extension AddressStatePatterns on AddressState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AddressInitial value)?  initial,TResult Function( AddressLoading value)?  loading,TResult Function( AddressLoaded value)?  loaded,TResult Function( AddressActionSuccess value)?  actionSuccess,TResult Function( AddressError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AddressInitial() when initial != null:
return initial(_that);case AddressLoading() when loading != null:
return loading(_that);case AddressLoaded() when loaded != null:
return loaded(_that);case AddressActionSuccess() when actionSuccess != null:
return actionSuccess(_that);case AddressError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AddressInitial value)  initial,required TResult Function( AddressLoading value)  loading,required TResult Function( AddressLoaded value)  loaded,required TResult Function( AddressActionSuccess value)  actionSuccess,required TResult Function( AddressError value)  error,}){
final _that = this;
switch (_that) {
case AddressInitial():
return initial(_that);case AddressLoading():
return loading(_that);case AddressLoaded():
return loaded(_that);case AddressActionSuccess():
return actionSuccess(_that);case AddressError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AddressInitial value)?  initial,TResult? Function( AddressLoading value)?  loading,TResult? Function( AddressLoaded value)?  loaded,TResult? Function( AddressActionSuccess value)?  actionSuccess,TResult? Function( AddressError value)?  error,}){
final _that = this;
switch (_that) {
case AddressInitial() when initial != null:
return initial(_that);case AddressLoading() when loading != null:
return loading(_that);case AddressLoaded() when loaded != null:
return loaded(_that);case AddressActionSuccess() when actionSuccess != null:
return actionSuccess(_that);case AddressError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<AddressEntity> addresses)?  loaded,TResult Function( List<AddressEntity> addresses,  String message)?  actionSuccess,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AddressInitial() when initial != null:
return initial();case AddressLoading() when loading != null:
return loading();case AddressLoaded() when loaded != null:
return loaded(_that.addresses);case AddressActionSuccess() when actionSuccess != null:
return actionSuccess(_that.addresses,_that.message);case AddressError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<AddressEntity> addresses)  loaded,required TResult Function( List<AddressEntity> addresses,  String message)  actionSuccess,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case AddressInitial():
return initial();case AddressLoading():
return loading();case AddressLoaded():
return loaded(_that.addresses);case AddressActionSuccess():
return actionSuccess(_that.addresses,_that.message);case AddressError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<AddressEntity> addresses)?  loaded,TResult? Function( List<AddressEntity> addresses,  String message)?  actionSuccess,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case AddressInitial() when initial != null:
return initial();case AddressLoading() when loading != null:
return loading();case AddressLoaded() when loaded != null:
return loaded(_that.addresses);case AddressActionSuccess() when actionSuccess != null:
return actionSuccess(_that.addresses,_that.message);case AddressError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class AddressInitial implements AddressState {
  const AddressInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddressInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AddressState.initial()';
}


}




/// @nodoc


class AddressLoading implements AddressState {
  const AddressLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddressLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AddressState.loading()';
}


}




/// @nodoc


class AddressLoaded implements AddressState {
  const AddressLoaded(final  List<AddressEntity> addresses): _addresses = addresses;
  

 final  List<AddressEntity> _addresses;
 List<AddressEntity> get addresses {
  if (_addresses is EqualUnmodifiableListView) return _addresses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_addresses);
}


/// Create a copy of AddressState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddressLoadedCopyWith<AddressLoaded> get copyWith => _$AddressLoadedCopyWithImpl<AddressLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddressLoaded&&const DeepCollectionEquality().equals(other._addresses, _addresses));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_addresses));

@override
String toString() {
  return 'AddressState.loaded(addresses: $addresses)';
}


}

/// @nodoc
abstract mixin class $AddressLoadedCopyWith<$Res> implements $AddressStateCopyWith<$Res> {
  factory $AddressLoadedCopyWith(AddressLoaded value, $Res Function(AddressLoaded) _then) = _$AddressLoadedCopyWithImpl;
@useResult
$Res call({
 List<AddressEntity> addresses
});




}
/// @nodoc
class _$AddressLoadedCopyWithImpl<$Res>
    implements $AddressLoadedCopyWith<$Res> {
  _$AddressLoadedCopyWithImpl(this._self, this._then);

  final AddressLoaded _self;
  final $Res Function(AddressLoaded) _then;

/// Create a copy of AddressState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? addresses = null,}) {
  return _then(AddressLoaded(
null == addresses ? _self._addresses : addresses // ignore: cast_nullable_to_non_nullable
as List<AddressEntity>,
  ));
}


}

/// @nodoc


class AddressActionSuccess implements AddressState {
  const AddressActionSuccess(final  List<AddressEntity> addresses, this.message): _addresses = addresses;
  

 final  List<AddressEntity> _addresses;
 List<AddressEntity> get addresses {
  if (_addresses is EqualUnmodifiableListView) return _addresses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_addresses);
}

 final  String message;

/// Create a copy of AddressState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddressActionSuccessCopyWith<AddressActionSuccess> get copyWith => _$AddressActionSuccessCopyWithImpl<AddressActionSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddressActionSuccess&&const DeepCollectionEquality().equals(other._addresses, _addresses)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_addresses),message);

@override
String toString() {
  return 'AddressState.actionSuccess(addresses: $addresses, message: $message)';
}


}

/// @nodoc
abstract mixin class $AddressActionSuccessCopyWith<$Res> implements $AddressStateCopyWith<$Res> {
  factory $AddressActionSuccessCopyWith(AddressActionSuccess value, $Res Function(AddressActionSuccess) _then) = _$AddressActionSuccessCopyWithImpl;
@useResult
$Res call({
 List<AddressEntity> addresses, String message
});




}
/// @nodoc
class _$AddressActionSuccessCopyWithImpl<$Res>
    implements $AddressActionSuccessCopyWith<$Res> {
  _$AddressActionSuccessCopyWithImpl(this._self, this._then);

  final AddressActionSuccess _self;
  final $Res Function(AddressActionSuccess) _then;

/// Create a copy of AddressState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? addresses = null,Object? message = null,}) {
  return _then(AddressActionSuccess(
null == addresses ? _self._addresses : addresses // ignore: cast_nullable_to_non_nullable
as List<AddressEntity>,null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AddressError implements AddressState {
  const AddressError(this.message);
  

 final  String message;

/// Create a copy of AddressState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddressErrorCopyWith<AddressError> get copyWith => _$AddressErrorCopyWithImpl<AddressError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddressError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AddressState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $AddressErrorCopyWith<$Res> implements $AddressStateCopyWith<$Res> {
  factory $AddressErrorCopyWith(AddressError value, $Res Function(AddressError) _then) = _$AddressErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$AddressErrorCopyWithImpl<$Res>
    implements $AddressErrorCopyWith<$Res> {
  _$AddressErrorCopyWithImpl(this._self, this._then);

  final AddressError _self;
  final $Res Function(AddressError) _then;

/// Create a copy of AddressState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(AddressError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
