// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent()';
}


}

/// @nodoc
class $AuthEventCopyWith<$Res>  {
$AuthEventCopyWith(AuthEvent _, $Res Function(AuthEvent) __);
}


/// Adds pattern-matching-related methods to [AuthEvent].
extension AuthEventPatterns on AuthEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AuthStarted value)?  started,TResult Function( AuthLoginRequested value)?  login,TResult Function( AuthRegisterRequested value)?  register,TResult Function( AuthLogoutRequested value)?  logout,TResult Function( AuthGetCurrentUser value)?  getCurrentUser,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AuthStarted() when started != null:
return started(_that);case AuthLoginRequested() when login != null:
return login(_that);case AuthRegisterRequested() when register != null:
return register(_that);case AuthLogoutRequested() when logout != null:
return logout(_that);case AuthGetCurrentUser() when getCurrentUser != null:
return getCurrentUser(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AuthStarted value)  started,required TResult Function( AuthLoginRequested value)  login,required TResult Function( AuthRegisterRequested value)  register,required TResult Function( AuthLogoutRequested value)  logout,required TResult Function( AuthGetCurrentUser value)  getCurrentUser,}){
final _that = this;
switch (_that) {
case AuthStarted():
return started(_that);case AuthLoginRequested():
return login(_that);case AuthRegisterRequested():
return register(_that);case AuthLogoutRequested():
return logout(_that);case AuthGetCurrentUser():
return getCurrentUser(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AuthStarted value)?  started,TResult? Function( AuthLoginRequested value)?  login,TResult? Function( AuthRegisterRequested value)?  register,TResult? Function( AuthLogoutRequested value)?  logout,TResult? Function( AuthGetCurrentUser value)?  getCurrentUser,}){
final _that = this;
switch (_that) {
case AuthStarted() when started != null:
return started(_that);case AuthLoginRequested() when login != null:
return login(_that);case AuthRegisterRequested() when register != null:
return register(_that);case AuthLogoutRequested() when logout != null:
return logout(_that);case AuthGetCurrentUser() when getCurrentUser != null:
return getCurrentUser(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( String email,  String password)?  login,TResult Function( String name,  String email,  String password)?  register,TResult Function()?  logout,TResult Function()?  getCurrentUser,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AuthStarted() when started != null:
return started();case AuthLoginRequested() when login != null:
return login(_that.email,_that.password);case AuthRegisterRequested() when register != null:
return register(_that.name,_that.email,_that.password);case AuthLogoutRequested() when logout != null:
return logout();case AuthGetCurrentUser() when getCurrentUser != null:
return getCurrentUser();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( String email,  String password)  login,required TResult Function( String name,  String email,  String password)  register,required TResult Function()  logout,required TResult Function()  getCurrentUser,}) {final _that = this;
switch (_that) {
case AuthStarted():
return started();case AuthLoginRequested():
return login(_that.email,_that.password);case AuthRegisterRequested():
return register(_that.name,_that.email,_that.password);case AuthLogoutRequested():
return logout();case AuthGetCurrentUser():
return getCurrentUser();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( String email,  String password)?  login,TResult? Function( String name,  String email,  String password)?  register,TResult? Function()?  logout,TResult? Function()?  getCurrentUser,}) {final _that = this;
switch (_that) {
case AuthStarted() when started != null:
return started();case AuthLoginRequested() when login != null:
return login(_that.email,_that.password);case AuthRegisterRequested() when register != null:
return register(_that.name,_that.email,_that.password);case AuthLogoutRequested() when logout != null:
return logout();case AuthGetCurrentUser() when getCurrentUser != null:
return getCurrentUser();case _:
  return null;

}
}

}

/// @nodoc


class AuthStarted implements AuthEvent {
  const AuthStarted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthStarted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.started()';
}


}




/// @nodoc


class AuthLoginRequested implements AuthEvent {
  const AuthLoginRequested({required this.email, required this.password});
  

 final  String email;
 final  String password;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthLoginRequestedCopyWith<AuthLoginRequested> get copyWith => _$AuthLoginRequestedCopyWithImpl<AuthLoginRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthLoginRequested&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,email,password);

@override
String toString() {
  return 'AuthEvent.login(email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class $AuthLoginRequestedCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory $AuthLoginRequestedCopyWith(AuthLoginRequested value, $Res Function(AuthLoginRequested) _then) = _$AuthLoginRequestedCopyWithImpl;
@useResult
$Res call({
 String email, String password
});




}
/// @nodoc
class _$AuthLoginRequestedCopyWithImpl<$Res>
    implements $AuthLoginRequestedCopyWith<$Res> {
  _$AuthLoginRequestedCopyWithImpl(this._self, this._then);

  final AuthLoginRequested _self;
  final $Res Function(AuthLoginRequested) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,}) {
  return _then(AuthLoginRequested(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AuthRegisterRequested implements AuthEvent {
  const AuthRegisterRequested({required this.name, required this.email, required this.password});
  

 final  String name;
 final  String email;
 final  String password;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthRegisterRequestedCopyWith<AuthRegisterRequested> get copyWith => _$AuthRegisterRequestedCopyWithImpl<AuthRegisterRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthRegisterRequested&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,name,email,password);

@override
String toString() {
  return 'AuthEvent.register(name: $name, email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class $AuthRegisterRequestedCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory $AuthRegisterRequestedCopyWith(AuthRegisterRequested value, $Res Function(AuthRegisterRequested) _then) = _$AuthRegisterRequestedCopyWithImpl;
@useResult
$Res call({
 String name, String email, String password
});




}
/// @nodoc
class _$AuthRegisterRequestedCopyWithImpl<$Res>
    implements $AuthRegisterRequestedCopyWith<$Res> {
  _$AuthRegisterRequestedCopyWithImpl(this._self, this._then);

  final AuthRegisterRequested _self;
  final $Res Function(AuthRegisterRequested) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? name = null,Object? email = null,Object? password = null,}) {
  return _then(AuthRegisterRequested(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AuthLogoutRequested implements AuthEvent {
  const AuthLogoutRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthLogoutRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.logout()';
}


}




/// @nodoc


class AuthGetCurrentUser implements AuthEvent {
  const AuthGetCurrentUser();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthGetCurrentUser);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.getCurrentUser()';
}


}




// dart format on
