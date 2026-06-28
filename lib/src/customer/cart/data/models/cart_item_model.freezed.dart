// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CartItemModel {

 int get id; int get quantity;@JsonKey(name: 'product_id') int get productId; CartProductModel get products;
/// Create a copy of CartItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CartItemModelCopyWith<CartItemModel> get copyWith => _$CartItemModelCopyWithImpl<CartItemModel>(this as CartItemModel, _$identity);

  /// Serializes this CartItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.products, products) || other.products == products));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,quantity,productId,products);

@override
String toString() {
  return 'CartItemModel(id: $id, quantity: $quantity, productId: $productId, products: $products)';
}


}

/// @nodoc
abstract mixin class $CartItemModelCopyWith<$Res>  {
  factory $CartItemModelCopyWith(CartItemModel value, $Res Function(CartItemModel) _then) = _$CartItemModelCopyWithImpl;
@useResult
$Res call({
 int id, int quantity,@JsonKey(name: 'product_id') int productId, CartProductModel products
});


$CartProductModelCopyWith<$Res> get products;

}
/// @nodoc
class _$CartItemModelCopyWithImpl<$Res>
    implements $CartItemModelCopyWith<$Res> {
  _$CartItemModelCopyWithImpl(this._self, this._then);

  final CartItemModel _self;
  final $Res Function(CartItemModel) _then;

/// Create a copy of CartItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? quantity = null,Object? productId = null,Object? products = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,products: null == products ? _self.products : products // ignore: cast_nullable_to_non_nullable
as CartProductModel,
  ));
}
/// Create a copy of CartItemModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CartProductModelCopyWith<$Res> get products {
  
  return $CartProductModelCopyWith<$Res>(_self.products, (value) {
    return _then(_self.copyWith(products: value));
  });
}
}


/// Adds pattern-matching-related methods to [CartItemModel].
extension CartItemModelPatterns on CartItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CartItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CartItemModel() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CartItemModel value)  $default,){
final _that = this;
switch (_that) {
case _CartItemModel():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CartItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _CartItemModel() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int quantity, @JsonKey(name: 'product_id')  int productId,  CartProductModel products)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CartItemModel() when $default != null:
return $default(_that.id,_that.quantity,_that.productId,_that.products);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int quantity, @JsonKey(name: 'product_id')  int productId,  CartProductModel products)  $default,) {final _that = this;
switch (_that) {
case _CartItemModel():
return $default(_that.id,_that.quantity,_that.productId,_that.products);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int quantity, @JsonKey(name: 'product_id')  int productId,  CartProductModel products)?  $default,) {final _that = this;
switch (_that) {
case _CartItemModel() when $default != null:
return $default(_that.id,_that.quantity,_that.productId,_that.products);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CartItemModel implements CartItemModel {
  const _CartItemModel({required this.id, required this.quantity, @JsonKey(name: 'product_id') required this.productId, required this.products});
  factory _CartItemModel.fromJson(Map<String, dynamic> json) => _$CartItemModelFromJson(json);

@override final  int id;
@override final  int quantity;
@override@JsonKey(name: 'product_id') final  int productId;
@override final  CartProductModel products;

/// Create a copy of CartItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CartItemModelCopyWith<_CartItemModel> get copyWith => __$CartItemModelCopyWithImpl<_CartItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CartItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CartItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.products, products) || other.products == products));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,quantity,productId,products);

@override
String toString() {
  return 'CartItemModel(id: $id, quantity: $quantity, productId: $productId, products: $products)';
}


}

/// @nodoc
abstract mixin class _$CartItemModelCopyWith<$Res> implements $CartItemModelCopyWith<$Res> {
  factory _$CartItemModelCopyWith(_CartItemModel value, $Res Function(_CartItemModel) _then) = __$CartItemModelCopyWithImpl;
@override @useResult
$Res call({
 int id, int quantity,@JsonKey(name: 'product_id') int productId, CartProductModel products
});


@override $CartProductModelCopyWith<$Res> get products;

}
/// @nodoc
class __$CartItemModelCopyWithImpl<$Res>
    implements _$CartItemModelCopyWith<$Res> {
  __$CartItemModelCopyWithImpl(this._self, this._then);

  final _CartItemModel _self;
  final $Res Function(_CartItemModel) _then;

/// Create a copy of CartItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? quantity = null,Object? productId = null,Object? products = null,}) {
  return _then(_CartItemModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,products: null == products ? _self.products : products // ignore: cast_nullable_to_non_nullable
as CartProductModel,
  ));
}

/// Create a copy of CartItemModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CartProductModelCopyWith<$Res> get products {
  
  return $CartProductModelCopyWith<$Res>(_self.products, (value) {
    return _then(_self.copyWith(products: value));
  });
}
}


/// @nodoc
mixin _$CartProductModel {

 int get id; String get name; double get price;@JsonKey(name: 'image_url') String? get imageUrl; int get stock;@JsonKey(name: 'is_active') bool get isActive;
/// Create a copy of CartProductModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CartProductModelCopyWith<CartProductModel> get copyWith => _$CartProductModelCopyWithImpl<CartProductModel>(this as CartProductModel, _$identity);

  /// Serializes this CartProductModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartProductModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.stock, stock) || other.stock == stock)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,price,imageUrl,stock,isActive);

@override
String toString() {
  return 'CartProductModel(id: $id, name: $name, price: $price, imageUrl: $imageUrl, stock: $stock, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class $CartProductModelCopyWith<$Res>  {
  factory $CartProductModelCopyWith(CartProductModel value, $Res Function(CartProductModel) _then) = _$CartProductModelCopyWithImpl;
@useResult
$Res call({
 int id, String name, double price,@JsonKey(name: 'image_url') String? imageUrl, int stock,@JsonKey(name: 'is_active') bool isActive
});




}
/// @nodoc
class _$CartProductModelCopyWithImpl<$Res>
    implements $CartProductModelCopyWith<$Res> {
  _$CartProductModelCopyWithImpl(this._self, this._then);

  final CartProductModel _self;
  final $Res Function(CartProductModel) _then;

/// Create a copy of CartProductModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? price = null,Object? imageUrl = freezed,Object? stock = null,Object? isActive = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [CartProductModel].
extension CartProductModelPatterns on CartProductModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CartProductModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CartProductModel() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CartProductModel value)  $default,){
final _that = this;
switch (_that) {
case _CartProductModel():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CartProductModel value)?  $default,){
final _that = this;
switch (_that) {
case _CartProductModel() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  double price, @JsonKey(name: 'image_url')  String? imageUrl,  int stock, @JsonKey(name: 'is_active')  bool isActive)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CartProductModel() when $default != null:
return $default(_that.id,_that.name,_that.price,_that.imageUrl,_that.stock,_that.isActive);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  double price, @JsonKey(name: 'image_url')  String? imageUrl,  int stock, @JsonKey(name: 'is_active')  bool isActive)  $default,) {final _that = this;
switch (_that) {
case _CartProductModel():
return $default(_that.id,_that.name,_that.price,_that.imageUrl,_that.stock,_that.isActive);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  double price, @JsonKey(name: 'image_url')  String? imageUrl,  int stock, @JsonKey(name: 'is_active')  bool isActive)?  $default,) {final _that = this;
switch (_that) {
case _CartProductModel() when $default != null:
return $default(_that.id,_that.name,_that.price,_that.imageUrl,_that.stock,_that.isActive);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CartProductModel implements CartProductModel {
  const _CartProductModel({required this.id, required this.name, required this.price, @JsonKey(name: 'image_url') this.imageUrl, required this.stock, @JsonKey(name: 'is_active') required this.isActive});
  factory _CartProductModel.fromJson(Map<String, dynamic> json) => _$CartProductModelFromJson(json);

@override final  int id;
@override final  String name;
@override final  double price;
@override@JsonKey(name: 'image_url') final  String? imageUrl;
@override final  int stock;
@override@JsonKey(name: 'is_active') final  bool isActive;

/// Create a copy of CartProductModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CartProductModelCopyWith<_CartProductModel> get copyWith => __$CartProductModelCopyWithImpl<_CartProductModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CartProductModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CartProductModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.stock, stock) || other.stock == stock)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,price,imageUrl,stock,isActive);

@override
String toString() {
  return 'CartProductModel(id: $id, name: $name, price: $price, imageUrl: $imageUrl, stock: $stock, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class _$CartProductModelCopyWith<$Res> implements $CartProductModelCopyWith<$Res> {
  factory _$CartProductModelCopyWith(_CartProductModel value, $Res Function(_CartProductModel) _then) = __$CartProductModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, double price,@JsonKey(name: 'image_url') String? imageUrl, int stock,@JsonKey(name: 'is_active') bool isActive
});




}
/// @nodoc
class __$CartProductModelCopyWithImpl<$Res>
    implements _$CartProductModelCopyWith<$Res> {
  __$CartProductModelCopyWithImpl(this._self, this._then);

  final _CartProductModel _self;
  final $Res Function(_CartProductModel) _then;

/// Create a copy of CartProductModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? price = null,Object? imageUrl = freezed,Object? stock = null,Object? isActive = null,}) {
  return _then(_CartProductModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
