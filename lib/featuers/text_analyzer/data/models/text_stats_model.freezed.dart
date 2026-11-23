// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'text_stats_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TextStatsModel {

 int get wordCount; int get letterCount; int get whitespaceCount;/// Most frequent words first, at most five of them.
 List<WordFrequencyModel> get topWords;
/// Create a copy of TextStatsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TextStatsModelCopyWith<TextStatsModel> get copyWith => _$TextStatsModelCopyWithImpl<TextStatsModel>(this as TextStatsModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TextStatsModel&&(identical(other.wordCount, wordCount) || other.wordCount == wordCount)&&(identical(other.letterCount, letterCount) || other.letterCount == letterCount)&&(identical(other.whitespaceCount, whitespaceCount) || other.whitespaceCount == whitespaceCount)&&const DeepCollectionEquality().equals(other.topWords, topWords));
}


@override
int get hashCode => Object.hash(runtimeType,wordCount,letterCount,whitespaceCount,const DeepCollectionEquality().hash(topWords));

@override
String toString() {
  return 'TextStatsModel(wordCount: $wordCount, letterCount: $letterCount, whitespaceCount: $whitespaceCount, topWords: $topWords)';
}


}

/// @nodoc
abstract mixin class $TextStatsModelCopyWith<$Res>  {
  factory $TextStatsModelCopyWith(TextStatsModel value, $Res Function(TextStatsModel) _then) = _$TextStatsModelCopyWithImpl;
@useResult
$Res call({
 int wordCount, int letterCount, int whitespaceCount, List<WordFrequencyModel> topWords
});




}
/// @nodoc
class _$TextStatsModelCopyWithImpl<$Res>
    implements $TextStatsModelCopyWith<$Res> {
  _$TextStatsModelCopyWithImpl(this._self, this._then);

  final TextStatsModel _self;
  final $Res Function(TextStatsModel) _then;

/// Create a copy of TextStatsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? wordCount = null,Object? letterCount = null,Object? whitespaceCount = null,Object? topWords = null,}) {
  return _then(_self.copyWith(
wordCount: null == wordCount ? _self.wordCount : wordCount // ignore: cast_nullable_to_non_nullable
as int,letterCount: null == letterCount ? _self.letterCount : letterCount // ignore: cast_nullable_to_non_nullable
as int,whitespaceCount: null == whitespaceCount ? _self.whitespaceCount : whitespaceCount // ignore: cast_nullable_to_non_nullable
as int,topWords: null == topWords ? _self.topWords : topWords // ignore: cast_nullable_to_non_nullable
as List<WordFrequencyModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [TextStatsModel].
extension TextStatsModelPatterns on TextStatsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TextStatsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TextStatsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TextStatsModel value)  $default,){
final _that = this;
switch (_that) {
case _TextStatsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TextStatsModel value)?  $default,){
final _that = this;
switch (_that) {
case _TextStatsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int wordCount,  int letterCount,  int whitespaceCount,  List<WordFrequencyModel> topWords)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TextStatsModel() when $default != null:
return $default(_that.wordCount,_that.letterCount,_that.whitespaceCount,_that.topWords);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int wordCount,  int letterCount,  int whitespaceCount,  List<WordFrequencyModel> topWords)  $default,) {final _that = this;
switch (_that) {
case _TextStatsModel():
return $default(_that.wordCount,_that.letterCount,_that.whitespaceCount,_that.topWords);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int wordCount,  int letterCount,  int whitespaceCount,  List<WordFrequencyModel> topWords)?  $default,) {final _that = this;
switch (_that) {
case _TextStatsModel() when $default != null:
return $default(_that.wordCount,_that.letterCount,_that.whitespaceCount,_that.topWords);case _:
  return null;

}
}

}

/// @nodoc


class _TextStatsModel implements TextStatsModel {
  const _TextStatsModel({this.wordCount = 0, this.letterCount = 0, this.whitespaceCount = 0, final  List<WordFrequencyModel> topWords = const []}): _topWords = topWords;
  

@override@JsonKey() final  int wordCount;
@override@JsonKey() final  int letterCount;
@override@JsonKey() final  int whitespaceCount;
/// Most frequent words first, at most five of them.
 final  List<WordFrequencyModel> _topWords;
/// Most frequent words first, at most five of them.
@override@JsonKey() List<WordFrequencyModel> get topWords {
  if (_topWords is EqualUnmodifiableListView) return _topWords;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_topWords);
}


/// Create a copy of TextStatsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TextStatsModelCopyWith<_TextStatsModel> get copyWith => __$TextStatsModelCopyWithImpl<_TextStatsModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TextStatsModel&&(identical(other.wordCount, wordCount) || other.wordCount == wordCount)&&(identical(other.letterCount, letterCount) || other.letterCount == letterCount)&&(identical(other.whitespaceCount, whitespaceCount) || other.whitespaceCount == whitespaceCount)&&const DeepCollectionEquality().equals(other._topWords, _topWords));
}


@override
int get hashCode => Object.hash(runtimeType,wordCount,letterCount,whitespaceCount,const DeepCollectionEquality().hash(_topWords));

@override
String toString() {
  return 'TextStatsModel(wordCount: $wordCount, letterCount: $letterCount, whitespaceCount: $whitespaceCount, topWords: $topWords)';
}


}

/// @nodoc
abstract mixin class _$TextStatsModelCopyWith<$Res> implements $TextStatsModelCopyWith<$Res> {
  factory _$TextStatsModelCopyWith(_TextStatsModel value, $Res Function(_TextStatsModel) _then) = __$TextStatsModelCopyWithImpl;
@override @useResult
$Res call({
 int wordCount, int letterCount, int whitespaceCount, List<WordFrequencyModel> topWords
});




}
/// @nodoc
class __$TextStatsModelCopyWithImpl<$Res>
    implements _$TextStatsModelCopyWith<$Res> {
  __$TextStatsModelCopyWithImpl(this._self, this._then);

  final _TextStatsModel _self;
  final $Res Function(_TextStatsModel) _then;

/// Create a copy of TextStatsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? wordCount = null,Object? letterCount = null,Object? whitespaceCount = null,Object? topWords = null,}) {
  return _then(_TextStatsModel(
wordCount: null == wordCount ? _self.wordCount : wordCount // ignore: cast_nullable_to_non_nullable
as int,letterCount: null == letterCount ? _self.letterCount : letterCount // ignore: cast_nullable_to_non_nullable
as int,whitespaceCount: null == whitespaceCount ? _self.whitespaceCount : whitespaceCount // ignore: cast_nullable_to_non_nullable
as int,topWords: null == topWords ? _self._topWords : topWords // ignore: cast_nullable_to_non_nullable
as List<WordFrequencyModel>,
  ));
}


}

/// @nodoc
mixin _$WordFrequencyModel {

 String get word; int get count;
/// Create a copy of WordFrequencyModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WordFrequencyModelCopyWith<WordFrequencyModel> get copyWith => _$WordFrequencyModelCopyWithImpl<WordFrequencyModel>(this as WordFrequencyModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WordFrequencyModel&&(identical(other.word, word) || other.word == word)&&(identical(other.count, count) || other.count == count));
}


@override
int get hashCode => Object.hash(runtimeType,word,count);

@override
String toString() {
  return 'WordFrequencyModel(word: $word, count: $count)';
}


}

/// @nodoc
abstract mixin class $WordFrequencyModelCopyWith<$Res>  {
  factory $WordFrequencyModelCopyWith(WordFrequencyModel value, $Res Function(WordFrequencyModel) _then) = _$WordFrequencyModelCopyWithImpl;
@useResult
$Res call({
 String word, int count
});




}
/// @nodoc
class _$WordFrequencyModelCopyWithImpl<$Res>
    implements $WordFrequencyModelCopyWith<$Res> {
  _$WordFrequencyModelCopyWithImpl(this._self, this._then);

  final WordFrequencyModel _self;
  final $Res Function(WordFrequencyModel) _then;

/// Create a copy of WordFrequencyModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? word = null,Object? count = null,}) {
  return _then(_self.copyWith(
word: null == word ? _self.word : word // ignore: cast_nullable_to_non_nullable
as String,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [WordFrequencyModel].
extension WordFrequencyModelPatterns on WordFrequencyModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WordFrequencyModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WordFrequencyModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WordFrequencyModel value)  $default,){
final _that = this;
switch (_that) {
case _WordFrequencyModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WordFrequencyModel value)?  $default,){
final _that = this;
switch (_that) {
case _WordFrequencyModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String word,  int count)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WordFrequencyModel() when $default != null:
return $default(_that.word,_that.count);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String word,  int count)  $default,) {final _that = this;
switch (_that) {
case _WordFrequencyModel():
return $default(_that.word,_that.count);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String word,  int count)?  $default,) {final _that = this;
switch (_that) {
case _WordFrequencyModel() when $default != null:
return $default(_that.word,_that.count);case _:
  return null;

}
}

}

/// @nodoc


class _WordFrequencyModel implements WordFrequencyModel {
  const _WordFrequencyModel({required this.word, required this.count});
  

@override final  String word;
@override final  int count;

/// Create a copy of WordFrequencyModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WordFrequencyModelCopyWith<_WordFrequencyModel> get copyWith => __$WordFrequencyModelCopyWithImpl<_WordFrequencyModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WordFrequencyModel&&(identical(other.word, word) || other.word == word)&&(identical(other.count, count) || other.count == count));
}


@override
int get hashCode => Object.hash(runtimeType,word,count);

@override
String toString() {
  return 'WordFrequencyModel(word: $word, count: $count)';
}


}

/// @nodoc
abstract mixin class _$WordFrequencyModelCopyWith<$Res> implements $WordFrequencyModelCopyWith<$Res> {
  factory _$WordFrequencyModelCopyWith(_WordFrequencyModel value, $Res Function(_WordFrequencyModel) _then) = __$WordFrequencyModelCopyWithImpl;
@override @useResult
$Res call({
 String word, int count
});




}
/// @nodoc
class __$WordFrequencyModelCopyWithImpl<$Res>
    implements _$WordFrequencyModelCopyWith<$Res> {
  __$WordFrequencyModelCopyWithImpl(this._self, this._then);

  final _WordFrequencyModel _self;
  final $Res Function(_WordFrequencyModel) _then;

/// Create a copy of WordFrequencyModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? word = null,Object? count = null,}) {
  return _then(_WordFrequencyModel(
word: null == word ? _self.word : word // ignore: cast_nullable_to_non_nullable
as String,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
