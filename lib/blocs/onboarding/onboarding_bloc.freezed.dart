// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OnboardingEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardingEvent()';
}


}

/// @nodoc
class $OnboardingEventCopyWith<$Res>  {
$OnboardingEventCopyWith(OnboardingEvent _, $Res Function(OnboardingEvent) __);
}


/// Adds pattern-matching-related methods to [OnboardingEvent].
extension OnboardingEventPatterns on OnboardingEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _StartRecording value)?  startRecording,TResult Function( _StopRecording value)?  stopRecording,TResult Function( _SaveGoals value)?  saveGoals,TResult Function( _Reset value)?  reset,TResult Function( _UpdateAudioLevel value)?  updateAudioLevel,TResult Function( _Tick value)?  tick,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StartRecording() when startRecording != null:
return startRecording(_that);case _StopRecording() when stopRecording != null:
return stopRecording(_that);case _SaveGoals() when saveGoals != null:
return saveGoals(_that);case _Reset() when reset != null:
return reset(_that);case _UpdateAudioLevel() when updateAudioLevel != null:
return updateAudioLevel(_that);case _Tick() when tick != null:
return tick(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _StartRecording value)  startRecording,required TResult Function( _StopRecording value)  stopRecording,required TResult Function( _SaveGoals value)  saveGoals,required TResult Function( _Reset value)  reset,required TResult Function( _UpdateAudioLevel value)  updateAudioLevel,required TResult Function( _Tick value)  tick,}){
final _that = this;
switch (_that) {
case _StartRecording():
return startRecording(_that);case _StopRecording():
return stopRecording(_that);case _SaveGoals():
return saveGoals(_that);case _Reset():
return reset(_that);case _UpdateAudioLevel():
return updateAudioLevel(_that);case _Tick():
return tick(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _StartRecording value)?  startRecording,TResult? Function( _StopRecording value)?  stopRecording,TResult? Function( _SaveGoals value)?  saveGoals,TResult? Function( _Reset value)?  reset,TResult? Function( _UpdateAudioLevel value)?  updateAudioLevel,TResult? Function( _Tick value)?  tick,}){
final _that = this;
switch (_that) {
case _StartRecording() when startRecording != null:
return startRecording(_that);case _StopRecording() when stopRecording != null:
return stopRecording(_that);case _SaveGoals() when saveGoals != null:
return saveGoals(_that);case _Reset() when reset != null:
return reset(_that);case _UpdateAudioLevel() when updateAudioLevel != null:
return updateAudioLevel(_that);case _Tick() when tick != null:
return tick(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  startRecording,TResult Function()?  stopRecording,TResult Function( String goals)?  saveGoals,TResult Function()?  reset,TResult Function()?  updateAudioLevel,TResult Function()?  tick,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StartRecording() when startRecording != null:
return startRecording();case _StopRecording() when stopRecording != null:
return stopRecording();case _SaveGoals() when saveGoals != null:
return saveGoals(_that.goals);case _Reset() when reset != null:
return reset();case _UpdateAudioLevel() when updateAudioLevel != null:
return updateAudioLevel();case _Tick() when tick != null:
return tick();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  startRecording,required TResult Function()  stopRecording,required TResult Function( String goals)  saveGoals,required TResult Function()  reset,required TResult Function()  updateAudioLevel,required TResult Function()  tick,}) {final _that = this;
switch (_that) {
case _StartRecording():
return startRecording();case _StopRecording():
return stopRecording();case _SaveGoals():
return saveGoals(_that.goals);case _Reset():
return reset();case _UpdateAudioLevel():
return updateAudioLevel();case _Tick():
return tick();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  startRecording,TResult? Function()?  stopRecording,TResult? Function( String goals)?  saveGoals,TResult? Function()?  reset,TResult? Function()?  updateAudioLevel,TResult? Function()?  tick,}) {final _that = this;
switch (_that) {
case _StartRecording() when startRecording != null:
return startRecording();case _StopRecording() when stopRecording != null:
return stopRecording();case _SaveGoals() when saveGoals != null:
return saveGoals(_that.goals);case _Reset() when reset != null:
return reset();case _UpdateAudioLevel() when updateAudioLevel != null:
return updateAudioLevel();case _Tick() when tick != null:
return tick();case _:
  return null;

}
}

}

/// @nodoc


class _StartRecording implements OnboardingEvent {
  const _StartRecording();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StartRecording);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardingEvent.startRecording()';
}


}




/// @nodoc


class _StopRecording implements OnboardingEvent {
  const _StopRecording();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StopRecording);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardingEvent.stopRecording()';
}


}




/// @nodoc


class _SaveGoals implements OnboardingEvent {
  const _SaveGoals(this.goals);
  

 final  String goals;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SaveGoalsCopyWith<_SaveGoals> get copyWith => __$SaveGoalsCopyWithImpl<_SaveGoals>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaveGoals&&(identical(other.goals, goals) || other.goals == goals));
}


@override
int get hashCode => Object.hash(runtimeType,goals);

@override
String toString() {
  return 'OnboardingEvent.saveGoals(goals: $goals)';
}


}

/// @nodoc
abstract mixin class _$SaveGoalsCopyWith<$Res> implements $OnboardingEventCopyWith<$Res> {
  factory _$SaveGoalsCopyWith(_SaveGoals value, $Res Function(_SaveGoals) _then) = __$SaveGoalsCopyWithImpl;
@useResult
$Res call({
 String goals
});




}
/// @nodoc
class __$SaveGoalsCopyWithImpl<$Res>
    implements _$SaveGoalsCopyWith<$Res> {
  __$SaveGoalsCopyWithImpl(this._self, this._then);

  final _SaveGoals _self;
  final $Res Function(_SaveGoals) _then;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? goals = null,}) {
  return _then(_SaveGoals(
null == goals ? _self.goals : goals // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Reset implements OnboardingEvent {
  const _Reset();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Reset);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardingEvent.reset()';
}


}




/// @nodoc


class _UpdateAudioLevel implements OnboardingEvent {
  const _UpdateAudioLevel();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateAudioLevel);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardingEvent.updateAudioLevel()';
}


}




/// @nodoc


class _Tick implements OnboardingEvent {
  const _Tick();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Tick);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardingEvent.tick()';
}


}




/// @nodoc
mixin _$OnboardingState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardingState()';
}


}

/// @nodoc
class $OnboardingStateCopyWith<$Res>  {
$OnboardingStateCopyWith(OnboardingState _, $Res Function(OnboardingState) __);
}


/// Adds pattern-matching-related methods to [OnboardingState].
extension OnboardingStatePatterns on OnboardingState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Recording value)?  recording,TResult Function( _Processing value)?  processing,TResult Function( _Review value)?  review,TResult Function( _Success value)?  success,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Recording() when recording != null:
return recording(_that);case _Processing() when processing != null:
return processing(_that);case _Review() when review != null:
return review(_that);case _Success() when success != null:
return success(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Recording value)  recording,required TResult Function( _Processing value)  processing,required TResult Function( _Review value)  review,required TResult Function( _Success value)  success,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Recording():
return recording(_that);case _Processing():
return processing(_that);case _Review():
return review(_that);case _Success():
return success(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Recording value)?  recording,TResult? Function( _Processing value)?  processing,TResult? Function( _Review value)?  review,TResult? Function( _Success value)?  success,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Recording() when recording != null:
return recording(_that);case _Processing() when processing != null:
return processing(_that);case _Review() when review != null:
return review(_that);case _Success() when success != null:
return success(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( int seconds,  double audioLevel)?  recording,TResult Function()?  processing,TResult Function( String transcript,  String? error)?  review,TResult Function()?  success,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Recording() when recording != null:
return recording(_that.seconds,_that.audioLevel);case _Processing() when processing != null:
return processing();case _Review() when review != null:
return review(_that.transcript,_that.error);case _Success() when success != null:
return success();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( int seconds,  double audioLevel)  recording,required TResult Function()  processing,required TResult Function( String transcript,  String? error)  review,required TResult Function()  success,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Recording():
return recording(_that.seconds,_that.audioLevel);case _Processing():
return processing();case _Review():
return review(_that.transcript,_that.error);case _Success():
return success();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( int seconds,  double audioLevel)?  recording,TResult? Function()?  processing,TResult? Function( String transcript,  String? error)?  review,TResult? Function()?  success,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Recording() when recording != null:
return recording(_that.seconds,_that.audioLevel);case _Processing() when processing != null:
return processing();case _Review() when review != null:
return review(_that.transcript,_that.error);case _Success() when success != null:
return success();case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements OnboardingState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardingState.initial()';
}


}




/// @nodoc


class _Recording implements OnboardingState {
  const _Recording({required this.seconds, required this.audioLevel});
  

 final  int seconds;
 final  double audioLevel;

/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecordingCopyWith<_Recording> get copyWith => __$RecordingCopyWithImpl<_Recording>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Recording&&(identical(other.seconds, seconds) || other.seconds == seconds)&&(identical(other.audioLevel, audioLevel) || other.audioLevel == audioLevel));
}


@override
int get hashCode => Object.hash(runtimeType,seconds,audioLevel);

@override
String toString() {
  return 'OnboardingState.recording(seconds: $seconds, audioLevel: $audioLevel)';
}


}

/// @nodoc
abstract mixin class _$RecordingCopyWith<$Res> implements $OnboardingStateCopyWith<$Res> {
  factory _$RecordingCopyWith(_Recording value, $Res Function(_Recording) _then) = __$RecordingCopyWithImpl;
@useResult
$Res call({
 int seconds, double audioLevel
});




}
/// @nodoc
class __$RecordingCopyWithImpl<$Res>
    implements _$RecordingCopyWith<$Res> {
  __$RecordingCopyWithImpl(this._self, this._then);

  final _Recording _self;
  final $Res Function(_Recording) _then;

/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? seconds = null,Object? audioLevel = null,}) {
  return _then(_Recording(
seconds: null == seconds ? _self.seconds : seconds // ignore: cast_nullable_to_non_nullable
as int,audioLevel: null == audioLevel ? _self.audioLevel : audioLevel // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc


class _Processing implements OnboardingState {
  const _Processing();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Processing);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardingState.processing()';
}


}




/// @nodoc


class _Review implements OnboardingState {
  const _Review({required this.transcript, this.error});
  

 final  String transcript;
 final  String? error;

/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReviewCopyWith<_Review> get copyWith => __$ReviewCopyWithImpl<_Review>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Review&&(identical(other.transcript, transcript) || other.transcript == transcript)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,transcript,error);

@override
String toString() {
  return 'OnboardingState.review(transcript: $transcript, error: $error)';
}


}

/// @nodoc
abstract mixin class _$ReviewCopyWith<$Res> implements $OnboardingStateCopyWith<$Res> {
  factory _$ReviewCopyWith(_Review value, $Res Function(_Review) _then) = __$ReviewCopyWithImpl;
@useResult
$Res call({
 String transcript, String? error
});




}
/// @nodoc
class __$ReviewCopyWithImpl<$Res>
    implements _$ReviewCopyWith<$Res> {
  __$ReviewCopyWithImpl(this._self, this._then);

  final _Review _self;
  final $Res Function(_Review) _then;

/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? transcript = null,Object? error = freezed,}) {
  return _then(_Review(
transcript: null == transcript ? _self.transcript : transcript // ignore: cast_nullable_to_non_nullable
as String,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _Success implements OnboardingState {
  const _Success();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardingState.success()';
}


}




// dart format on
