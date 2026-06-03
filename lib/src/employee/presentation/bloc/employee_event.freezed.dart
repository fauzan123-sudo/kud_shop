// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'employee_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EmployeeEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmployeeEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EmployeeEvent()';
}


}

/// @nodoc
class $EmployeeEventCopyWith<$Res>  {
$EmployeeEventCopyWith(EmployeeEvent _, $Res Function(EmployeeEvent) __);
}


/// Adds pattern-matching-related methods to [EmployeeEvent].
extension EmployeeEventPatterns on EmployeeEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GetEmployeesEvent value)?  getEmployees,TResult Function( LoadMoreEmployeesEvent value)?  loadMore,TResult Function( SearchEmployeeEvent value)?  search,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GetEmployeesEvent() when getEmployees != null:
return getEmployees(_that);case LoadMoreEmployeesEvent() when loadMore != null:
return loadMore(_that);case SearchEmployeeEvent() when search != null:
return search(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GetEmployeesEvent value)  getEmployees,required TResult Function( LoadMoreEmployeesEvent value)  loadMore,required TResult Function( SearchEmployeeEvent value)  search,}){
final _that = this;
switch (_that) {
case GetEmployeesEvent():
return getEmployees(_that);case LoadMoreEmployeesEvent():
return loadMore(_that);case SearchEmployeeEvent():
return search(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GetEmployeesEvent value)?  getEmployees,TResult? Function( LoadMoreEmployeesEvent value)?  loadMore,TResult? Function( SearchEmployeeEvent value)?  search,}){
final _that = this;
switch (_that) {
case GetEmployeesEvent() when getEmployees != null:
return getEmployees(_that);case LoadMoreEmployeesEvent() when loadMore != null:
return loadMore(_that);case SearchEmployeeEvent() when search != null:
return search(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  getEmployees,TResult Function()?  loadMore,TResult Function( String query)?  search,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GetEmployeesEvent() when getEmployees != null:
return getEmployees();case LoadMoreEmployeesEvent() when loadMore != null:
return loadMore();case SearchEmployeeEvent() when search != null:
return search(_that.query);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  getEmployees,required TResult Function()  loadMore,required TResult Function( String query)  search,}) {final _that = this;
switch (_that) {
case GetEmployeesEvent():
return getEmployees();case LoadMoreEmployeesEvent():
return loadMore();case SearchEmployeeEvent():
return search(_that.query);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  getEmployees,TResult? Function()?  loadMore,TResult? Function( String query)?  search,}) {final _that = this;
switch (_that) {
case GetEmployeesEvent() when getEmployees != null:
return getEmployees();case LoadMoreEmployeesEvent() when loadMore != null:
return loadMore();case SearchEmployeeEvent() when search != null:
return search(_that.query);case _:
  return null;

}
}

}

/// @nodoc


class GetEmployeesEvent implements EmployeeEvent {
  const GetEmployeesEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetEmployeesEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EmployeeEvent.getEmployees()';
}


}




/// @nodoc


class LoadMoreEmployeesEvent implements EmployeeEvent {
  const LoadMoreEmployeesEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadMoreEmployeesEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EmployeeEvent.loadMore()';
}


}




/// @nodoc


class SearchEmployeeEvent implements EmployeeEvent {
  const SearchEmployeeEvent(this.query);
  

 final  String query;

/// Create a copy of EmployeeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchEmployeeEventCopyWith<SearchEmployeeEvent> get copyWith => _$SearchEmployeeEventCopyWithImpl<SearchEmployeeEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchEmployeeEvent&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString() {
  return 'EmployeeEvent.search(query: $query)';
}


}

/// @nodoc
abstract mixin class $SearchEmployeeEventCopyWith<$Res> implements $EmployeeEventCopyWith<$Res> {
  factory $SearchEmployeeEventCopyWith(SearchEmployeeEvent value, $Res Function(SearchEmployeeEvent) _then) = _$SearchEmployeeEventCopyWithImpl;
@useResult
$Res call({
 String query
});




}
/// @nodoc
class _$SearchEmployeeEventCopyWithImpl<$Res>
    implements $SearchEmployeeEventCopyWith<$Res> {
  _$SearchEmployeeEventCopyWithImpl(this._self, this._then);

  final SearchEmployeeEvent _self;
  final $Res Function(SearchEmployeeEvent) _then;

/// Create a copy of EmployeeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(SearchEmployeeEvent(
null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
