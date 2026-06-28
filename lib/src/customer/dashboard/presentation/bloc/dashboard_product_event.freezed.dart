// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_product_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DashboardProductEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardProductEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DashboardProductEvent()';
}


}

/// @nodoc
class $DashboardProductEventCopyWith<$Res>  {
$DashboardProductEventCopyWith(DashboardProductEvent _, $Res Function(DashboardProductEvent) __);
}


/// Adds pattern-matching-related methods to [DashboardProductEvent].
extension DashboardProductEventPatterns on DashboardProductEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( DashboardProductLoad value)?  load,TResult Function( DashboardProductSearchChanged value)?  searchChanged,required TResult orElse(),}){
final _that = this;
switch (_that) {
case DashboardProductLoad() when load != null:
return load(_that);case DashboardProductSearchChanged() when searchChanged != null:
return searchChanged(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( DashboardProductLoad value)  load,required TResult Function( DashboardProductSearchChanged value)  searchChanged,}){
final _that = this;
switch (_that) {
case DashboardProductLoad():
return load(_that);case DashboardProductSearchChanged():
return searchChanged(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( DashboardProductLoad value)?  load,TResult? Function( DashboardProductSearchChanged value)?  searchChanged,}){
final _that = this;
switch (_that) {
case DashboardProductLoad() when load != null:
return load(_that);case DashboardProductSearchChanged() when searchChanged != null:
return searchChanged(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  load,TResult Function( String query)?  searchChanged,required TResult orElse(),}) {final _that = this;
switch (_that) {
case DashboardProductLoad() when load != null:
return load();case DashboardProductSearchChanged() when searchChanged != null:
return searchChanged(_that.query);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  load,required TResult Function( String query)  searchChanged,}) {final _that = this;
switch (_that) {
case DashboardProductLoad():
return load();case DashboardProductSearchChanged():
return searchChanged(_that.query);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  load,TResult? Function( String query)?  searchChanged,}) {final _that = this;
switch (_that) {
case DashboardProductLoad() when load != null:
return load();case DashboardProductSearchChanged() when searchChanged != null:
return searchChanged(_that.query);case _:
  return null;

}
}

}

/// @nodoc


class DashboardProductLoad implements DashboardProductEvent {
  const DashboardProductLoad();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardProductLoad);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DashboardProductEvent.load()';
}


}




/// @nodoc


class DashboardProductSearchChanged implements DashboardProductEvent {
  const DashboardProductSearchChanged(this.query);
  

 final  String query;

/// Create a copy of DashboardProductEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardProductSearchChangedCopyWith<DashboardProductSearchChanged> get copyWith => _$DashboardProductSearchChangedCopyWithImpl<DashboardProductSearchChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardProductSearchChanged&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString() {
  return 'DashboardProductEvent.searchChanged(query: $query)';
}


}

/// @nodoc
abstract mixin class $DashboardProductSearchChangedCopyWith<$Res> implements $DashboardProductEventCopyWith<$Res> {
  factory $DashboardProductSearchChangedCopyWith(DashboardProductSearchChanged value, $Res Function(DashboardProductSearchChanged) _then) = _$DashboardProductSearchChangedCopyWithImpl;
@useResult
$Res call({
 String query
});




}
/// @nodoc
class _$DashboardProductSearchChangedCopyWithImpl<$Res>
    implements $DashboardProductSearchChangedCopyWith<$Res> {
  _$DashboardProductSearchChangedCopyWithImpl(this._self, this._then);

  final DashboardProductSearchChanged _self;
  final $Res Function(DashboardProductSearchChanged) _then;

/// Create a copy of DashboardProductEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(DashboardProductSearchChanged(
null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
