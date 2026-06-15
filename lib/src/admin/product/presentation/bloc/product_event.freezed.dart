// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProductEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductEvent()';
}


}

/// @nodoc
class $ProductEventCopyWith<$Res>  {
$ProductEventCopyWith(ProductEvent _, $Res Function(ProductEvent) __);
}


/// Adds pattern-matching-related methods to [ProductEvent].
extension ProductEventPatterns on ProductEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ProductLoad value)?  load,TResult Function( ProductCreate value)?  create,TResult Function( ProductUpdate value)?  update,TResult Function( ProductDelete value)?  delete,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ProductLoad() when load != null:
return load(_that);case ProductCreate() when create != null:
return create(_that);case ProductUpdate() when update != null:
return update(_that);case ProductDelete() when delete != null:
return delete(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ProductLoad value)  load,required TResult Function( ProductCreate value)  create,required TResult Function( ProductUpdate value)  update,required TResult Function( ProductDelete value)  delete,}){
final _that = this;
switch (_that) {
case ProductLoad():
return load(_that);case ProductCreate():
return create(_that);case ProductUpdate():
return update(_that);case ProductDelete():
return delete(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ProductLoad value)?  load,TResult? Function( ProductCreate value)?  create,TResult? Function( ProductUpdate value)?  update,TResult? Function( ProductDelete value)?  delete,}){
final _that = this;
switch (_that) {
case ProductLoad() when load != null:
return load(_that);case ProductCreate() when create != null:
return create(_that);case ProductUpdate() when update != null:
return update(_that);case ProductDelete() when delete != null:
return delete(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  load,TResult Function( int? categoryId,  String name,  String? description,  double price,  int stock,  String? imageUrl,  String unit,  bool isActive)?  create,TResult Function( int id,  int? categoryId,  String name,  String? description,  double price,  int stock,  String? imageUrl,  String unit,  bool isActive)?  update,TResult Function( int id)?  delete,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ProductLoad() when load != null:
return load();case ProductCreate() when create != null:
return create(_that.categoryId,_that.name,_that.description,_that.price,_that.stock,_that.imageUrl,_that.unit,_that.isActive);case ProductUpdate() when update != null:
return update(_that.id,_that.categoryId,_that.name,_that.description,_that.price,_that.stock,_that.imageUrl,_that.unit,_that.isActive);case ProductDelete() when delete != null:
return delete(_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  load,required TResult Function( int? categoryId,  String name,  String? description,  double price,  int stock,  String? imageUrl,  String unit,  bool isActive)  create,required TResult Function( int id,  int? categoryId,  String name,  String? description,  double price,  int stock,  String? imageUrl,  String unit,  bool isActive)  update,required TResult Function( int id)  delete,}) {final _that = this;
switch (_that) {
case ProductLoad():
return load();case ProductCreate():
return create(_that.categoryId,_that.name,_that.description,_that.price,_that.stock,_that.imageUrl,_that.unit,_that.isActive);case ProductUpdate():
return update(_that.id,_that.categoryId,_that.name,_that.description,_that.price,_that.stock,_that.imageUrl,_that.unit,_that.isActive);case ProductDelete():
return delete(_that.id);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  load,TResult? Function( int? categoryId,  String name,  String? description,  double price,  int stock,  String? imageUrl,  String unit,  bool isActive)?  create,TResult? Function( int id,  int? categoryId,  String name,  String? description,  double price,  int stock,  String? imageUrl,  String unit,  bool isActive)?  update,TResult? Function( int id)?  delete,}) {final _that = this;
switch (_that) {
case ProductLoad() when load != null:
return load();case ProductCreate() when create != null:
return create(_that.categoryId,_that.name,_that.description,_that.price,_that.stock,_that.imageUrl,_that.unit,_that.isActive);case ProductUpdate() when update != null:
return update(_that.id,_that.categoryId,_that.name,_that.description,_that.price,_that.stock,_that.imageUrl,_that.unit,_that.isActive);case ProductDelete() when delete != null:
return delete(_that.id);case _:
  return null;

}
}

}

/// @nodoc


class ProductLoad implements ProductEvent {
  const ProductLoad();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductLoad);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductEvent.load()';
}


}




/// @nodoc


class ProductCreate implements ProductEvent {
  const ProductCreate({required this.categoryId, required this.name, this.description, required this.price, required this.stock, this.imageUrl, required this.unit, this.isActive = true});
  

 final  int? categoryId;
 final  String name;
 final  String? description;
 final  double price;
 final  int stock;
 final  String? imageUrl;
 final  String unit;
@JsonKey() final  bool isActive;

/// Create a copy of ProductEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductCreateCopyWith<ProductCreate> get copyWith => _$ProductCreateCopyWithImpl<ProductCreate>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductCreate&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.stock, stock) || other.stock == stock)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}


@override
int get hashCode => Object.hash(runtimeType,categoryId,name,description,price,stock,imageUrl,unit,isActive);

@override
String toString() {
  return 'ProductEvent.create(categoryId: $categoryId, name: $name, description: $description, price: $price, stock: $stock, imageUrl: $imageUrl, unit: $unit, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class $ProductCreateCopyWith<$Res> implements $ProductEventCopyWith<$Res> {
  factory $ProductCreateCopyWith(ProductCreate value, $Res Function(ProductCreate) _then) = _$ProductCreateCopyWithImpl;
@useResult
$Res call({
 int? categoryId, String name, String? description, double price, int stock, String? imageUrl, String unit, bool isActive
});




}
/// @nodoc
class _$ProductCreateCopyWithImpl<$Res>
    implements $ProductCreateCopyWith<$Res> {
  _$ProductCreateCopyWithImpl(this._self, this._then);

  final ProductCreate _self;
  final $Res Function(ProductCreate) _then;

/// Create a copy of ProductEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? categoryId = freezed,Object? name = null,Object? description = freezed,Object? price = null,Object? stock = null,Object? imageUrl = freezed,Object? unit = null,Object? isActive = null,}) {
  return _then(ProductCreate(
categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class ProductUpdate implements ProductEvent {
  const ProductUpdate({required this.id, required this.categoryId, required this.name, this.description, required this.price, required this.stock, this.imageUrl, required this.unit, required this.isActive});
  

 final  int id;
 final  int? categoryId;
 final  String name;
 final  String? description;
 final  double price;
 final  int stock;
 final  String? imageUrl;
 final  String unit;
 final  bool isActive;

/// Create a copy of ProductEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductUpdateCopyWith<ProductUpdate> get copyWith => _$ProductUpdateCopyWithImpl<ProductUpdate>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductUpdate&&(identical(other.id, id) || other.id == id)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.stock, stock) || other.stock == stock)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}


@override
int get hashCode => Object.hash(runtimeType,id,categoryId,name,description,price,stock,imageUrl,unit,isActive);

@override
String toString() {
  return 'ProductEvent.update(id: $id, categoryId: $categoryId, name: $name, description: $description, price: $price, stock: $stock, imageUrl: $imageUrl, unit: $unit, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class $ProductUpdateCopyWith<$Res> implements $ProductEventCopyWith<$Res> {
  factory $ProductUpdateCopyWith(ProductUpdate value, $Res Function(ProductUpdate) _then) = _$ProductUpdateCopyWithImpl;
@useResult
$Res call({
 int id, int? categoryId, String name, String? description, double price, int stock, String? imageUrl, String unit, bool isActive
});




}
/// @nodoc
class _$ProductUpdateCopyWithImpl<$Res>
    implements $ProductUpdateCopyWith<$Res> {
  _$ProductUpdateCopyWithImpl(this._self, this._then);

  final ProductUpdate _self;
  final $Res Function(ProductUpdate) _then;

/// Create a copy of ProductEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,Object? categoryId = freezed,Object? name = null,Object? description = freezed,Object? price = null,Object? stock = null,Object? imageUrl = freezed,Object? unit = null,Object? isActive = null,}) {
  return _then(ProductUpdate(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class ProductDelete implements ProductEvent {
  const ProductDelete({required this.id});
  

 final  int id;

/// Create a copy of ProductEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductDeleteCopyWith<ProductDelete> get copyWith => _$ProductDeleteCopyWithImpl<ProductDelete>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductDelete&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'ProductEvent.delete(id: $id)';
}


}

/// @nodoc
abstract mixin class $ProductDeleteCopyWith<$Res> implements $ProductEventCopyWith<$Res> {
  factory $ProductDeleteCopyWith(ProductDelete value, $Res Function(ProductDelete) _then) = _$ProductDeleteCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class _$ProductDeleteCopyWithImpl<$Res>
    implements $ProductDeleteCopyWith<$Res> {
  _$ProductDeleteCopyWithImpl(this._self, this._then);

  final ProductDelete _self;
  final $Res Function(ProductDelete) _then;

/// Create a copy of ProductEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(ProductDelete(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
