// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_product_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DashboardProductState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardProductState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DashboardProductState()';
}


}

/// @nodoc
class $DashboardProductStateCopyWith<$Res>  {
$DashboardProductStateCopyWith(DashboardProductState _, $Res Function(DashboardProductState) __);
}


/// Adds pattern-matching-related methods to [DashboardProductState].
extension DashboardProductStatePatterns on DashboardProductState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( DashboardProductInitial value)?  initial,TResult Function( DashboardProductLoading value)?  loading,TResult Function( DashboardProductLoaded value)?  loaded,TResult Function( DashboardProductError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case DashboardProductInitial() when initial != null:
return initial(_that);case DashboardProductLoading() when loading != null:
return loading(_that);case DashboardProductLoaded() when loaded != null:
return loaded(_that);case DashboardProductError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( DashboardProductInitial value)  initial,required TResult Function( DashboardProductLoading value)  loading,required TResult Function( DashboardProductLoaded value)  loaded,required TResult Function( DashboardProductError value)  error,}){
final _that = this;
switch (_that) {
case DashboardProductInitial():
return initial(_that);case DashboardProductLoading():
return loading(_that);case DashboardProductLoaded():
return loaded(_that);case DashboardProductError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( DashboardProductInitial value)?  initial,TResult? Function( DashboardProductLoading value)?  loading,TResult? Function( DashboardProductLoaded value)?  loaded,TResult? Function( DashboardProductError value)?  error,}){
final _that = this;
switch (_that) {
case DashboardProductInitial() when initial != null:
return initial(_that);case DashboardProductLoading() when loading != null:
return loading(_that);case DashboardProductLoaded() when loaded != null:
return loaded(_that);case DashboardProductError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<ProductEntity> allProducts,  List<ProductEntity> filteredProducts,  String query)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case DashboardProductInitial() when initial != null:
return initial();case DashboardProductLoading() when loading != null:
return loading();case DashboardProductLoaded() when loaded != null:
return loaded(_that.allProducts,_that.filteredProducts,_that.query);case DashboardProductError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<ProductEntity> allProducts,  List<ProductEntity> filteredProducts,  String query)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case DashboardProductInitial():
return initial();case DashboardProductLoading():
return loading();case DashboardProductLoaded():
return loaded(_that.allProducts,_that.filteredProducts,_that.query);case DashboardProductError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<ProductEntity> allProducts,  List<ProductEntity> filteredProducts,  String query)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case DashboardProductInitial() when initial != null:
return initial();case DashboardProductLoading() when loading != null:
return loading();case DashboardProductLoaded() when loaded != null:
return loaded(_that.allProducts,_that.filteredProducts,_that.query);case DashboardProductError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class DashboardProductInitial implements DashboardProductState {
  const DashboardProductInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardProductInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DashboardProductState.initial()';
}


}




/// @nodoc


class DashboardProductLoading implements DashboardProductState {
  const DashboardProductLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardProductLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DashboardProductState.loading()';
}


}




/// @nodoc


class DashboardProductLoaded implements DashboardProductState {
  const DashboardProductLoaded({required final  List<ProductEntity> allProducts, required final  List<ProductEntity> filteredProducts, this.query = ''}): _allProducts = allProducts,_filteredProducts = filteredProducts;
  

 final  List<ProductEntity> _allProducts;
 List<ProductEntity> get allProducts {
  if (_allProducts is EqualUnmodifiableListView) return _allProducts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_allProducts);
}

 final  List<ProductEntity> _filteredProducts;
 List<ProductEntity> get filteredProducts {
  if (_filteredProducts is EqualUnmodifiableListView) return _filteredProducts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_filteredProducts);
}

@JsonKey() final  String query;

/// Create a copy of DashboardProductState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardProductLoadedCopyWith<DashboardProductLoaded> get copyWith => _$DashboardProductLoadedCopyWithImpl<DashboardProductLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardProductLoaded&&const DeepCollectionEquality().equals(other._allProducts, _allProducts)&&const DeepCollectionEquality().equals(other._filteredProducts, _filteredProducts)&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_allProducts),const DeepCollectionEquality().hash(_filteredProducts),query);

@override
String toString() {
  return 'DashboardProductState.loaded(allProducts: $allProducts, filteredProducts: $filteredProducts, query: $query)';
}


}

/// @nodoc
abstract mixin class $DashboardProductLoadedCopyWith<$Res> implements $DashboardProductStateCopyWith<$Res> {
  factory $DashboardProductLoadedCopyWith(DashboardProductLoaded value, $Res Function(DashboardProductLoaded) _then) = _$DashboardProductLoadedCopyWithImpl;
@useResult
$Res call({
 List<ProductEntity> allProducts, List<ProductEntity> filteredProducts, String query
});




}
/// @nodoc
class _$DashboardProductLoadedCopyWithImpl<$Res>
    implements $DashboardProductLoadedCopyWith<$Res> {
  _$DashboardProductLoadedCopyWithImpl(this._self, this._then);

  final DashboardProductLoaded _self;
  final $Res Function(DashboardProductLoaded) _then;

/// Create a copy of DashboardProductState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? allProducts = null,Object? filteredProducts = null,Object? query = null,}) {
  return _then(DashboardProductLoaded(
allProducts: null == allProducts ? _self._allProducts : allProducts // ignore: cast_nullable_to_non_nullable
as List<ProductEntity>,filteredProducts: null == filteredProducts ? _self._filteredProducts : filteredProducts // ignore: cast_nullable_to_non_nullable
as List<ProductEntity>,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class DashboardProductError implements DashboardProductState {
  const DashboardProductError(this.message);
  

 final  String message;

/// Create a copy of DashboardProductState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardProductErrorCopyWith<DashboardProductError> get copyWith => _$DashboardProductErrorCopyWithImpl<DashboardProductError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardProductError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'DashboardProductState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $DashboardProductErrorCopyWith<$Res> implements $DashboardProductStateCopyWith<$Res> {
  factory $DashboardProductErrorCopyWith(DashboardProductError value, $Res Function(DashboardProductError) _then) = _$DashboardProductErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$DashboardProductErrorCopyWithImpl<$Res>
    implements $DashboardProductErrorCopyWith<$Res> {
  _$DashboardProductErrorCopyWithImpl(this._self, this._then);

  final DashboardProductError _self;
  final $Res Function(DashboardProductError) _then;

/// Create a copy of DashboardProductState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(DashboardProductError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
