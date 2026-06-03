// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'employee_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EmployeeState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmployeeState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EmployeeState()';
}


}

/// @nodoc
class $EmployeeStateCopyWith<$Res>  {
$EmployeeStateCopyWith(EmployeeState _, $Res Function(EmployeeState) __);
}


/// Adds pattern-matching-related methods to [EmployeeState].
extension EmployeeStatePatterns on EmployeeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( EmployeeInitial value)?  initial,TResult Function( EmployeeLoading value)?  loading,TResult Function( EmployeeLoaded value)?  loaded,TResult Function( EmployeeError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case EmployeeInitial() when initial != null:
return initial(_that);case EmployeeLoading() when loading != null:
return loading(_that);case EmployeeLoaded() when loaded != null:
return loaded(_that);case EmployeeError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( EmployeeInitial value)  initial,required TResult Function( EmployeeLoading value)  loading,required TResult Function( EmployeeLoaded value)  loaded,required TResult Function( EmployeeError value)  error,}){
final _that = this;
switch (_that) {
case EmployeeInitial():
return initial(_that);case EmployeeLoading():
return loading(_that);case EmployeeLoaded():
return loaded(_that);case EmployeeError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( EmployeeInitial value)?  initial,TResult? Function( EmployeeLoading value)?  loading,TResult? Function( EmployeeLoaded value)?  loaded,TResult? Function( EmployeeError value)?  error,}){
final _that = this;
switch (_that) {
case EmployeeInitial() when initial != null:
return initial(_that);case EmployeeLoading() when loading != null:
return loading(_that);case EmployeeLoaded() when loaded != null:
return loaded(_that);case EmployeeError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<Employee> employees,  List<Employee> filtered,  bool isLoadingMore,  bool hasReachedMax,  int currentPage)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case EmployeeInitial() when initial != null:
return initial();case EmployeeLoading() when loading != null:
return loading();case EmployeeLoaded() when loaded != null:
return loaded(_that.employees,_that.filtered,_that.isLoadingMore,_that.hasReachedMax,_that.currentPage);case EmployeeError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<Employee> employees,  List<Employee> filtered,  bool isLoadingMore,  bool hasReachedMax,  int currentPage)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case EmployeeInitial():
return initial();case EmployeeLoading():
return loading();case EmployeeLoaded():
return loaded(_that.employees,_that.filtered,_that.isLoadingMore,_that.hasReachedMax,_that.currentPage);case EmployeeError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<Employee> employees,  List<Employee> filtered,  bool isLoadingMore,  bool hasReachedMax,  int currentPage)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case EmployeeInitial() when initial != null:
return initial();case EmployeeLoading() when loading != null:
return loading();case EmployeeLoaded() when loaded != null:
return loaded(_that.employees,_that.filtered,_that.isLoadingMore,_that.hasReachedMax,_that.currentPage);case EmployeeError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class EmployeeInitial implements EmployeeState {
  const EmployeeInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmployeeInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EmployeeState.initial()';
}


}




/// @nodoc


class EmployeeLoading implements EmployeeState {
  const EmployeeLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmployeeLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EmployeeState.loading()';
}


}




/// @nodoc


class EmployeeLoaded implements EmployeeState {
  const EmployeeLoaded({required final  List<Employee> employees, required final  List<Employee> filtered, this.isLoadingMore = false, this.hasReachedMax = false, this.currentPage = 1}): _employees = employees,_filtered = filtered;
  

 final  List<Employee> _employees;
 List<Employee> get employees {
  if (_employees is EqualUnmodifiableListView) return _employees;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_employees);
}

 final  List<Employee> _filtered;
 List<Employee> get filtered {
  if (_filtered is EqualUnmodifiableListView) return _filtered;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_filtered);
}

@JsonKey() final  bool isLoadingMore;
// ← tambah
@JsonKey() final  bool hasReachedMax;
// ← tambah
@JsonKey() final  int currentPage;

/// Create a copy of EmployeeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmployeeLoadedCopyWith<EmployeeLoaded> get copyWith => _$EmployeeLoadedCopyWithImpl<EmployeeLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmployeeLoaded&&const DeepCollectionEquality().equals(other._employees, _employees)&&const DeepCollectionEquality().equals(other._filtered, _filtered)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.hasReachedMax, hasReachedMax) || other.hasReachedMax == hasReachedMax)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_employees),const DeepCollectionEquality().hash(_filtered),isLoadingMore,hasReachedMax,currentPage);

@override
String toString() {
  return 'EmployeeState.loaded(employees: $employees, filtered: $filtered, isLoadingMore: $isLoadingMore, hasReachedMax: $hasReachedMax, currentPage: $currentPage)';
}


}

/// @nodoc
abstract mixin class $EmployeeLoadedCopyWith<$Res> implements $EmployeeStateCopyWith<$Res> {
  factory $EmployeeLoadedCopyWith(EmployeeLoaded value, $Res Function(EmployeeLoaded) _then) = _$EmployeeLoadedCopyWithImpl;
@useResult
$Res call({
 List<Employee> employees, List<Employee> filtered, bool isLoadingMore, bool hasReachedMax, int currentPage
});




}
/// @nodoc
class _$EmployeeLoadedCopyWithImpl<$Res>
    implements $EmployeeLoadedCopyWith<$Res> {
  _$EmployeeLoadedCopyWithImpl(this._self, this._then);

  final EmployeeLoaded _self;
  final $Res Function(EmployeeLoaded) _then;

/// Create a copy of EmployeeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? employees = null,Object? filtered = null,Object? isLoadingMore = null,Object? hasReachedMax = null,Object? currentPage = null,}) {
  return _then(EmployeeLoaded(
employees: null == employees ? _self._employees : employees // ignore: cast_nullable_to_non_nullable
as List<Employee>,filtered: null == filtered ? _self._filtered : filtered // ignore: cast_nullable_to_non_nullable
as List<Employee>,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,hasReachedMax: null == hasReachedMax ? _self.hasReachedMax : hasReachedMax // ignore: cast_nullable_to_non_nullable
as bool,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class EmployeeError implements EmployeeState {
  const EmployeeError(this.message);
  

 final  String message;

/// Create a copy of EmployeeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmployeeErrorCopyWith<EmployeeError> get copyWith => _$EmployeeErrorCopyWithImpl<EmployeeError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmployeeError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'EmployeeState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $EmployeeErrorCopyWith<$Res> implements $EmployeeStateCopyWith<$Res> {
  factory $EmployeeErrorCopyWith(EmployeeError value, $Res Function(EmployeeError) _then) = _$EmployeeErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$EmployeeErrorCopyWithImpl<$Res>
    implements $EmployeeErrorCopyWith<$Res> {
  _$EmployeeErrorCopyWithImpl(this._self, this._then);

  final EmployeeError _self;
  final $Res Function(EmployeeError) _then;

/// Create a copy of EmployeeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(EmployeeError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
