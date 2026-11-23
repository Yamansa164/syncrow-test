// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'text_analyzer_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TextAnalyzerEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TextAnalyzerEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TextAnalyzerEvent()';
}


}

/// @nodoc
class $TextAnalyzerEventCopyWith<$Res>  {
$TextAnalyzerEventCopyWith(TextAnalyzerEvent _, $Res Function(TextAnalyzerEvent) __);
}


/// Adds pattern-matching-related methods to [TextAnalyzerEvent].
extension TextAnalyzerEventPatterns on TextAnalyzerEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _TextChangedEvent value)?  textChangedEvent,TResult Function( _RetryEvent value)?  retryEvent,TResult Function( _AnalyzeEvent value)?  analyzeEvent,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TextChangedEvent() when textChangedEvent != null:
return textChangedEvent(_that);case _RetryEvent() when retryEvent != null:
return retryEvent(_that);case _AnalyzeEvent() when analyzeEvent != null:
return analyzeEvent(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _TextChangedEvent value)  textChangedEvent,required TResult Function( _RetryEvent value)  retryEvent,required TResult Function( _AnalyzeEvent value)  analyzeEvent,}){
final _that = this;
switch (_that) {
case _TextChangedEvent():
return textChangedEvent(_that);case _RetryEvent():
return retryEvent(_that);case _AnalyzeEvent():
return analyzeEvent(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _TextChangedEvent value)?  textChangedEvent,TResult? Function( _RetryEvent value)?  retryEvent,TResult? Function( _AnalyzeEvent value)?  analyzeEvent,}){
final _that = this;
switch (_that) {
case _TextChangedEvent() when textChangedEvent != null:
return textChangedEvent(_that);case _RetryEvent() when retryEvent != null:
return retryEvent(_that);case _AnalyzeEvent() when analyzeEvent != null:
return analyzeEvent(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String text)?  textChangedEvent,TResult Function()?  retryEvent,TResult Function()?  analyzeEvent,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TextChangedEvent() when textChangedEvent != null:
return textChangedEvent(_that.text);case _RetryEvent() when retryEvent != null:
return retryEvent();case _AnalyzeEvent() when analyzeEvent != null:
return analyzeEvent();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String text)  textChangedEvent,required TResult Function()  retryEvent,required TResult Function()  analyzeEvent,}) {final _that = this;
switch (_that) {
case _TextChangedEvent():
return textChangedEvent(_that.text);case _RetryEvent():
return retryEvent();case _AnalyzeEvent():
return analyzeEvent();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String text)?  textChangedEvent,TResult? Function()?  retryEvent,TResult? Function()?  analyzeEvent,}) {final _that = this;
switch (_that) {
case _TextChangedEvent() when textChangedEvent != null:
return textChangedEvent(_that.text);case _RetryEvent() when retryEvent != null:
return retryEvent();case _AnalyzeEvent() when analyzeEvent != null:
return analyzeEvent();case _:
  return null;

}
}

}

/// @nodoc


class _TextChangedEvent implements TextAnalyzerEvent {
  const _TextChangedEvent({required this.text});
  

 final  String text;

/// Create a copy of TextAnalyzerEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TextChangedEventCopyWith<_TextChangedEvent> get copyWith => __$TextChangedEventCopyWithImpl<_TextChangedEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TextChangedEvent&&(identical(other.text, text) || other.text == text));
}


@override
int get hashCode => Object.hash(runtimeType,text);

@override
String toString() {
  return 'TextAnalyzerEvent.textChangedEvent(text: $text)';
}


}

/// @nodoc
abstract mixin class _$TextChangedEventCopyWith<$Res> implements $TextAnalyzerEventCopyWith<$Res> {
  factory _$TextChangedEventCopyWith(_TextChangedEvent value, $Res Function(_TextChangedEvent) _then) = __$TextChangedEventCopyWithImpl;
@useResult
$Res call({
 String text
});




}
/// @nodoc
class __$TextChangedEventCopyWithImpl<$Res>
    implements _$TextChangedEventCopyWith<$Res> {
  __$TextChangedEventCopyWithImpl(this._self, this._then);

  final _TextChangedEvent _self;
  final $Res Function(_TextChangedEvent) _then;

/// Create a copy of TextAnalyzerEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? text = null,}) {
  return _then(_TextChangedEvent(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _RetryEvent implements TextAnalyzerEvent {
  const _RetryEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RetryEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TextAnalyzerEvent.retryEvent()';
}


}




/// @nodoc


class _AnalyzeEvent implements TextAnalyzerEvent {
  const _AnalyzeEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnalyzeEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TextAnalyzerEvent.analyzeEvent()';
}


}




/// @nodoc
mixin _$TextAnalyzerState {

/// Stats of the last text that was analyzed successfully.
 TextStatsModel get stats;/// True while the field holds text that has not been analyzed yet. While
/// it is true, [stats] describe an older text, and the panel shows them as
/// outdated.
 bool get loading;/// Set when the analysis of the current text failed. The next change to
/// the text clears it.
 String? get errorMessage;
/// Create a copy of TextAnalyzerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TextAnalyzerStateCopyWith<TextAnalyzerState> get copyWith => _$TextAnalyzerStateCopyWithImpl<TextAnalyzerState>(this as TextAnalyzerState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TextAnalyzerState&&(identical(other.stats, stats) || other.stats == stats)&&(identical(other.loading, loading) || other.loading == loading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,stats,loading,errorMessage);

@override
String toString() {
  return 'TextAnalyzerState(stats: $stats, loading: $loading, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $TextAnalyzerStateCopyWith<$Res>  {
  factory $TextAnalyzerStateCopyWith(TextAnalyzerState value, $Res Function(TextAnalyzerState) _then) = _$TextAnalyzerStateCopyWithImpl;
@useResult
$Res call({
 TextStatsModel stats, bool loading, String? errorMessage
});


$TextStatsModelCopyWith<$Res> get stats;

}
/// @nodoc
class _$TextAnalyzerStateCopyWithImpl<$Res>
    implements $TextAnalyzerStateCopyWith<$Res> {
  _$TextAnalyzerStateCopyWithImpl(this._self, this._then);

  final TextAnalyzerState _self;
  final $Res Function(TextAnalyzerState) _then;

/// Create a copy of TextAnalyzerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? stats = null,Object? loading = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
stats: null == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as TextStatsModel,loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of TextAnalyzerState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TextStatsModelCopyWith<$Res> get stats {
  
  return $TextStatsModelCopyWith<$Res>(_self.stats, (value) {
    return _then(_self.copyWith(stats: value));
  });
}
}


/// Adds pattern-matching-related methods to [TextAnalyzerState].
extension TextAnalyzerStatePatterns on TextAnalyzerState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( TextAnalyzerData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case TextAnalyzerData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( TextAnalyzerData value)  $default,){
final _that = this;
switch (_that) {
case TextAnalyzerData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( TextAnalyzerData value)?  $default,){
final _that = this;
switch (_that) {
case TextAnalyzerData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TextStatsModel stats,  bool loading,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case TextAnalyzerData() when $default != null:
return $default(_that.stats,_that.loading,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TextStatsModel stats,  bool loading,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case TextAnalyzerData():
return $default(_that.stats,_that.loading,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TextStatsModel stats,  bool loading,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case TextAnalyzerData() when $default != null:
return $default(_that.stats,_that.loading,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class TextAnalyzerData implements TextAnalyzerState {
  const TextAnalyzerData({this.stats = const TextStatsModel(), this.loading = false, this.errorMessage});
  

/// Stats of the last text that was analyzed successfully.
@override@JsonKey() final  TextStatsModel stats;
/// True while the field holds text that has not been analyzed yet. While
/// it is true, [stats] describe an older text, and the panel shows them as
/// outdated.
@override@JsonKey() final  bool loading;
/// Set when the analysis of the current text failed. The next change to
/// the text clears it.
@override final  String? errorMessage;

/// Create a copy of TextAnalyzerState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TextAnalyzerDataCopyWith<TextAnalyzerData> get copyWith => _$TextAnalyzerDataCopyWithImpl<TextAnalyzerData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TextAnalyzerData&&(identical(other.stats, stats) || other.stats == stats)&&(identical(other.loading, loading) || other.loading == loading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,stats,loading,errorMessage);

@override
String toString() {
  return 'TextAnalyzerState(stats: $stats, loading: $loading, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $TextAnalyzerDataCopyWith<$Res> implements $TextAnalyzerStateCopyWith<$Res> {
  factory $TextAnalyzerDataCopyWith(TextAnalyzerData value, $Res Function(TextAnalyzerData) _then) = _$TextAnalyzerDataCopyWithImpl;
@override @useResult
$Res call({
 TextStatsModel stats, bool loading, String? errorMessage
});


@override $TextStatsModelCopyWith<$Res> get stats;

}
/// @nodoc
class _$TextAnalyzerDataCopyWithImpl<$Res>
    implements $TextAnalyzerDataCopyWith<$Res> {
  _$TextAnalyzerDataCopyWithImpl(this._self, this._then);

  final TextAnalyzerData _self;
  final $Res Function(TextAnalyzerData) _then;

/// Create a copy of TextAnalyzerState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? stats = null,Object? loading = null,Object? errorMessage = freezed,}) {
  return _then(TextAnalyzerData(
stats: null == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as TextStatsModel,loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of TextAnalyzerState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TextStatsModelCopyWith<$Res> get stats {
  
  return $TextStatsModelCopyWith<$Res>(_self.stats, (value) {
    return _then(_self.copyWith(stats: value));
  });
}
}

// dart format on
