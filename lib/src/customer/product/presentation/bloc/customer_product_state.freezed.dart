// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_product_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CustomerProductState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerProductState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CustomerProductState()';
}


}

/// @nodoc
class $CustomerProductStateCopyWith<$Res>  {
$CustomerProductStateCopyWith(CustomerProductState _, $Res Function(CustomerProductState) __);
}


/// Adds pattern-matching-related methods to [CustomerProductState].
extension CustomerProductStatePatterns on CustomerProductState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CustomerProductInitial value)?  initial,TResult Function( CustomerProductLoading value)?  loading,TResult Function( CustomerProductLoaded value)?  loaded,TResult Function( CustomerProductError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CustomerProductInitial() when initial != null:
return initial(_that);case CustomerProductLoading() when loading != null:
return loading(_that);case CustomerProductLoaded() when loaded != null:
return loaded(_that);case CustomerProductError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CustomerProductInitial value)  initial,required TResult Function( CustomerProductLoading value)  loading,required TResult Function( CustomerProductLoaded value)  loaded,required TResult Function( CustomerProductError value)  error,}){
final _that = this;
switch (_that) {
case CustomerProductInitial():
return initial(_that);case CustomerProductLoading():
return loading(_that);case CustomerProductLoaded():
return loaded(_that);case CustomerProductError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CustomerProductInitial value)?  initial,TResult? Function( CustomerProductLoading value)?  loading,TResult? Function( CustomerProductLoaded value)?  loaded,TResult? Function( CustomerProductError value)?  error,}){
final _that = this;
switch (_that) {
case CustomerProductInitial() when initial != null:
return initial(_that);case CustomerProductLoading() when loading != null:
return loading(_that);case CustomerProductLoaded() when loaded != null:
return loaded(_that);case CustomerProductError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<ProductEntity> allProducts,  List<ProductEntity> filteredProducts,  List<CategoryEntity> categories,  String query,  int? selectedCategoryId)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CustomerProductInitial() when initial != null:
return initial();case CustomerProductLoading() when loading != null:
return loading();case CustomerProductLoaded() when loaded != null:
return loaded(_that.allProducts,_that.filteredProducts,_that.categories,_that.query,_that.selectedCategoryId);case CustomerProductError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<ProductEntity> allProducts,  List<ProductEntity> filteredProducts,  List<CategoryEntity> categories,  String query,  int? selectedCategoryId)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case CustomerProductInitial():
return initial();case CustomerProductLoading():
return loading();case CustomerProductLoaded():
return loaded(_that.allProducts,_that.filteredProducts,_that.categories,_that.query,_that.selectedCategoryId);case CustomerProductError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<ProductEntity> allProducts,  List<ProductEntity> filteredProducts,  List<CategoryEntity> categories,  String query,  int? selectedCategoryId)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case CustomerProductInitial() when initial != null:
return initial();case CustomerProductLoading() when loading != null:
return loading();case CustomerProductLoaded() when loaded != null:
return loaded(_that.allProducts,_that.filteredProducts,_that.categories,_that.query,_that.selectedCategoryId);case CustomerProductError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class CustomerProductInitial implements CustomerProductState {
  const CustomerProductInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerProductInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CustomerProductState.initial()';
}


}




/// @nodoc


class CustomerProductLoading implements CustomerProductState {
  const CustomerProductLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerProductLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CustomerProductState.loading()';
}


}




/// @nodoc


class CustomerProductLoaded implements CustomerProductState {
  const CustomerProductLoaded({required final  List<ProductEntity> allProducts, required final  List<ProductEntity> filteredProducts, required final  List<CategoryEntity> categories, this.query = '', this.selectedCategoryId}): _allProducts = allProducts,_filteredProducts = filteredProducts,_categories = categories;
  

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

 final  List<CategoryEntity> _categories;
 List<CategoryEntity> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

@JsonKey() final  String query;
 final  int? selectedCategoryId;

/// Create a copy of CustomerProductState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerProductLoadedCopyWith<CustomerProductLoaded> get copyWith => _$CustomerProductLoadedCopyWithImpl<CustomerProductLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerProductLoaded&&const DeepCollectionEquality().equals(other._allProducts, _allProducts)&&const DeepCollectionEquality().equals(other._filteredProducts, _filteredProducts)&&const DeepCollectionEquality().equals(other._categories, _categories)&&(identical(other.query, query) || other.query == query)&&(identical(other.selectedCategoryId, selectedCategoryId) || other.selectedCategoryId == selectedCategoryId));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_allProducts),const DeepCollectionEquality().hash(_filteredProducts),const DeepCollectionEquality().hash(_categories),query,selectedCategoryId);

@override
String toString() {
  return 'CustomerProductState.loaded(allProducts: $allProducts, filteredProducts: $filteredProducts, categories: $categories, query: $query, selectedCategoryId: $selectedCategoryId)';
}


}

/// @nodoc
abstract mixin class $CustomerProductLoadedCopyWith<$Res> implements $CustomerProductStateCopyWith<$Res> {
  factory $CustomerProductLoadedCopyWith(CustomerProductLoaded value, $Res Function(CustomerProductLoaded) _then) = _$CustomerProductLoadedCopyWithImpl;
@useResult
$Res call({
 List<ProductEntity> allProducts, List<ProductEntity> filteredProducts, List<CategoryEntity> categories, String query, int? selectedCategoryId
});




}
/// @nodoc
class _$CustomerProductLoadedCopyWithImpl<$Res>
    implements $CustomerProductLoadedCopyWith<$Res> {
  _$CustomerProductLoadedCopyWithImpl(this._self, this._then);

  final CustomerProductLoaded _self;
  final $Res Function(CustomerProductLoaded) _then;

/// Create a copy of CustomerProductState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? allProducts = null,Object? filteredProducts = null,Object? categories = null,Object? query = null,Object? selectedCategoryId = freezed,}) {
  return _then(CustomerProductLoaded(
allProducts: null == allProducts ? _self._allProducts : allProducts // ignore: cast_nullable_to_non_nullable
as List<ProductEntity>,filteredProducts: null == filteredProducts ? _self._filteredProducts : filteredProducts // ignore: cast_nullable_to_non_nullable
as List<ProductEntity>,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<CategoryEntity>,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,selectedCategoryId: freezed == selectedCategoryId ? _self.selectedCategoryId : selectedCategoryId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc


class CustomerProductError implements CustomerProductState {
  const CustomerProductError(this.message);
  

 final  String message;

/// Create a copy of CustomerProductState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerProductErrorCopyWith<CustomerProductError> get copyWith => _$CustomerProductErrorCopyWithImpl<CustomerProductError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerProductError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'CustomerProductState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $CustomerProductErrorCopyWith<$Res> implements $CustomerProductStateCopyWith<$Res> {
  factory $CustomerProductErrorCopyWith(CustomerProductError value, $Res Function(CustomerProductError) _then) = _$CustomerProductErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$CustomerProductErrorCopyWithImpl<$Res>
    implements $CustomerProductErrorCopyWith<$Res> {
  _$CustomerProductErrorCopyWithImpl(this._self, this._then);

  final CustomerProductError _self;
  final $Res Function(CustomerProductError) _then;

/// Create a copy of CustomerProductState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(CustomerProductError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
