// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OrderItemEntity {

 int get id; int get productId; String get productName; double get productPrice; int get quantity; double get subtotal;
/// Create a copy of OrderItemEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderItemEntityCopyWith<OrderItemEntity> get copyWith => _$OrderItemEntityCopyWithImpl<OrderItemEntity>(this as OrderItemEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderItemEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.productPrice, productPrice) || other.productPrice == productPrice)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal));
}


@override
int get hashCode => Object.hash(runtimeType,id,productId,productName,productPrice,quantity,subtotal);

@override
String toString() {
  return 'OrderItemEntity(id: $id, productId: $productId, productName: $productName, productPrice: $productPrice, quantity: $quantity, subtotal: $subtotal)';
}


}

/// @nodoc
abstract mixin class $OrderItemEntityCopyWith<$Res>  {
  factory $OrderItemEntityCopyWith(OrderItemEntity value, $Res Function(OrderItemEntity) _then) = _$OrderItemEntityCopyWithImpl;
@useResult
$Res call({
 int id, int productId, String productName, double productPrice, int quantity, double subtotal
});




}
/// @nodoc
class _$OrderItemEntityCopyWithImpl<$Res>
    implements $OrderItemEntityCopyWith<$Res> {
  _$OrderItemEntityCopyWithImpl(this._self, this._then);

  final OrderItemEntity _self;
  final $Res Function(OrderItemEntity) _then;

/// Create a copy of OrderItemEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? productId = null,Object? productName = null,Object? productPrice = null,Object? quantity = null,Object? subtotal = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,productPrice: null == productPrice ? _self.productPrice : productPrice // ignore: cast_nullable_to_non_nullable
as double,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderItemEntity].
extension OrderItemEntityPatterns on OrderItemEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderItemEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderItemEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderItemEntity value)  $default,){
final _that = this;
switch (_that) {
case _OrderItemEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderItemEntity value)?  $default,){
final _that = this;
switch (_that) {
case _OrderItemEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int productId,  String productName,  double productPrice,  int quantity,  double subtotal)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderItemEntity() when $default != null:
return $default(_that.id,_that.productId,_that.productName,_that.productPrice,_that.quantity,_that.subtotal);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int productId,  String productName,  double productPrice,  int quantity,  double subtotal)  $default,) {final _that = this;
switch (_that) {
case _OrderItemEntity():
return $default(_that.id,_that.productId,_that.productName,_that.productPrice,_that.quantity,_that.subtotal);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int productId,  String productName,  double productPrice,  int quantity,  double subtotal)?  $default,) {final _that = this;
switch (_that) {
case _OrderItemEntity() when $default != null:
return $default(_that.id,_that.productId,_that.productName,_that.productPrice,_that.quantity,_that.subtotal);case _:
  return null;

}
}

}

/// @nodoc


class _OrderItemEntity implements OrderItemEntity {
  const _OrderItemEntity({required this.id, required this.productId, required this.productName, required this.productPrice, required this.quantity, required this.subtotal});
  

@override final  int id;
@override final  int productId;
@override final  String productName;
@override final  double productPrice;
@override final  int quantity;
@override final  double subtotal;

/// Create a copy of OrderItemEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderItemEntityCopyWith<_OrderItemEntity> get copyWith => __$OrderItemEntityCopyWithImpl<_OrderItemEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderItemEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.productPrice, productPrice) || other.productPrice == productPrice)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal));
}


@override
int get hashCode => Object.hash(runtimeType,id,productId,productName,productPrice,quantity,subtotal);

@override
String toString() {
  return 'OrderItemEntity(id: $id, productId: $productId, productName: $productName, productPrice: $productPrice, quantity: $quantity, subtotal: $subtotal)';
}


}

/// @nodoc
abstract mixin class _$OrderItemEntityCopyWith<$Res> implements $OrderItemEntityCopyWith<$Res> {
  factory _$OrderItemEntityCopyWith(_OrderItemEntity value, $Res Function(_OrderItemEntity) _then) = __$OrderItemEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, int productId, String productName, double productPrice, int quantity, double subtotal
});




}
/// @nodoc
class __$OrderItemEntityCopyWithImpl<$Res>
    implements _$OrderItemEntityCopyWith<$Res> {
  __$OrderItemEntityCopyWithImpl(this._self, this._then);

  final _OrderItemEntity _self;
  final $Res Function(_OrderItemEntity) _then;

/// Create a copy of OrderItemEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? productId = null,Object? productName = null,Object? productPrice = null,Object? quantity = null,Object? subtotal = null,}) {
  return _then(_OrderItemEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,productPrice: null == productPrice ? _self.productPrice : productPrice // ignore: cast_nullable_to_non_nullable
as double,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc
mixin _$OrderEntity {

 int get id; double get totalPrice; String get deliveryMethod; String get paymentMethod; String? get paymentProofUrl; String get status; String? get notes; DateTime get createdAt; String get recipientName; String get recipientPhone; String? get recipientAddress; List<OrderItemEntity> get items;
/// Create a copy of OrderEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderEntityCopyWith<OrderEntity> get copyWith => _$OrderEntityCopyWithImpl<OrderEntity>(this as OrderEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.totalPrice, totalPrice) || other.totalPrice == totalPrice)&&(identical(other.deliveryMethod, deliveryMethod) || other.deliveryMethod == deliveryMethod)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.paymentProofUrl, paymentProofUrl) || other.paymentProofUrl == paymentProofUrl)&&(identical(other.status, status) || other.status == status)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.recipientName, recipientName) || other.recipientName == recipientName)&&(identical(other.recipientPhone, recipientPhone) || other.recipientPhone == recipientPhone)&&(identical(other.recipientAddress, recipientAddress) || other.recipientAddress == recipientAddress)&&const DeepCollectionEquality().equals(other.items, items));
}


@override
int get hashCode => Object.hash(runtimeType,id,totalPrice,deliveryMethod,paymentMethod,paymentProofUrl,status,notes,createdAt,recipientName,recipientPhone,recipientAddress,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'OrderEntity(id: $id, totalPrice: $totalPrice, deliveryMethod: $deliveryMethod, paymentMethod: $paymentMethod, paymentProofUrl: $paymentProofUrl, status: $status, notes: $notes, createdAt: $createdAt, recipientName: $recipientName, recipientPhone: $recipientPhone, recipientAddress: $recipientAddress, items: $items)';
}


}

/// @nodoc
abstract mixin class $OrderEntityCopyWith<$Res>  {
  factory $OrderEntityCopyWith(OrderEntity value, $Res Function(OrderEntity) _then) = _$OrderEntityCopyWithImpl;
@useResult
$Res call({
 int id, double totalPrice, String deliveryMethod, String paymentMethod, String? paymentProofUrl, String status, String? notes, DateTime createdAt, String recipientName, String recipientPhone, String? recipientAddress, List<OrderItemEntity> items
});




}
/// @nodoc
class _$OrderEntityCopyWithImpl<$Res>
    implements $OrderEntityCopyWith<$Res> {
  _$OrderEntityCopyWithImpl(this._self, this._then);

  final OrderEntity _self;
  final $Res Function(OrderEntity) _then;

/// Create a copy of OrderEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? totalPrice = null,Object? deliveryMethod = null,Object? paymentMethod = null,Object? paymentProofUrl = freezed,Object? status = null,Object? notes = freezed,Object? createdAt = null,Object? recipientName = null,Object? recipientPhone = null,Object? recipientAddress = freezed,Object? items = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,totalPrice: null == totalPrice ? _self.totalPrice : totalPrice // ignore: cast_nullable_to_non_nullable
as double,deliveryMethod: null == deliveryMethod ? _self.deliveryMethod : deliveryMethod // ignore: cast_nullable_to_non_nullable
as String,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,paymentProofUrl: freezed == paymentProofUrl ? _self.paymentProofUrl : paymentProofUrl // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,recipientName: null == recipientName ? _self.recipientName : recipientName // ignore: cast_nullable_to_non_nullable
as String,recipientPhone: null == recipientPhone ? _self.recipientPhone : recipientPhone // ignore: cast_nullable_to_non_nullable
as String,recipientAddress: freezed == recipientAddress ? _self.recipientAddress : recipientAddress // ignore: cast_nullable_to_non_nullable
as String?,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<OrderItemEntity>,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderEntity].
extension OrderEntityPatterns on OrderEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderEntity value)  $default,){
final _that = this;
switch (_that) {
case _OrderEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderEntity value)?  $default,){
final _that = this;
switch (_that) {
case _OrderEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  double totalPrice,  String deliveryMethod,  String paymentMethod,  String? paymentProofUrl,  String status,  String? notes,  DateTime createdAt,  String recipientName,  String recipientPhone,  String? recipientAddress,  List<OrderItemEntity> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderEntity() when $default != null:
return $default(_that.id,_that.totalPrice,_that.deliveryMethod,_that.paymentMethod,_that.paymentProofUrl,_that.status,_that.notes,_that.createdAt,_that.recipientName,_that.recipientPhone,_that.recipientAddress,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  double totalPrice,  String deliveryMethod,  String paymentMethod,  String? paymentProofUrl,  String status,  String? notes,  DateTime createdAt,  String recipientName,  String recipientPhone,  String? recipientAddress,  List<OrderItemEntity> items)  $default,) {final _that = this;
switch (_that) {
case _OrderEntity():
return $default(_that.id,_that.totalPrice,_that.deliveryMethod,_that.paymentMethod,_that.paymentProofUrl,_that.status,_that.notes,_that.createdAt,_that.recipientName,_that.recipientPhone,_that.recipientAddress,_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  double totalPrice,  String deliveryMethod,  String paymentMethod,  String? paymentProofUrl,  String status,  String? notes,  DateTime createdAt,  String recipientName,  String recipientPhone,  String? recipientAddress,  List<OrderItemEntity> items)?  $default,) {final _that = this;
switch (_that) {
case _OrderEntity() when $default != null:
return $default(_that.id,_that.totalPrice,_that.deliveryMethod,_that.paymentMethod,_that.paymentProofUrl,_that.status,_that.notes,_that.createdAt,_that.recipientName,_that.recipientPhone,_that.recipientAddress,_that.items);case _:
  return null;

}
}

}

/// @nodoc


class _OrderEntity extends OrderEntity {
  const _OrderEntity({required this.id, required this.totalPrice, required this.deliveryMethod, required this.paymentMethod, this.paymentProofUrl, required this.status, this.notes, required this.createdAt, required this.recipientName, required this.recipientPhone, this.recipientAddress, required final  List<OrderItemEntity> items}): _items = items,super._();
  

@override final  int id;
@override final  double totalPrice;
@override final  String deliveryMethod;
@override final  String paymentMethod;
@override final  String? paymentProofUrl;
@override final  String status;
@override final  String? notes;
@override final  DateTime createdAt;
@override final  String recipientName;
@override final  String recipientPhone;
@override final  String? recipientAddress;
 final  List<OrderItemEntity> _items;
@override List<OrderItemEntity> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of OrderEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderEntityCopyWith<_OrderEntity> get copyWith => __$OrderEntityCopyWithImpl<_OrderEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.totalPrice, totalPrice) || other.totalPrice == totalPrice)&&(identical(other.deliveryMethod, deliveryMethod) || other.deliveryMethod == deliveryMethod)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.paymentProofUrl, paymentProofUrl) || other.paymentProofUrl == paymentProofUrl)&&(identical(other.status, status) || other.status == status)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.recipientName, recipientName) || other.recipientName == recipientName)&&(identical(other.recipientPhone, recipientPhone) || other.recipientPhone == recipientPhone)&&(identical(other.recipientAddress, recipientAddress) || other.recipientAddress == recipientAddress)&&const DeepCollectionEquality().equals(other._items, _items));
}


@override
int get hashCode => Object.hash(runtimeType,id,totalPrice,deliveryMethod,paymentMethod,paymentProofUrl,status,notes,createdAt,recipientName,recipientPhone,recipientAddress,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'OrderEntity(id: $id, totalPrice: $totalPrice, deliveryMethod: $deliveryMethod, paymentMethod: $paymentMethod, paymentProofUrl: $paymentProofUrl, status: $status, notes: $notes, createdAt: $createdAt, recipientName: $recipientName, recipientPhone: $recipientPhone, recipientAddress: $recipientAddress, items: $items)';
}


}

/// @nodoc
abstract mixin class _$OrderEntityCopyWith<$Res> implements $OrderEntityCopyWith<$Res> {
  factory _$OrderEntityCopyWith(_OrderEntity value, $Res Function(_OrderEntity) _then) = __$OrderEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, double totalPrice, String deliveryMethod, String paymentMethod, String? paymentProofUrl, String status, String? notes, DateTime createdAt, String recipientName, String recipientPhone, String? recipientAddress, List<OrderItemEntity> items
});




}
/// @nodoc
class __$OrderEntityCopyWithImpl<$Res>
    implements _$OrderEntityCopyWith<$Res> {
  __$OrderEntityCopyWithImpl(this._self, this._then);

  final _OrderEntity _self;
  final $Res Function(_OrderEntity) _then;

/// Create a copy of OrderEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? totalPrice = null,Object? deliveryMethod = null,Object? paymentMethod = null,Object? paymentProofUrl = freezed,Object? status = null,Object? notes = freezed,Object? createdAt = null,Object? recipientName = null,Object? recipientPhone = null,Object? recipientAddress = freezed,Object? items = null,}) {
  return _then(_OrderEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,totalPrice: null == totalPrice ? _self.totalPrice : totalPrice // ignore: cast_nullable_to_non_nullable
as double,deliveryMethod: null == deliveryMethod ? _self.deliveryMethod : deliveryMethod // ignore: cast_nullable_to_non_nullable
as String,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,paymentProofUrl: freezed == paymentProofUrl ? _self.paymentProofUrl : paymentProofUrl // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,recipientName: null == recipientName ? _self.recipientName : recipientName // ignore: cast_nullable_to_non_nullable
as String,recipientPhone: null == recipientPhone ? _self.recipientPhone : recipientPhone // ignore: cast_nullable_to_non_nullable
as String,recipientAddress: freezed == recipientAddress ? _self.recipientAddress : recipientAddress // ignore: cast_nullable_to_non_nullable
as String?,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<OrderItemEntity>,
  ));
}


}

// dart format on
