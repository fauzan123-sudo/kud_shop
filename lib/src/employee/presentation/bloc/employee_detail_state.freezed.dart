// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'employee_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EmployeeDetailState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmployeeDetailState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EmployeeDetailState()';
}


}

/// @nodoc
class $EmployeeDetailStateCopyWith<$Res>  {
$EmployeeDetailStateCopyWith(EmployeeDetailState _, $Res Function(EmployeeDetailState) __);
}


/// Adds pattern-matching-related methods to [EmployeeDetailState].
extension EmployeeDetailStatePatterns on EmployeeDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( EmployeeDetailInitial value)?  initial,TResult Function( EmployeeDetailLoading value)?  loading,TResult Function( EmployeeDetailLoaded value)?  loaded,TResult Function( EmployeeDetailError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case EmployeeDetailInitial() when initial != null:
return initial(_that);case EmployeeDetailLoading() when loading != null:
return loading(_that);case EmployeeDetailLoaded() when loaded != null:
return loaded(_that);case EmployeeDetailError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( EmployeeDetailInitial value)  initial,required TResult Function( EmployeeDetailLoading value)  loading,required TResult Function( EmployeeDetailLoaded value)  loaded,required TResult Function( EmployeeDetailError value)  error,}){
final _that = this;
switch (_that) {
case EmployeeDetailInitial():
return initial(_that);case EmployeeDetailLoading():
return loading(_that);case EmployeeDetailLoaded():
return loaded(_that);case EmployeeDetailError():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( EmployeeDetailInitial value)?  initial,TResult? Function( EmployeeDetailLoading value)?  loading,TResult? Function( EmployeeDetailLoaded value)?  loaded,TResult? Function( EmployeeDetailError value)?  error,}){
final _that = this;
switch (_that) {
case EmployeeDetailInitial() when initial != null:
return initial(_that);case EmployeeDetailLoading() when loading != null:
return loading(_that);case EmployeeDetailLoaded() when loaded != null:
return loaded(_that);case EmployeeDetailError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( Employee employee)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case EmployeeDetailInitial() when initial != null:
return initial();case EmployeeDetailLoading() when loading != null:
return loading();case EmployeeDetailLoaded() when loaded != null:
return loaded(_that.employee);case EmployeeDetailError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( Employee employee)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case EmployeeDetailInitial():
return initial();case EmployeeDetailLoading():
return loading();case EmployeeDetailLoaded():
return loaded(_that.employee);case EmployeeDetailError():
return error(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( Employee employee)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case EmployeeDetailInitial() when initial != null:
return initial();case EmployeeDetailLoading() when loading != null:
return loading();case EmployeeDetailLoaded() when loaded != null:
return loaded(_that.employee);case EmployeeDetailError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class EmployeeDetailInitial implements EmployeeDetailState {
  const EmployeeDetailInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmployeeDetailInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EmployeeDetailState.initial()';
}


}




/// @nodoc


class EmployeeDetailLoading implements EmployeeDetailState {
  const EmployeeDetailLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmployeeDetailLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EmployeeDetailState.loading()';
}


}




/// @nodoc


class EmployeeDetailLoaded implements EmployeeDetailState {
  const EmployeeDetailLoaded(this.employee);
  

 final  Employee employee;

/// Create a copy of EmployeeDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmployeeDetailLoadedCopyWith<EmployeeDetailLoaded> get copyWith => _$EmployeeDetailLoadedCopyWithImpl<EmployeeDetailLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmployeeDetailLoaded&&(identical(other.employee, employee) || other.employee == employee));
}


@override
int get hashCode => Object.hash(runtimeType,employee);

@override
String toString() {
  return 'EmployeeDetailState.loaded(employee: $employee)';
}


}

/// @nodoc
abstract mixin class $EmployeeDetailLoadedCopyWith<$Res> implements $EmployeeDetailStateCopyWith<$Res> {
  factory $EmployeeDetailLoadedCopyWith(EmployeeDetailLoaded value, $Res Function(EmployeeDetailLoaded) _then) = _$EmployeeDetailLoadedCopyWithImpl;
@useResult
$Res call({
 Employee employee
});


$EmployeeCopyWith<$Res> get employee;

}
/// @nodoc
class _$EmployeeDetailLoadedCopyWithImpl<$Res>
    implements $EmployeeDetailLoadedCopyWith<$Res> {
  _$EmployeeDetailLoadedCopyWithImpl(this._self, this._then);

  final EmployeeDetailLoaded _self;
  final $Res Function(EmployeeDetailLoaded) _then;

/// Create a copy of EmployeeDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? employee = null,}) {
  return _then(EmployeeDetailLoaded(
null == employee ? _self.employee : employee // ignore: cast_nullable_to_non_nullable
as Employee,
  ));
}

/// Create a copy of EmployeeDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EmployeeCopyWith<$Res> get employee {
  
  return $EmployeeCopyWith<$Res>(_self.employee, (value) {
    return _then(_self.copyWith(employee: value));
  });
}
}

/// @nodoc


class EmployeeDetailError implements EmployeeDetailState {
  const EmployeeDetailError(this.message);
  

 final  String message;

/// Create a copy of EmployeeDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmployeeDetailErrorCopyWith<EmployeeDetailError> get copyWith => _$EmployeeDetailErrorCopyWithImpl<EmployeeDetailError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmployeeDetailError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'EmployeeDetailState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $EmployeeDetailErrorCopyWith<$Res> implements $EmployeeDetailStateCopyWith<$Res> {
  factory $EmployeeDetailErrorCopyWith(EmployeeDetailError value, $Res Function(EmployeeDetailError) _then) = _$EmployeeDetailErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$EmployeeDetailErrorCopyWithImpl<$Res>
    implements $EmployeeDetailErrorCopyWith<$Res> {
  _$EmployeeDetailErrorCopyWithImpl(this._self, this._then);

  final EmployeeDetailError _self;
  final $Res Function(EmployeeDetailError) _then;

/// Create a copy of EmployeeDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(EmployeeDetailError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
