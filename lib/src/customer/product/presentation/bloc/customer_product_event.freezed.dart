// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_product_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CustomerProductEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerProductEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CustomerProductEvent()';
}


}

/// @nodoc
class $CustomerProductEventCopyWith<$Res>  {
$CustomerProductEventCopyWith(CustomerProductEvent _, $Res Function(CustomerProductEvent) __);
}


/// Adds pattern-matching-related methods to [CustomerProductEvent].
extension CustomerProductEventPatterns on CustomerProductEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CustomerProductLoad value)?  load,TResult Function( CustomerProductSearchChanged value)?  searchChanged,TResult Function( CustomerProductCategoryChanged value)?  categoryChanged,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CustomerProductLoad() when load != null:
return load(_that);case CustomerProductSearchChanged() when searchChanged != null:
return searchChanged(_that);case CustomerProductCategoryChanged() when categoryChanged != null:
return categoryChanged(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CustomerProductLoad value)  load,required TResult Function( CustomerProductSearchChanged value)  searchChanged,required TResult Function( CustomerProductCategoryChanged value)  categoryChanged,}){
final _that = this;
switch (_that) {
case CustomerProductLoad():
return load(_that);case CustomerProductSearchChanged():
return searchChanged(_that);case CustomerProductCategoryChanged():
return categoryChanged(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CustomerProductLoad value)?  load,TResult? Function( CustomerProductSearchChanged value)?  searchChanged,TResult? Function( CustomerProductCategoryChanged value)?  categoryChanged,}){
final _that = this;
switch (_that) {
case CustomerProductLoad() when load != null:
return load(_that);case CustomerProductSearchChanged() when searchChanged != null:
return searchChanged(_that);case CustomerProductCategoryChanged() when categoryChanged != null:
return categoryChanged(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  load,TResult Function( String query)?  searchChanged,TResult Function( int? categoryId)?  categoryChanged,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CustomerProductLoad() when load != null:
return load();case CustomerProductSearchChanged() when searchChanged != null:
return searchChanged(_that.query);case CustomerProductCategoryChanged() when categoryChanged != null:
return categoryChanged(_that.categoryId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  load,required TResult Function( String query)  searchChanged,required TResult Function( int? categoryId)  categoryChanged,}) {final _that = this;
switch (_that) {
case CustomerProductLoad():
return load();case CustomerProductSearchChanged():
return searchChanged(_that.query);case CustomerProductCategoryChanged():
return categoryChanged(_that.categoryId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  load,TResult? Function( String query)?  searchChanged,TResult? Function( int? categoryId)?  categoryChanged,}) {final _that = this;
switch (_that) {
case CustomerProductLoad() when load != null:
return load();case CustomerProductSearchChanged() when searchChanged != null:
return searchChanged(_that.query);case CustomerProductCategoryChanged() when categoryChanged != null:
return categoryChanged(_that.categoryId);case _:
  return null;

}
}

}

/// @nodoc


class CustomerProductLoad implements CustomerProductEvent {
  const CustomerProductLoad();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerProductLoad);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CustomerProductEvent.load()';
}


}




/// @nodoc


class CustomerProductSearchChanged implements CustomerProductEvent {
  const CustomerProductSearchChanged(this.query);
  

 final  String query;

/// Create a copy of CustomerProductEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerProductSearchChangedCopyWith<CustomerProductSearchChanged> get copyWith => _$CustomerProductSearchChangedCopyWithImpl<CustomerProductSearchChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerProductSearchChanged&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString() {
  return 'CustomerProductEvent.searchChanged(query: $query)';
}


}

/// @nodoc
abstract mixin class $CustomerProductSearchChangedCopyWith<$Res> implements $CustomerProductEventCopyWith<$Res> {
  factory $CustomerProductSearchChangedCopyWith(CustomerProductSearchChanged value, $Res Function(CustomerProductSearchChanged) _then) = _$CustomerProductSearchChangedCopyWithImpl;
@useResult
$Res call({
 String query
});




}
/// @nodoc
class _$CustomerProductSearchChangedCopyWithImpl<$Res>
    implements $CustomerProductSearchChangedCopyWith<$Res> {
  _$CustomerProductSearchChangedCopyWithImpl(this._self, this._then);

  final CustomerProductSearchChanged _self;
  final $Res Function(CustomerProductSearchChanged) _then;

/// Create a copy of CustomerProductEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(CustomerProductSearchChanged(
null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class CustomerProductCategoryChanged implements CustomerProductEvent {
  const CustomerProductCategoryChanged(this.categoryId);
  

 final  int? categoryId;

/// Create a copy of CustomerProductEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerProductCategoryChangedCopyWith<CustomerProductCategoryChanged> get copyWith => _$CustomerProductCategoryChangedCopyWithImpl<CustomerProductCategoryChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerProductCategoryChanged&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId));
}


@override
int get hashCode => Object.hash(runtimeType,categoryId);

@override
String toString() {
  return 'CustomerProductEvent.categoryChanged(categoryId: $categoryId)';
}


}

/// @nodoc
abstract mixin class $CustomerProductCategoryChangedCopyWith<$Res> implements $CustomerProductEventCopyWith<$Res> {
  factory $CustomerProductCategoryChangedCopyWith(CustomerProductCategoryChanged value, $Res Function(CustomerProductCategoryChanged) _then) = _$CustomerProductCategoryChangedCopyWithImpl;
@useResult
$Res call({
 int? categoryId
});




}
/// @nodoc
class _$CustomerProductCategoryChangedCopyWithImpl<$Res>
    implements $CustomerProductCategoryChangedCopyWith<$Res> {
  _$CustomerProductCategoryChangedCopyWithImpl(this._self, this._then);

  final CustomerProductCategoryChanged _self;
  final $Res Function(CustomerProductCategoryChanged) _then;

/// Create a copy of CustomerProductEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? categoryId = freezed,}) {
  return _then(CustomerProductCategoryChanged(
freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
