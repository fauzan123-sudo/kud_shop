// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderItemModel {

 int get id;@JsonKey(name: 'product_id') int get productId;@JsonKey(name: 'product_name') String get productName;@JsonKey(name: 'product_price') double get productPrice; int get quantity; double get subtotal;
/// Create a copy of OrderItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderItemModelCopyWith<OrderItemModel> get copyWith => _$OrderItemModelCopyWithImpl<OrderItemModel>(this as OrderItemModel, _$identity);

  /// Serializes this OrderItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.productPrice, productPrice) || other.productPrice == productPrice)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,productId,productName,productPrice,quantity,subtotal);

@override
String toString() {
  return 'OrderItemModel(id: $id, productId: $productId, productName: $productName, productPrice: $productPrice, quantity: $quantity, subtotal: $subtotal)';
}


}

/// @nodoc
abstract mixin class $OrderItemModelCopyWith<$Res>  {
  factory $OrderItemModelCopyWith(OrderItemModel value, $Res Function(OrderItemModel) _then) = _$OrderItemModelCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'product_id') int productId,@JsonKey(name: 'product_name') String productName,@JsonKey(name: 'product_price') double productPrice, int quantity, double subtotal
});




}
/// @nodoc
class _$OrderItemModelCopyWithImpl<$Res>
    implements $OrderItemModelCopyWith<$Res> {
  _$OrderItemModelCopyWithImpl(this._self, this._then);

  final OrderItemModel _self;
  final $Res Function(OrderItemModel) _then;

/// Create a copy of OrderItemModel
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


/// Adds pattern-matching-related methods to [OrderItemModel].
extension OrderItemModelPatterns on OrderItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderItemModel value)  $default,){
final _that = this;
switch (_that) {
case _OrderItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _OrderItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'product_id')  int productId, @JsonKey(name: 'product_name')  String productName, @JsonKey(name: 'product_price')  double productPrice,  int quantity,  double subtotal)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderItemModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'product_id')  int productId, @JsonKey(name: 'product_name')  String productName, @JsonKey(name: 'product_price')  double productPrice,  int quantity,  double subtotal)  $default,) {final _that = this;
switch (_that) {
case _OrderItemModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'product_id')  int productId, @JsonKey(name: 'product_name')  String productName, @JsonKey(name: 'product_price')  double productPrice,  int quantity,  double subtotal)?  $default,) {final _that = this;
switch (_that) {
case _OrderItemModel() when $default != null:
return $default(_that.id,_that.productId,_that.productName,_that.productPrice,_that.quantity,_that.subtotal);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderItemModel implements OrderItemModel {
  const _OrderItemModel({required this.id, @JsonKey(name: 'product_id') required this.productId, @JsonKey(name: 'product_name') required this.productName, @JsonKey(name: 'product_price') required this.productPrice, required this.quantity, required this.subtotal});
  factory _OrderItemModel.fromJson(Map<String, dynamic> json) => _$OrderItemModelFromJson(json);

@override final  int id;
@override@JsonKey(name: 'product_id') final  int productId;
@override@JsonKey(name: 'product_name') final  String productName;
@override@JsonKey(name: 'product_price') final  double productPrice;
@override final  int quantity;
@override final  double subtotal;

/// Create a copy of OrderItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderItemModelCopyWith<_OrderItemModel> get copyWith => __$OrderItemModelCopyWithImpl<_OrderItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.productPrice, productPrice) || other.productPrice == productPrice)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,productId,productName,productPrice,quantity,subtotal);

@override
String toString() {
  return 'OrderItemModel(id: $id, productId: $productId, productName: $productName, productPrice: $productPrice, quantity: $quantity, subtotal: $subtotal)';
}


}

/// @nodoc
abstract mixin class _$OrderItemModelCopyWith<$Res> implements $OrderItemModelCopyWith<$Res> {
  factory _$OrderItemModelCopyWith(_OrderItemModel value, $Res Function(_OrderItemModel) _then) = __$OrderItemModelCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'product_id') int productId,@JsonKey(name: 'product_name') String productName,@JsonKey(name: 'product_price') double productPrice, int quantity, double subtotal
});




}
/// @nodoc
class __$OrderItemModelCopyWithImpl<$Res>
    implements _$OrderItemModelCopyWith<$Res> {
  __$OrderItemModelCopyWithImpl(this._self, this._then);

  final _OrderItemModel _self;
  final $Res Function(_OrderItemModel) _then;

/// Create a copy of OrderItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? productId = null,Object? productName = null,Object? productPrice = null,Object? quantity = null,Object? subtotal = null,}) {
  return _then(_OrderItemModel(
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
mixin _$OrderAddressModel {

@JsonKey(name: 'recipient_name') String get recipientName; String get phone; String? get address;
/// Create a copy of OrderAddressModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderAddressModelCopyWith<OrderAddressModel> get copyWith => _$OrderAddressModelCopyWithImpl<OrderAddressModel>(this as OrderAddressModel, _$identity);

  /// Serializes this OrderAddressModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderAddressModel&&(identical(other.recipientName, recipientName) || other.recipientName == recipientName)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,recipientName,phone,address);

@override
String toString() {
  return 'OrderAddressModel(recipientName: $recipientName, phone: $phone, address: $address)';
}


}

/// @nodoc
abstract mixin class $OrderAddressModelCopyWith<$Res>  {
  factory $OrderAddressModelCopyWith(OrderAddressModel value, $Res Function(OrderAddressModel) _then) = _$OrderAddressModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'recipient_name') String recipientName, String phone, String? address
});




}
/// @nodoc
class _$OrderAddressModelCopyWithImpl<$Res>
    implements $OrderAddressModelCopyWith<$Res> {
  _$OrderAddressModelCopyWithImpl(this._self, this._then);

  final OrderAddressModel _self;
  final $Res Function(OrderAddressModel) _then;

/// Create a copy of OrderAddressModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? recipientName = null,Object? phone = null,Object? address = freezed,}) {
  return _then(_self.copyWith(
recipientName: null == recipientName ? _self.recipientName : recipientName // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderAddressModel].
extension OrderAddressModelPatterns on OrderAddressModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderAddressModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderAddressModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderAddressModel value)  $default,){
final _that = this;
switch (_that) {
case _OrderAddressModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderAddressModel value)?  $default,){
final _that = this;
switch (_that) {
case _OrderAddressModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'recipient_name')  String recipientName,  String phone,  String? address)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderAddressModel() when $default != null:
return $default(_that.recipientName,_that.phone,_that.address);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'recipient_name')  String recipientName,  String phone,  String? address)  $default,) {final _that = this;
switch (_that) {
case _OrderAddressModel():
return $default(_that.recipientName,_that.phone,_that.address);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'recipient_name')  String recipientName,  String phone,  String? address)?  $default,) {final _that = this;
switch (_that) {
case _OrderAddressModel() when $default != null:
return $default(_that.recipientName,_that.phone,_that.address);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderAddressModel implements OrderAddressModel {
  const _OrderAddressModel({@JsonKey(name: 'recipient_name') required this.recipientName, required this.phone, this.address});
  factory _OrderAddressModel.fromJson(Map<String, dynamic> json) => _$OrderAddressModelFromJson(json);

@override@JsonKey(name: 'recipient_name') final  String recipientName;
@override final  String phone;
@override final  String? address;

/// Create a copy of OrderAddressModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderAddressModelCopyWith<_OrderAddressModel> get copyWith => __$OrderAddressModelCopyWithImpl<_OrderAddressModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderAddressModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderAddressModel&&(identical(other.recipientName, recipientName) || other.recipientName == recipientName)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,recipientName,phone,address);

@override
String toString() {
  return 'OrderAddressModel(recipientName: $recipientName, phone: $phone, address: $address)';
}


}

/// @nodoc
abstract mixin class _$OrderAddressModelCopyWith<$Res> implements $OrderAddressModelCopyWith<$Res> {
  factory _$OrderAddressModelCopyWith(_OrderAddressModel value, $Res Function(_OrderAddressModel) _then) = __$OrderAddressModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'recipient_name') String recipientName, String phone, String? address
});




}
/// @nodoc
class __$OrderAddressModelCopyWithImpl<$Res>
    implements _$OrderAddressModelCopyWith<$Res> {
  __$OrderAddressModelCopyWithImpl(this._self, this._then);

  final _OrderAddressModel _self;
  final $Res Function(_OrderAddressModel) _then;

/// Create a copy of OrderAddressModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? recipientName = null,Object? phone = null,Object? address = freezed,}) {
  return _then(_OrderAddressModel(
recipientName: null == recipientName ? _self.recipientName : recipientName // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$OrderModel {

 int get id;@JsonKey(name: 'total_price') double get totalPrice;@JsonKey(name: 'delivery_method') String get deliveryMethod;@JsonKey(name: 'payment_method') String get paymentMethod;@JsonKey(name: 'payment_proof_url') String? get paymentProofUrl; String get status; String? get notes;@JsonKey(name: 'created_at') DateTime get createdAt; OrderAddressModel? get addresses;@JsonKey(name: 'order_items') List<OrderItemModel> get orderItems;
/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderModelCopyWith<OrderModel> get copyWith => _$OrderModelCopyWithImpl<OrderModel>(this as OrderModel, _$identity);

  /// Serializes this OrderModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderModel&&(identical(other.id, id) || other.id == id)&&(identical(other.totalPrice, totalPrice) || other.totalPrice == totalPrice)&&(identical(other.deliveryMethod, deliveryMethod) || other.deliveryMethod == deliveryMethod)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.paymentProofUrl, paymentProofUrl) || other.paymentProofUrl == paymentProofUrl)&&(identical(other.status, status) || other.status == status)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.addresses, addresses) || other.addresses == addresses)&&const DeepCollectionEquality().equals(other.orderItems, orderItems));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,totalPrice,deliveryMethod,paymentMethod,paymentProofUrl,status,notes,createdAt,addresses,const DeepCollectionEquality().hash(orderItems));

@override
String toString() {
  return 'OrderModel(id: $id, totalPrice: $totalPrice, deliveryMethod: $deliveryMethod, paymentMethod: $paymentMethod, paymentProofUrl: $paymentProofUrl, status: $status, notes: $notes, createdAt: $createdAt, addresses: $addresses, orderItems: $orderItems)';
}


}

/// @nodoc
abstract mixin class $OrderModelCopyWith<$Res>  {
  factory $OrderModelCopyWith(OrderModel value, $Res Function(OrderModel) _then) = _$OrderModelCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'total_price') double totalPrice,@JsonKey(name: 'delivery_method') String deliveryMethod,@JsonKey(name: 'payment_method') String paymentMethod,@JsonKey(name: 'payment_proof_url') String? paymentProofUrl, String status, String? notes,@JsonKey(name: 'created_at') DateTime createdAt, OrderAddressModel? addresses,@JsonKey(name: 'order_items') List<OrderItemModel> orderItems
});


$OrderAddressModelCopyWith<$Res>? get addresses;

}
/// @nodoc
class _$OrderModelCopyWithImpl<$Res>
    implements $OrderModelCopyWith<$Res> {
  _$OrderModelCopyWithImpl(this._self, this._then);

  final OrderModel _self;
  final $Res Function(OrderModel) _then;

/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? totalPrice = null,Object? deliveryMethod = null,Object? paymentMethod = null,Object? paymentProofUrl = freezed,Object? status = null,Object? notes = freezed,Object? createdAt = null,Object? addresses = freezed,Object? orderItems = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,totalPrice: null == totalPrice ? _self.totalPrice : totalPrice // ignore: cast_nullable_to_non_nullable
as double,deliveryMethod: null == deliveryMethod ? _self.deliveryMethod : deliveryMethod // ignore: cast_nullable_to_non_nullable
as String,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,paymentProofUrl: freezed == paymentProofUrl ? _self.paymentProofUrl : paymentProofUrl // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,addresses: freezed == addresses ? _self.addresses : addresses // ignore: cast_nullable_to_non_nullable
as OrderAddressModel?,orderItems: null == orderItems ? _self.orderItems : orderItems // ignore: cast_nullable_to_non_nullable
as List<OrderItemModel>,
  ));
}
/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderAddressModelCopyWith<$Res>? get addresses {
    if (_self.addresses == null) {
    return null;
  }

  return $OrderAddressModelCopyWith<$Res>(_self.addresses!, (value) {
    return _then(_self.copyWith(addresses: value));
  });
}
}


/// Adds pattern-matching-related methods to [OrderModel].
extension OrderModelPatterns on OrderModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderModel value)  $default,){
final _that = this;
switch (_that) {
case _OrderModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderModel value)?  $default,){
final _that = this;
switch (_that) {
case _OrderModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'total_price')  double totalPrice, @JsonKey(name: 'delivery_method')  String deliveryMethod, @JsonKey(name: 'payment_method')  String paymentMethod, @JsonKey(name: 'payment_proof_url')  String? paymentProofUrl,  String status,  String? notes, @JsonKey(name: 'created_at')  DateTime createdAt,  OrderAddressModel? addresses, @JsonKey(name: 'order_items')  List<OrderItemModel> orderItems)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderModel() when $default != null:
return $default(_that.id,_that.totalPrice,_that.deliveryMethod,_that.paymentMethod,_that.paymentProofUrl,_that.status,_that.notes,_that.createdAt,_that.addresses,_that.orderItems);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'total_price')  double totalPrice, @JsonKey(name: 'delivery_method')  String deliveryMethod, @JsonKey(name: 'payment_method')  String paymentMethod, @JsonKey(name: 'payment_proof_url')  String? paymentProofUrl,  String status,  String? notes, @JsonKey(name: 'created_at')  DateTime createdAt,  OrderAddressModel? addresses, @JsonKey(name: 'order_items')  List<OrderItemModel> orderItems)  $default,) {final _that = this;
switch (_that) {
case _OrderModel():
return $default(_that.id,_that.totalPrice,_that.deliveryMethod,_that.paymentMethod,_that.paymentProofUrl,_that.status,_that.notes,_that.createdAt,_that.addresses,_that.orderItems);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'total_price')  double totalPrice, @JsonKey(name: 'delivery_method')  String deliveryMethod, @JsonKey(name: 'payment_method')  String paymentMethod, @JsonKey(name: 'payment_proof_url')  String? paymentProofUrl,  String status,  String? notes, @JsonKey(name: 'created_at')  DateTime createdAt,  OrderAddressModel? addresses, @JsonKey(name: 'order_items')  List<OrderItemModel> orderItems)?  $default,) {final _that = this;
switch (_that) {
case _OrderModel() when $default != null:
return $default(_that.id,_that.totalPrice,_that.deliveryMethod,_that.paymentMethod,_that.paymentProofUrl,_that.status,_that.notes,_that.createdAt,_that.addresses,_that.orderItems);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderModel implements OrderModel {
  const _OrderModel({required this.id, @JsonKey(name: 'total_price') required this.totalPrice, @JsonKey(name: 'delivery_method') required this.deliveryMethod, @JsonKey(name: 'payment_method') required this.paymentMethod, @JsonKey(name: 'payment_proof_url') this.paymentProofUrl, required this.status, this.notes, @JsonKey(name: 'created_at') required this.createdAt, required this.addresses, @JsonKey(name: 'order_items') required final  List<OrderItemModel> orderItems}): _orderItems = orderItems;
  factory _OrderModel.fromJson(Map<String, dynamic> json) => _$OrderModelFromJson(json);

@override final  int id;
@override@JsonKey(name: 'total_price') final  double totalPrice;
@override@JsonKey(name: 'delivery_method') final  String deliveryMethod;
@override@JsonKey(name: 'payment_method') final  String paymentMethod;
@override@JsonKey(name: 'payment_proof_url') final  String? paymentProofUrl;
@override final  String status;
@override final  String? notes;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override final  OrderAddressModel? addresses;
 final  List<OrderItemModel> _orderItems;
@override@JsonKey(name: 'order_items') List<OrderItemModel> get orderItems {
  if (_orderItems is EqualUnmodifiableListView) return _orderItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_orderItems);
}


/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderModelCopyWith<_OrderModel> get copyWith => __$OrderModelCopyWithImpl<_OrderModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderModel&&(identical(other.id, id) || other.id == id)&&(identical(other.totalPrice, totalPrice) || other.totalPrice == totalPrice)&&(identical(other.deliveryMethod, deliveryMethod) || other.deliveryMethod == deliveryMethod)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.paymentProofUrl, paymentProofUrl) || other.paymentProofUrl == paymentProofUrl)&&(identical(other.status, status) || other.status == status)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.addresses, addresses) || other.addresses == addresses)&&const DeepCollectionEquality().equals(other._orderItems, _orderItems));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,totalPrice,deliveryMethod,paymentMethod,paymentProofUrl,status,notes,createdAt,addresses,const DeepCollectionEquality().hash(_orderItems));

@override
String toString() {
  return 'OrderModel(id: $id, totalPrice: $totalPrice, deliveryMethod: $deliveryMethod, paymentMethod: $paymentMethod, paymentProofUrl: $paymentProofUrl, status: $status, notes: $notes, createdAt: $createdAt, addresses: $addresses, orderItems: $orderItems)';
}


}

/// @nodoc
abstract mixin class _$OrderModelCopyWith<$Res> implements $OrderModelCopyWith<$Res> {
  factory _$OrderModelCopyWith(_OrderModel value, $Res Function(_OrderModel) _then) = __$OrderModelCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'total_price') double totalPrice,@JsonKey(name: 'delivery_method') String deliveryMethod,@JsonKey(name: 'payment_method') String paymentMethod,@JsonKey(name: 'payment_proof_url') String? paymentProofUrl, String status, String? notes,@JsonKey(name: 'created_at') DateTime createdAt, OrderAddressModel? addresses,@JsonKey(name: 'order_items') List<OrderItemModel> orderItems
});


@override $OrderAddressModelCopyWith<$Res>? get addresses;

}
/// @nodoc
class __$OrderModelCopyWithImpl<$Res>
    implements _$OrderModelCopyWith<$Res> {
  __$OrderModelCopyWithImpl(this._self, this._then);

  final _OrderModel _self;
  final $Res Function(_OrderModel) _then;

/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? totalPrice = null,Object? deliveryMethod = null,Object? paymentMethod = null,Object? paymentProofUrl = freezed,Object? status = null,Object? notes = freezed,Object? createdAt = null,Object? addresses = freezed,Object? orderItems = null,}) {
  return _then(_OrderModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,totalPrice: null == totalPrice ? _self.totalPrice : totalPrice // ignore: cast_nullable_to_non_nullable
as double,deliveryMethod: null == deliveryMethod ? _self.deliveryMethod : deliveryMethod // ignore: cast_nullable_to_non_nullable
as String,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,paymentProofUrl: freezed == paymentProofUrl ? _self.paymentProofUrl : paymentProofUrl // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,addresses: freezed == addresses ? _self.addresses : addresses // ignore: cast_nullable_to_non_nullable
as OrderAddressModel?,orderItems: null == orderItems ? _self._orderItems : orderItems // ignore: cast_nullable_to_non_nullable
as List<OrderItemModel>,
  ));
}

/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderAddressModelCopyWith<$Res>? get addresses {
    if (_self.addresses == null) {
    return null;
  }

  return $OrderAddressModelCopyWith<$Res>(_self.addresses!, (value) {
    return _then(_self.copyWith(addresses: value));
  });
}
}

// dart format on
