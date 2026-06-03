// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'employee_detail_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EmployeeDetailEvent {

 int get id;
/// Create a copy of EmployeeDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmployeeDetailEventCopyWith<EmployeeDetailEvent> get copyWith => _$EmployeeDetailEventCopyWithImpl<EmployeeDetailEvent>(this as EmployeeDetailEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmployeeDetailEvent&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'EmployeeDetailEvent(id: $id)';
}


}

/// @nodoc
abstract mixin class $EmployeeDetailEventCopyWith<$Res>  {
  factory $EmployeeDetailEventCopyWith(EmployeeDetailEvent value, $Res Function(EmployeeDetailEvent) _then) = _$EmployeeDetailEventCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class _$EmployeeDetailEventCopyWithImpl<$Res>
    implements $EmployeeDetailEventCopyWith<$Res> {
  _$EmployeeDetailEventCopyWithImpl(this._self, this._then);

  final EmployeeDetailEvent _self;
  final $Res Function(EmployeeDetailEvent) _then;

/// Create a copy of EmployeeDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [EmployeeDetailEvent].
extension EmployeeDetailEventPatterns on EmployeeDetailEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GetEmployeeDetailEvent value)?  getDetail,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GetEmployeeDetailEvent() when getDetail != null:
return getDetail(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GetEmployeeDetailEvent value)  getDetail,}){
final _that = this;
switch (_that) {
case GetEmployeeDetailEvent():
return getDetail(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GetEmployeeDetailEvent value)?  getDetail,}){
final _that = this;
switch (_that) {
case GetEmployeeDetailEvent() when getDetail != null:
return getDetail(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int id)?  getDetail,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GetEmployeeDetailEvent() when getDetail != null:
return getDetail(_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int id)  getDetail,}) {final _that = this;
switch (_that) {
case GetEmployeeDetailEvent():
return getDetail(_that.id);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int id)?  getDetail,}) {final _that = this;
switch (_that) {
case GetEmployeeDetailEvent() when getDetail != null:
return getDetail(_that.id);case _:
  return null;

}
}

}

/// @nodoc


class GetEmployeeDetailEvent implements EmployeeDetailEvent {
  const GetEmployeeDetailEvent(this.id);
  

@override final  int id;

/// Create a copy of EmployeeDetailEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetEmployeeDetailEventCopyWith<GetEmployeeDetailEvent> get copyWith => _$GetEmployeeDetailEventCopyWithImpl<GetEmployeeDetailEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetEmployeeDetailEvent&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'EmployeeDetailEvent.getDetail(id: $id)';
}


}

/// @nodoc
abstract mixin class $GetEmployeeDetailEventCopyWith<$Res> implements $EmployeeDetailEventCopyWith<$Res> {
  factory $GetEmployeeDetailEventCopyWith(GetEmployeeDetailEvent value, $Res Function(GetEmployeeDetailEvent) _then) = _$GetEmployeeDetailEventCopyWithImpl;
@override @useResult
$Res call({
 int id
});




}
/// @nodoc
class _$GetEmployeeDetailEventCopyWithImpl<$Res>
    implements $GetEmployeeDetailEventCopyWith<$Res> {
  _$GetEmployeeDetailEventCopyWithImpl(this._self, this._then);

  final GetEmployeeDetailEvent _self;
  final $Res Function(GetEmployeeDetailEvent) _then;

/// Create a copy of EmployeeDetailEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(GetEmployeeDetailEvent(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
