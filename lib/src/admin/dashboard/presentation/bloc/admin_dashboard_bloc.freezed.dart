// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_dashboard_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AdminDashboardEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdminDashboardEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AdminDashboardEvent()';
}


}

/// @nodoc
class $AdminDashboardEventCopyWith<$Res>  {
$AdminDashboardEventCopyWith(AdminDashboardEvent _, $Res Function(AdminDashboardEvent) __);
}


/// Adds pattern-matching-related methods to [AdminDashboardEvent].
extension AdminDashboardEventPatterns on AdminDashboardEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AdminDashboardLoad value)?  load,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AdminDashboardLoad() when load != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AdminDashboardLoad value)  load,}){
final _that = this;
switch (_that) {
case AdminDashboardLoad():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AdminDashboardLoad value)?  load,}){
final _that = this;
switch (_that) {
case AdminDashboardLoad() when load != null:
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
case AdminDashboardLoad() when load != null:
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
case AdminDashboardLoad():
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
case AdminDashboardLoad() when load != null:
return load();case _:
  return null;

}
}

}

/// @nodoc


class AdminDashboardLoad implements AdminDashboardEvent {
  const AdminDashboardLoad();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdminDashboardLoad);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AdminDashboardEvent.load()';
}


}




/// @nodoc
mixin _$AdminDashboardState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdminDashboardState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AdminDashboardState()';
}


}

/// @nodoc
class $AdminDashboardStateCopyWith<$Res>  {
$AdminDashboardStateCopyWith(AdminDashboardState _, $Res Function(AdminDashboardState) __);
}


/// Adds pattern-matching-related methods to [AdminDashboardState].
extension AdminDashboardStatePatterns on AdminDashboardState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AdminDashboardInitial value)?  initial,TResult Function( AdminDashboardLoading value)?  loading,TResult Function( AdminDashboardLoaded value)?  loaded,TResult Function( AdminDashboardError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AdminDashboardInitial() when initial != null:
return initial(_that);case AdminDashboardLoading() when loading != null:
return loading(_that);case AdminDashboardLoaded() when loaded != null:
return loaded(_that);case AdminDashboardError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AdminDashboardInitial value)  initial,required TResult Function( AdminDashboardLoading value)  loading,required TResult Function( AdminDashboardLoaded value)  loaded,required TResult Function( AdminDashboardError value)  error,}){
final _that = this;
switch (_that) {
case AdminDashboardInitial():
return initial(_that);case AdminDashboardLoading():
return loading(_that);case AdminDashboardLoaded():
return loaded(_that);case AdminDashboardError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AdminDashboardInitial value)?  initial,TResult? Function( AdminDashboardLoading value)?  loading,TResult? Function( AdminDashboardLoaded value)?  loaded,TResult? Function( AdminDashboardError value)?  error,}){
final _that = this;
switch (_that) {
case AdminDashboardInitial() when initial != null:
return initial(_that);case AdminDashboardLoading() when loading != null:
return loading(_that);case AdminDashboardLoaded() when loaded != null:
return loaded(_that);case AdminDashboardError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( DashboardStats stats)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AdminDashboardInitial() when initial != null:
return initial();case AdminDashboardLoading() when loading != null:
return loading();case AdminDashboardLoaded() when loaded != null:
return loaded(_that.stats);case AdminDashboardError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( DashboardStats stats)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case AdminDashboardInitial():
return initial();case AdminDashboardLoading():
return loading();case AdminDashboardLoaded():
return loaded(_that.stats);case AdminDashboardError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( DashboardStats stats)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case AdminDashboardInitial() when initial != null:
return initial();case AdminDashboardLoading() when loading != null:
return loading();case AdminDashboardLoaded() when loaded != null:
return loaded(_that.stats);case AdminDashboardError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class AdminDashboardInitial implements AdminDashboardState {
  const AdminDashboardInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdminDashboardInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AdminDashboardState.initial()';
}


}




/// @nodoc


class AdminDashboardLoading implements AdminDashboardState {
  const AdminDashboardLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdminDashboardLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AdminDashboardState.loading()';
}


}




/// @nodoc


class AdminDashboardLoaded implements AdminDashboardState {
  const AdminDashboardLoaded(this.stats);
  

 final  DashboardStats stats;

/// Create a copy of AdminDashboardState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AdminDashboardLoadedCopyWith<AdminDashboardLoaded> get copyWith => _$AdminDashboardLoadedCopyWithImpl<AdminDashboardLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdminDashboardLoaded&&(identical(other.stats, stats) || other.stats == stats));
}


@override
int get hashCode => Object.hash(runtimeType,stats);

@override
String toString() {
  return 'AdminDashboardState.loaded(stats: $stats)';
}


}

/// @nodoc
abstract mixin class $AdminDashboardLoadedCopyWith<$Res> implements $AdminDashboardStateCopyWith<$Res> {
  factory $AdminDashboardLoadedCopyWith(AdminDashboardLoaded value, $Res Function(AdminDashboardLoaded) _then) = _$AdminDashboardLoadedCopyWithImpl;
@useResult
$Res call({
 DashboardStats stats
});




}
/// @nodoc
class _$AdminDashboardLoadedCopyWithImpl<$Res>
    implements $AdminDashboardLoadedCopyWith<$Res> {
  _$AdminDashboardLoadedCopyWithImpl(this._self, this._then);

  final AdminDashboardLoaded _self;
  final $Res Function(AdminDashboardLoaded) _then;

/// Create a copy of AdminDashboardState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? stats = null,}) {
  return _then(AdminDashboardLoaded(
null == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as DashboardStats,
  ));
}


}

/// @nodoc


class AdminDashboardError implements AdminDashboardState {
  const AdminDashboardError(this.message);
  

 final  String message;

/// Create a copy of AdminDashboardState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AdminDashboardErrorCopyWith<AdminDashboardError> get copyWith => _$AdminDashboardErrorCopyWithImpl<AdminDashboardError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdminDashboardError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AdminDashboardState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $AdminDashboardErrorCopyWith<$Res> implements $AdminDashboardStateCopyWith<$Res> {
  factory $AdminDashboardErrorCopyWith(AdminDashboardError value, $Res Function(AdminDashboardError) _then) = _$AdminDashboardErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$AdminDashboardErrorCopyWithImpl<$Res>
    implements $AdminDashboardErrorCopyWith<$Res> {
  _$AdminDashboardErrorCopyWithImpl(this._self, this._then);

  final AdminDashboardError _self;
  final $Res Function(AdminDashboardError) _then;

/// Create a copy of AdminDashboardState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(AdminDashboardError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
