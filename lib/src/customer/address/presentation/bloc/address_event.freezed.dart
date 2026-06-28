// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AddressEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddressEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AddressEvent()';
}


}

/// @nodoc
class $AddressEventCopyWith<$Res>  {
$AddressEventCopyWith(AddressEvent _, $Res Function(AddressEvent) __);
}


/// Adds pattern-matching-related methods to [AddressEvent].
extension AddressEventPatterns on AddressEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AddressLoad value)?  load,TResult Function( AddressCreate value)?  create,TResult Function( AddressUpdate value)?  update,TResult Function( AddressDelete value)?  delete,TResult Function( AddressSetDefault value)?  setDefault,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AddressLoad() when load != null:
return load(_that);case AddressCreate() when create != null:
return create(_that);case AddressUpdate() when update != null:
return update(_that);case AddressDelete() when delete != null:
return delete(_that);case AddressSetDefault() when setDefault != null:
return setDefault(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AddressLoad value)  load,required TResult Function( AddressCreate value)  create,required TResult Function( AddressUpdate value)  update,required TResult Function( AddressDelete value)  delete,required TResult Function( AddressSetDefault value)  setDefault,}){
final _that = this;
switch (_that) {
case AddressLoad():
return load(_that);case AddressCreate():
return create(_that);case AddressUpdate():
return update(_that);case AddressDelete():
return delete(_that);case AddressSetDefault():
return setDefault(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AddressLoad value)?  load,TResult? Function( AddressCreate value)?  create,TResult? Function( AddressUpdate value)?  update,TResult? Function( AddressDelete value)?  delete,TResult? Function( AddressSetDefault value)?  setDefault,}){
final _that = this;
switch (_that) {
case AddressLoad() when load != null:
return load(_that);case AddressCreate() when create != null:
return create(_that);case AddressUpdate() when update != null:
return update(_that);case AddressDelete() when delete != null:
return delete(_that);case AddressSetDefault() when setDefault != null:
return setDefault(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  load,TResult Function( String recipientName,  String phone,  String address,  bool isDefault)?  create,TResult Function( int id,  String recipientName,  String phone,  String address)?  update,TResult Function( int id)?  delete,TResult Function( int id)?  setDefault,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AddressLoad() when load != null:
return load();case AddressCreate() when create != null:
return create(_that.recipientName,_that.phone,_that.address,_that.isDefault);case AddressUpdate() when update != null:
return update(_that.id,_that.recipientName,_that.phone,_that.address);case AddressDelete() when delete != null:
return delete(_that.id);case AddressSetDefault() when setDefault != null:
return setDefault(_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  load,required TResult Function( String recipientName,  String phone,  String address,  bool isDefault)  create,required TResult Function( int id,  String recipientName,  String phone,  String address)  update,required TResult Function( int id)  delete,required TResult Function( int id)  setDefault,}) {final _that = this;
switch (_that) {
case AddressLoad():
return load();case AddressCreate():
return create(_that.recipientName,_that.phone,_that.address,_that.isDefault);case AddressUpdate():
return update(_that.id,_that.recipientName,_that.phone,_that.address);case AddressDelete():
return delete(_that.id);case AddressSetDefault():
return setDefault(_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  load,TResult? Function( String recipientName,  String phone,  String address,  bool isDefault)?  create,TResult? Function( int id,  String recipientName,  String phone,  String address)?  update,TResult? Function( int id)?  delete,TResult? Function( int id)?  setDefault,}) {final _that = this;
switch (_that) {
case AddressLoad() when load != null:
return load();case AddressCreate() when create != null:
return create(_that.recipientName,_that.phone,_that.address,_that.isDefault);case AddressUpdate() when update != null:
return update(_that.id,_that.recipientName,_that.phone,_that.address);case AddressDelete() when delete != null:
return delete(_that.id);case AddressSetDefault() when setDefault != null:
return setDefault(_that.id);case _:
  return null;

}
}

}

/// @nodoc


class AddressLoad implements AddressEvent {
  const AddressLoad();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddressLoad);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AddressEvent.load()';
}


}




/// @nodoc


class AddressCreate implements AddressEvent {
  const AddressCreate({required this.recipientName, required this.phone, required this.address, this.isDefault = false});
  

 final  String recipientName;
 final  String phone;
 final  String address;
@JsonKey() final  bool isDefault;

/// Create a copy of AddressEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddressCreateCopyWith<AddressCreate> get copyWith => _$AddressCreateCopyWithImpl<AddressCreate>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddressCreate&&(identical(other.recipientName, recipientName) || other.recipientName == recipientName)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&(identical(other.isDefault, isDefault) || other.isDefault == isDefault));
}


@override
int get hashCode => Object.hash(runtimeType,recipientName,phone,address,isDefault);

@override
String toString() {
  return 'AddressEvent.create(recipientName: $recipientName, phone: $phone, address: $address, isDefault: $isDefault)';
}


}

/// @nodoc
abstract mixin class $AddressCreateCopyWith<$Res> implements $AddressEventCopyWith<$Res> {
  factory $AddressCreateCopyWith(AddressCreate value, $Res Function(AddressCreate) _then) = _$AddressCreateCopyWithImpl;
@useResult
$Res call({
 String recipientName, String phone, String address, bool isDefault
});




}
/// @nodoc
class _$AddressCreateCopyWithImpl<$Res>
    implements $AddressCreateCopyWith<$Res> {
  _$AddressCreateCopyWithImpl(this._self, this._then);

  final AddressCreate _self;
  final $Res Function(AddressCreate) _then;

/// Create a copy of AddressEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? recipientName = null,Object? phone = null,Object? address = null,Object? isDefault = null,}) {
  return _then(AddressCreate(
recipientName: null == recipientName ? _self.recipientName : recipientName // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,isDefault: null == isDefault ? _self.isDefault : isDefault // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class AddressUpdate implements AddressEvent {
  const AddressUpdate({required this.id, required this.recipientName, required this.phone, required this.address});
  

 final  int id;
 final  String recipientName;
 final  String phone;
 final  String address;

/// Create a copy of AddressEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddressUpdateCopyWith<AddressUpdate> get copyWith => _$AddressUpdateCopyWithImpl<AddressUpdate>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddressUpdate&&(identical(other.id, id) || other.id == id)&&(identical(other.recipientName, recipientName) || other.recipientName == recipientName)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address));
}


@override
int get hashCode => Object.hash(runtimeType,id,recipientName,phone,address);

@override
String toString() {
  return 'AddressEvent.update(id: $id, recipientName: $recipientName, phone: $phone, address: $address)';
}


}

/// @nodoc
abstract mixin class $AddressUpdateCopyWith<$Res> implements $AddressEventCopyWith<$Res> {
  factory $AddressUpdateCopyWith(AddressUpdate value, $Res Function(AddressUpdate) _then) = _$AddressUpdateCopyWithImpl;
@useResult
$Res call({
 int id, String recipientName, String phone, String address
});




}
/// @nodoc
class _$AddressUpdateCopyWithImpl<$Res>
    implements $AddressUpdateCopyWith<$Res> {
  _$AddressUpdateCopyWithImpl(this._self, this._then);

  final AddressUpdate _self;
  final $Res Function(AddressUpdate) _then;

/// Create a copy of AddressEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,Object? recipientName = null,Object? phone = null,Object? address = null,}) {
  return _then(AddressUpdate(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,recipientName: null == recipientName ? _self.recipientName : recipientName // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AddressDelete implements AddressEvent {
  const AddressDelete({required this.id});
  

 final  int id;

/// Create a copy of AddressEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddressDeleteCopyWith<AddressDelete> get copyWith => _$AddressDeleteCopyWithImpl<AddressDelete>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddressDelete&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'AddressEvent.delete(id: $id)';
}


}

/// @nodoc
abstract mixin class $AddressDeleteCopyWith<$Res> implements $AddressEventCopyWith<$Res> {
  factory $AddressDeleteCopyWith(AddressDelete value, $Res Function(AddressDelete) _then) = _$AddressDeleteCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class _$AddressDeleteCopyWithImpl<$Res>
    implements $AddressDeleteCopyWith<$Res> {
  _$AddressDeleteCopyWithImpl(this._self, this._then);

  final AddressDelete _self;
  final $Res Function(AddressDelete) _then;

/// Create a copy of AddressEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(AddressDelete(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class AddressSetDefault implements AddressEvent {
  const AddressSetDefault({required this.id});
  

 final  int id;

/// Create a copy of AddressEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddressSetDefaultCopyWith<AddressSetDefault> get copyWith => _$AddressSetDefaultCopyWithImpl<AddressSetDefault>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddressSetDefault&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'AddressEvent.setDefault(id: $id)';
}


}

/// @nodoc
abstract mixin class $AddressSetDefaultCopyWith<$Res> implements $AddressEventCopyWith<$Res> {
  factory $AddressSetDefaultCopyWith(AddressSetDefault value, $Res Function(AddressSetDefault) _then) = _$AddressSetDefaultCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class _$AddressSetDefaultCopyWithImpl<$Res>
    implements $AddressSetDefaultCopyWith<$Res> {
  _$AddressSetDefaultCopyWithImpl(this._self, this._then);

  final AddressSetDefault _self;
  final $Res Function(AddressSetDefault) _then;

/// Create a copy of AddressEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(AddressSetDefault(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
