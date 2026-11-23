// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ResponseModel<T> {

 T get data; String? get message; Pagination? get meta; int? get code;
/// Create a copy of ResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResponseModelCopyWith<T, ResponseModel<T>> get copyWith => _$ResponseModelCopyWithImpl<T, ResponseModel<T>>(this as ResponseModel<T>, _$identity);

  /// Serializes this ResponseModel to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT);


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResponseModel<T>&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.message, message) || other.message == message)&&(identical(other.meta, meta) || other.meta == meta)&&(identical(other.code, code) || other.code == code));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),message,meta,code);

@override
String toString() {
  return 'ResponseModel<$T>(data: $data, message: $message, meta: $meta, code: $code)';
}


}

/// @nodoc
abstract mixin class $ResponseModelCopyWith<T,$Res>  {
  factory $ResponseModelCopyWith(ResponseModel<T> value, $Res Function(ResponseModel<T>) _then) = _$ResponseModelCopyWithImpl;
@useResult
$Res call({
 T data, String? message, Pagination? meta, int? code
});


$PaginationCopyWith<$Res>? get meta;

}
/// @nodoc
class _$ResponseModelCopyWithImpl<T,$Res>
    implements $ResponseModelCopyWith<T, $Res> {
  _$ResponseModelCopyWithImpl(this._self, this._then);

  final ResponseModel<T> _self;
  final $Res Function(ResponseModel<T>) _then;

/// Create a copy of ResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = freezed,Object? message = freezed,Object? meta = freezed,Object? code = freezed,}) {
  return _then(_self.copyWith(
data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as Pagination?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of ResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationCopyWith<$Res>? get meta {
    if (_self.meta == null) {
    return null;
  }

  return $PaginationCopyWith<$Res>(_self.meta!, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}


/// Adds pattern-matching-related methods to [ResponseModel].
extension ResponseModelPatterns<T> on ResponseModel<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResponseModel<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResponseModel<T> value)  $default,){
final _that = this;
switch (_that) {
case _ResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResponseModel<T> value)?  $default,){
final _that = this;
switch (_that) {
case _ResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( T data,  String? message,  Pagination? meta,  int? code)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResponseModel() when $default != null:
return $default(_that.data,_that.message,_that.meta,_that.code);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( T data,  String? message,  Pagination? meta,  int? code)  $default,) {final _that = this;
switch (_that) {
case _ResponseModel():
return $default(_that.data,_that.message,_that.meta,_that.code);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( T data,  String? message,  Pagination? meta,  int? code)?  $default,) {final _that = this;
switch (_that) {
case _ResponseModel() when $default != null:
return $default(_that.data,_that.message,_that.meta,_that.code);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)

class _ResponseModel<T> implements ResponseModel<T> {
  const _ResponseModel({required this.data, required this.message, required this.meta, required this.code});
  factory _ResponseModel.fromJson(Map<String, dynamic> json,T Function(Object?) fromJsonT) => _$ResponseModelFromJson(json,fromJsonT);

@override final  T data;
@override final  String? message;
@override final  Pagination? meta;
@override final  int? code;

/// Create a copy of ResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResponseModelCopyWith<T, _ResponseModel<T>> get copyWith => __$ResponseModelCopyWithImpl<T, _ResponseModel<T>>(this, _$identity);

@override
Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
  return _$ResponseModelToJson<T>(this, toJsonT);
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResponseModel<T>&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.message, message) || other.message == message)&&(identical(other.meta, meta) || other.meta == meta)&&(identical(other.code, code) || other.code == code));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),message,meta,code);

@override
String toString() {
  return 'ResponseModel<$T>(data: $data, message: $message, meta: $meta, code: $code)';
}


}

/// @nodoc
abstract mixin class _$ResponseModelCopyWith<T,$Res> implements $ResponseModelCopyWith<T, $Res> {
  factory _$ResponseModelCopyWith(_ResponseModel<T> value, $Res Function(_ResponseModel<T>) _then) = __$ResponseModelCopyWithImpl;
@override @useResult
$Res call({
 T data, String? message, Pagination? meta, int? code
});


@override $PaginationCopyWith<$Res>? get meta;

}
/// @nodoc
class __$ResponseModelCopyWithImpl<T,$Res>
    implements _$ResponseModelCopyWith<T, $Res> {
  __$ResponseModelCopyWithImpl(this._self, this._then);

  final _ResponseModel<T> _self;
  final $Res Function(_ResponseModel<T>) _then;

/// Create a copy of ResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = freezed,Object? message = freezed,Object? meta = freezed,Object? code = freezed,}) {
  return _then(_ResponseModel<T>(
data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as Pagination?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of ResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationCopyWith<$Res>? get meta {
    if (_self.meta == null) {
    return null;
  }

  return $PaginationCopyWith<$Res>(_self.meta!, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}


/// @nodoc
mixin _$Pagination {

@JsonKey(name: 'current_page') int? get page;@JsonKey(name: 'per_page') int? get perPage;@JsonKey(name: 'last_page') int? get totalPages; int? get total;
/// Create a copy of Pagination
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginationCopyWith<Pagination> get copyWith => _$PaginationCopyWithImpl<Pagination>(this as Pagination, _$identity);

  /// Serializes this Pagination to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Pagination&&(identical(other.page, page) || other.page == page)&&(identical(other.perPage, perPage) || other.perPage == perPage)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,page,perPage,totalPages,total);

@override
String toString() {
  return 'Pagination(page: $page, perPage: $perPage, totalPages: $totalPages, total: $total)';
}


}

/// @nodoc
abstract mixin class $PaginationCopyWith<$Res>  {
  factory $PaginationCopyWith(Pagination value, $Res Function(Pagination) _then) = _$PaginationCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'current_page') int? page,@JsonKey(name: 'per_page') int? perPage,@JsonKey(name: 'last_page') int? totalPages, int? total
});




}
/// @nodoc
class _$PaginationCopyWithImpl<$Res>
    implements $PaginationCopyWith<$Res> {
  _$PaginationCopyWithImpl(this._self, this._then);

  final Pagination _self;
  final $Res Function(Pagination) _then;

/// Create a copy of Pagination
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? page = freezed,Object? perPage = freezed,Object? totalPages = freezed,Object? total = freezed,}) {
  return _then(_self.copyWith(
page: freezed == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int?,perPage: freezed == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as int?,totalPages: freezed == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int?,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [Pagination].
extension PaginationPatterns on Pagination {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Pagination value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Pagination() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Pagination value)  $default,){
final _that = this;
switch (_that) {
case _Pagination():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Pagination value)?  $default,){
final _that = this;
switch (_that) {
case _Pagination() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'current_page')  int? page, @JsonKey(name: 'per_page')  int? perPage, @JsonKey(name: 'last_page')  int? totalPages,  int? total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Pagination() when $default != null:
return $default(_that.page,_that.perPage,_that.totalPages,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'current_page')  int? page, @JsonKey(name: 'per_page')  int? perPage, @JsonKey(name: 'last_page')  int? totalPages,  int? total)  $default,) {final _that = this;
switch (_that) {
case _Pagination():
return $default(_that.page,_that.perPage,_that.totalPages,_that.total);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'current_page')  int? page, @JsonKey(name: 'per_page')  int? perPage, @JsonKey(name: 'last_page')  int? totalPages,  int? total)?  $default,) {final _that = this;
switch (_that) {
case _Pagination() when $default != null:
return $default(_that.page,_that.perPage,_that.totalPages,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Pagination implements Pagination {
  const _Pagination({@JsonKey(name: 'current_page') required this.page, @JsonKey(name: 'per_page') required this.perPage, @JsonKey(name: 'last_page') required this.totalPages, required this.total});
  factory _Pagination.fromJson(Map<String, dynamic> json) => _$PaginationFromJson(json);

@override@JsonKey(name: 'current_page') final  int? page;
@override@JsonKey(name: 'per_page') final  int? perPage;
@override@JsonKey(name: 'last_page') final  int? totalPages;
@override final  int? total;

/// Create a copy of Pagination
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginationCopyWith<_Pagination> get copyWith => __$PaginationCopyWithImpl<_Pagination>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaginationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Pagination&&(identical(other.page, page) || other.page == page)&&(identical(other.perPage, perPage) || other.perPage == perPage)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,page,perPage,totalPages,total);

@override
String toString() {
  return 'Pagination(page: $page, perPage: $perPage, totalPages: $totalPages, total: $total)';
}


}

/// @nodoc
abstract mixin class _$PaginationCopyWith<$Res> implements $PaginationCopyWith<$Res> {
  factory _$PaginationCopyWith(_Pagination value, $Res Function(_Pagination) _then) = __$PaginationCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'current_page') int? page,@JsonKey(name: 'per_page') int? perPage,@JsonKey(name: 'last_page') int? totalPages, int? total
});




}
/// @nodoc
class __$PaginationCopyWithImpl<$Res>
    implements _$PaginationCopyWith<$Res> {
  __$PaginationCopyWithImpl(this._self, this._then);

  final _Pagination _self;
  final $Res Function(_Pagination) _then;

/// Create a copy of Pagination
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? page = freezed,Object? perPage = freezed,Object? totalPages = freezed,Object? total = freezed,}) {
  return _then(_Pagination(
page: freezed == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int?,perPage: freezed == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as int?,totalPages: freezed == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int?,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
