// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CategoryEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CategoryEvent()';
}


}

/// @nodoc
class $CategoryEventCopyWith<$Res>  {
$CategoryEventCopyWith(CategoryEvent _, $Res Function(CategoryEvent) __);
}


/// Adds pattern-matching-related methods to [CategoryEvent].
extension CategoryEventPatterns on CategoryEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CategoryLoad value)?  load,TResult Function( CategoryCreate value)?  create,TResult Function( CategoryUpdate value)?  update,TResult Function( CategoryDelete value)?  delete,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CategoryLoad() when load != null:
return load(_that);case CategoryCreate() when create != null:
return create(_that);case CategoryUpdate() when update != null:
return update(_that);case CategoryDelete() when delete != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CategoryLoad value)  load,required TResult Function( CategoryCreate value)  create,required TResult Function( CategoryUpdate value)  update,required TResult Function( CategoryDelete value)  delete,}){
final _that = this;
switch (_that) {
case CategoryLoad():
return load(_that);case CategoryCreate():
return create(_that);case CategoryUpdate():
return update(_that);case CategoryDelete():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CategoryLoad value)?  load,TResult? Function( CategoryCreate value)?  create,TResult? Function( CategoryUpdate value)?  update,TResult? Function( CategoryDelete value)?  delete,}){
final _that = this;
switch (_that) {
case CategoryLoad() when load != null:
return load(_that);case CategoryCreate() when create != null:
return create(_that);case CategoryUpdate() when update != null:
return update(_that);case CategoryDelete() when delete != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  load,TResult Function( String name)?  create,TResult Function( int id,  String name)?  update,TResult Function( int id)?  delete,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CategoryLoad() when load != null:
return load();case CategoryCreate() when create != null:
return create(_that.name);case CategoryUpdate() when update != null:
return update(_that.id,_that.name);case CategoryDelete() when delete != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  load,required TResult Function( String name)  create,required TResult Function( int id,  String name)  update,required TResult Function( int id)  delete,}) {final _that = this;
switch (_that) {
case CategoryLoad():
return load();case CategoryCreate():
return create(_that.name);case CategoryUpdate():
return update(_that.id,_that.name);case CategoryDelete():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  load,TResult? Function( String name)?  create,TResult? Function( int id,  String name)?  update,TResult? Function( int id)?  delete,}) {final _that = this;
switch (_that) {
case CategoryLoad() when load != null:
return load();case CategoryCreate() when create != null:
return create(_that.name);case CategoryUpdate() when update != null:
return update(_that.id,_that.name);case CategoryDelete() when delete != null:
return delete(_that.id);case _:
  return null;

}
}

}

/// @nodoc


class CategoryLoad implements CategoryEvent {
  const CategoryLoad();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryLoad);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CategoryEvent.load()';
}


}




/// @nodoc


class CategoryCreate implements CategoryEvent {
  const CategoryCreate({required this.name});
  

 final  String name;

/// Create a copy of CategoryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryCreateCopyWith<CategoryCreate> get copyWith => _$CategoryCreateCopyWithImpl<CategoryCreate>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryCreate&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'CategoryEvent.create(name: $name)';
}


}

/// @nodoc
abstract mixin class $CategoryCreateCopyWith<$Res> implements $CategoryEventCopyWith<$Res> {
  factory $CategoryCreateCopyWith(CategoryCreate value, $Res Function(CategoryCreate) _then) = _$CategoryCreateCopyWithImpl;
@useResult
$Res call({
 String name
});




}
/// @nodoc
class _$CategoryCreateCopyWithImpl<$Res>
    implements $CategoryCreateCopyWith<$Res> {
  _$CategoryCreateCopyWithImpl(this._self, this._then);

  final CategoryCreate _self;
  final $Res Function(CategoryCreate) _then;

/// Create a copy of CategoryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? name = null,}) {
  return _then(CategoryCreate(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class CategoryUpdate implements CategoryEvent {
  const CategoryUpdate({required this.id, required this.name});
  

 final  int id;
 final  String name;

/// Create a copy of CategoryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryUpdateCopyWith<CategoryUpdate> get copyWith => _$CategoryUpdateCopyWithImpl<CategoryUpdate>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryUpdate&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'CategoryEvent.update(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $CategoryUpdateCopyWith<$Res> implements $CategoryEventCopyWith<$Res> {
  factory $CategoryUpdateCopyWith(CategoryUpdate value, $Res Function(CategoryUpdate) _then) = _$CategoryUpdateCopyWithImpl;
@useResult
$Res call({
 int id, String name
});




}
/// @nodoc
class _$CategoryUpdateCopyWithImpl<$Res>
    implements $CategoryUpdateCopyWith<$Res> {
  _$CategoryUpdateCopyWithImpl(this._self, this._then);

  final CategoryUpdate _self;
  final $Res Function(CategoryUpdate) _then;

/// Create a copy of CategoryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,}) {
  return _then(CategoryUpdate(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class CategoryDelete implements CategoryEvent {
  const CategoryDelete({required this.id});
  

 final  int id;

/// Create a copy of CategoryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryDeleteCopyWith<CategoryDelete> get copyWith => _$CategoryDeleteCopyWithImpl<CategoryDelete>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryDelete&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'CategoryEvent.delete(id: $id)';
}


}

/// @nodoc
abstract mixin class $CategoryDeleteCopyWith<$Res> implements $CategoryEventCopyWith<$Res> {
  factory $CategoryDeleteCopyWith(CategoryDelete value, $Res Function(CategoryDelete) _then) = _$CategoryDeleteCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class _$CategoryDeleteCopyWithImpl<$Res>
    implements $CategoryDeleteCopyWith<$Res> {
  _$CategoryDeleteCopyWithImpl(this._self, this._then);

  final CategoryDelete _self;
  final $Res Function(CategoryDelete) _then;

/// Create a copy of CategoryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(CategoryDelete(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
