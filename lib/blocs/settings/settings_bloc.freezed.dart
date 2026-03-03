// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SettingsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SettingsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SettingsEvent()';
}


}

/// @nodoc
class $SettingsEventCopyWith<$Res>  {
$SettingsEventCopyWith(SettingsEvent _, $Res Function(SettingsEvent) __);
}


/// Adds pattern-matching-related methods to [SettingsEvent].
extension SettingsEventPatterns on SettingsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Load value)?  load,TResult Function( _UpdateGoals value)?  updateGoals,TResult Function( _UpdateFrequency value)?  updateFrequency,TResult Function( _UpdateTaskCount value)?  updateTaskCount,TResult Function( _ToggleUnlimitedRegen value)?  toggleUnlimitedRegen,TResult Function( _ResetData value)?  resetData,TResult Function( _SpawnTestNotification value)?  spawnTestNotification,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Load() when load != null:
return load(_that);case _UpdateGoals() when updateGoals != null:
return updateGoals(_that);case _UpdateFrequency() when updateFrequency != null:
return updateFrequency(_that);case _UpdateTaskCount() when updateTaskCount != null:
return updateTaskCount(_that);case _ToggleUnlimitedRegen() when toggleUnlimitedRegen != null:
return toggleUnlimitedRegen(_that);case _ResetData() when resetData != null:
return resetData(_that);case _SpawnTestNotification() when spawnTestNotification != null:
return spawnTestNotification(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Load value)  load,required TResult Function( _UpdateGoals value)  updateGoals,required TResult Function( _UpdateFrequency value)  updateFrequency,required TResult Function( _UpdateTaskCount value)  updateTaskCount,required TResult Function( _ToggleUnlimitedRegen value)  toggleUnlimitedRegen,required TResult Function( _ResetData value)  resetData,required TResult Function( _SpawnTestNotification value)  spawnTestNotification,}){
final _that = this;
switch (_that) {
case _Load():
return load(_that);case _UpdateGoals():
return updateGoals(_that);case _UpdateFrequency():
return updateFrequency(_that);case _UpdateTaskCount():
return updateTaskCount(_that);case _ToggleUnlimitedRegen():
return toggleUnlimitedRegen(_that);case _ResetData():
return resetData(_that);case _SpawnTestNotification():
return spawnTestNotification(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Load value)?  load,TResult? Function( _UpdateGoals value)?  updateGoals,TResult? Function( _UpdateFrequency value)?  updateFrequency,TResult? Function( _UpdateTaskCount value)?  updateTaskCount,TResult? Function( _ToggleUnlimitedRegen value)?  toggleUnlimitedRegen,TResult? Function( _ResetData value)?  resetData,TResult? Function( _SpawnTestNotification value)?  spawnTestNotification,}){
final _that = this;
switch (_that) {
case _Load() when load != null:
return load(_that);case _UpdateGoals() when updateGoals != null:
return updateGoals(_that);case _UpdateFrequency() when updateFrequency != null:
return updateFrequency(_that);case _UpdateTaskCount() when updateTaskCount != null:
return updateTaskCount(_that);case _ToggleUnlimitedRegen() when toggleUnlimitedRegen != null:
return toggleUnlimitedRegen(_that);case _ResetData() when resetData != null:
return resetData(_that);case _SpawnTestNotification() when spawnTestNotification != null:
return spawnTestNotification(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  load,TResult Function( String goals)?  updateGoals,TResult Function( int hours)?  updateFrequency,TResult Function( int count)?  updateTaskCount,TResult Function( bool value)?  toggleUnlimitedRegen,TResult Function()?  resetData,TResult Function()?  spawnTestNotification,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Load() when load != null:
return load();case _UpdateGoals() when updateGoals != null:
return updateGoals(_that.goals);case _UpdateFrequency() when updateFrequency != null:
return updateFrequency(_that.hours);case _UpdateTaskCount() when updateTaskCount != null:
return updateTaskCount(_that.count);case _ToggleUnlimitedRegen() when toggleUnlimitedRegen != null:
return toggleUnlimitedRegen(_that.value);case _ResetData() when resetData != null:
return resetData();case _SpawnTestNotification() when spawnTestNotification != null:
return spawnTestNotification();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  load,required TResult Function( String goals)  updateGoals,required TResult Function( int hours)  updateFrequency,required TResult Function( int count)  updateTaskCount,required TResult Function( bool value)  toggleUnlimitedRegen,required TResult Function()  resetData,required TResult Function()  spawnTestNotification,}) {final _that = this;
switch (_that) {
case _Load():
return load();case _UpdateGoals():
return updateGoals(_that.goals);case _UpdateFrequency():
return updateFrequency(_that.hours);case _UpdateTaskCount():
return updateTaskCount(_that.count);case _ToggleUnlimitedRegen():
return toggleUnlimitedRegen(_that.value);case _ResetData():
return resetData();case _SpawnTestNotification():
return spawnTestNotification();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  load,TResult? Function( String goals)?  updateGoals,TResult? Function( int hours)?  updateFrequency,TResult? Function( int count)?  updateTaskCount,TResult? Function( bool value)?  toggleUnlimitedRegen,TResult? Function()?  resetData,TResult? Function()?  spawnTestNotification,}) {final _that = this;
switch (_that) {
case _Load() when load != null:
return load();case _UpdateGoals() when updateGoals != null:
return updateGoals(_that.goals);case _UpdateFrequency() when updateFrequency != null:
return updateFrequency(_that.hours);case _UpdateTaskCount() when updateTaskCount != null:
return updateTaskCount(_that.count);case _ToggleUnlimitedRegen() when toggleUnlimitedRegen != null:
return toggleUnlimitedRegen(_that.value);case _ResetData() when resetData != null:
return resetData();case _SpawnTestNotification() when spawnTestNotification != null:
return spawnTestNotification();case _:
  return null;

}
}

}

/// @nodoc


class _Load implements SettingsEvent {
  const _Load();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Load);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SettingsEvent.load()';
}


}




/// @nodoc


class _UpdateGoals implements SettingsEvent {
  const _UpdateGoals(this.goals);
  

 final  String goals;

/// Create a copy of SettingsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateGoalsCopyWith<_UpdateGoals> get copyWith => __$UpdateGoalsCopyWithImpl<_UpdateGoals>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateGoals&&(identical(other.goals, goals) || other.goals == goals));
}


@override
int get hashCode => Object.hash(runtimeType,goals);

@override
String toString() {
  return 'SettingsEvent.updateGoals(goals: $goals)';
}


}

/// @nodoc
abstract mixin class _$UpdateGoalsCopyWith<$Res> implements $SettingsEventCopyWith<$Res> {
  factory _$UpdateGoalsCopyWith(_UpdateGoals value, $Res Function(_UpdateGoals) _then) = __$UpdateGoalsCopyWithImpl;
@useResult
$Res call({
 String goals
});




}
/// @nodoc
class __$UpdateGoalsCopyWithImpl<$Res>
    implements _$UpdateGoalsCopyWith<$Res> {
  __$UpdateGoalsCopyWithImpl(this._self, this._then);

  final _UpdateGoals _self;
  final $Res Function(_UpdateGoals) _then;

/// Create a copy of SettingsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? goals = null,}) {
  return _then(_UpdateGoals(
null == goals ? _self.goals : goals // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _UpdateFrequency implements SettingsEvent {
  const _UpdateFrequency(this.hours);
  

 final  int hours;

/// Create a copy of SettingsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateFrequencyCopyWith<_UpdateFrequency> get copyWith => __$UpdateFrequencyCopyWithImpl<_UpdateFrequency>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateFrequency&&(identical(other.hours, hours) || other.hours == hours));
}


@override
int get hashCode => Object.hash(runtimeType,hours);

@override
String toString() {
  return 'SettingsEvent.updateFrequency(hours: $hours)';
}


}

/// @nodoc
abstract mixin class _$UpdateFrequencyCopyWith<$Res> implements $SettingsEventCopyWith<$Res> {
  factory _$UpdateFrequencyCopyWith(_UpdateFrequency value, $Res Function(_UpdateFrequency) _then) = __$UpdateFrequencyCopyWithImpl;
@useResult
$Res call({
 int hours
});




}
/// @nodoc
class __$UpdateFrequencyCopyWithImpl<$Res>
    implements _$UpdateFrequencyCopyWith<$Res> {
  __$UpdateFrequencyCopyWithImpl(this._self, this._then);

  final _UpdateFrequency _self;
  final $Res Function(_UpdateFrequency) _then;

/// Create a copy of SettingsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? hours = null,}) {
  return _then(_UpdateFrequency(
null == hours ? _self.hours : hours // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _UpdateTaskCount implements SettingsEvent {
  const _UpdateTaskCount(this.count);
  

 final  int count;

/// Create a copy of SettingsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateTaskCountCopyWith<_UpdateTaskCount> get copyWith => __$UpdateTaskCountCopyWithImpl<_UpdateTaskCount>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateTaskCount&&(identical(other.count, count) || other.count == count));
}


@override
int get hashCode => Object.hash(runtimeType,count);

@override
String toString() {
  return 'SettingsEvent.updateTaskCount(count: $count)';
}


}

/// @nodoc
abstract mixin class _$UpdateTaskCountCopyWith<$Res> implements $SettingsEventCopyWith<$Res> {
  factory _$UpdateTaskCountCopyWith(_UpdateTaskCount value, $Res Function(_UpdateTaskCount) _then) = __$UpdateTaskCountCopyWithImpl;
@useResult
$Res call({
 int count
});




}
/// @nodoc
class __$UpdateTaskCountCopyWithImpl<$Res>
    implements _$UpdateTaskCountCopyWith<$Res> {
  __$UpdateTaskCountCopyWithImpl(this._self, this._then);

  final _UpdateTaskCount _self;
  final $Res Function(_UpdateTaskCount) _then;

/// Create a copy of SettingsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? count = null,}) {
  return _then(_UpdateTaskCount(
null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _ToggleUnlimitedRegen implements SettingsEvent {
  const _ToggleUnlimitedRegen(this.value);
  

 final  bool value;

/// Create a copy of SettingsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ToggleUnlimitedRegenCopyWith<_ToggleUnlimitedRegen> get copyWith => __$ToggleUnlimitedRegenCopyWithImpl<_ToggleUnlimitedRegen>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToggleUnlimitedRegen&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'SettingsEvent.toggleUnlimitedRegen(value: $value)';
}


}

/// @nodoc
abstract mixin class _$ToggleUnlimitedRegenCopyWith<$Res> implements $SettingsEventCopyWith<$Res> {
  factory _$ToggleUnlimitedRegenCopyWith(_ToggleUnlimitedRegen value, $Res Function(_ToggleUnlimitedRegen) _then) = __$ToggleUnlimitedRegenCopyWithImpl;
@useResult
$Res call({
 bool value
});




}
/// @nodoc
class __$ToggleUnlimitedRegenCopyWithImpl<$Res>
    implements _$ToggleUnlimitedRegenCopyWith<$Res> {
  __$ToggleUnlimitedRegenCopyWithImpl(this._self, this._then);

  final _ToggleUnlimitedRegen _self;
  final $Res Function(_ToggleUnlimitedRegen) _then;

/// Create a copy of SettingsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(_ToggleUnlimitedRegen(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _ResetData implements SettingsEvent {
  const _ResetData();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResetData);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SettingsEvent.resetData()';
}


}




/// @nodoc


class _SpawnTestNotification implements SettingsEvent {
  const _SpawnTestNotification();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SpawnTestNotification);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SettingsEvent.spawnTestNotification()';
}


}




/// @nodoc
mixin _$SettingsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SettingsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SettingsState()';
}


}

/// @nodoc
class $SettingsStateCopyWith<$Res>  {
$SettingsStateCopyWith(SettingsState _, $Res Function(SettingsState) __);
}


/// Adds pattern-matching-related methods to [SettingsState].
extension SettingsStatePatterns on SettingsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Loading value)?  loading,TResult Function( _Loaded value)?  loaded,TResult Function( _DataReset value)?  dataReset,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _DataReset() when dataReset != null:
return dataReset(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Loading value)  loading,required TResult Function( _Loaded value)  loaded,required TResult Function( _DataReset value)  dataReset,}){
final _that = this;
switch (_that) {
case _Loading():
return loading(_that);case _Loaded():
return loaded(_that);case _DataReset():
return dataReset(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Loading value)?  loading,TResult? Function( _Loaded value)?  loaded,TResult? Function( _DataReset value)?  dataReset,}){
final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _DataReset() when dataReset != null:
return dataReset(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( AppState appState)?  loaded,TResult Function()?  dataReset,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.appState);case _DataReset() when dataReset != null:
return dataReset();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( AppState appState)  loaded,required TResult Function()  dataReset,}) {final _that = this;
switch (_that) {
case _Loading():
return loading();case _Loaded():
return loaded(_that.appState);case _DataReset():
return dataReset();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( AppState appState)?  loaded,TResult? Function()?  dataReset,}) {final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.appState);case _DataReset() when dataReset != null:
return dataReset();case _:
  return null;

}
}

}

/// @nodoc


class _Loading implements SettingsState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SettingsState.loading()';
}


}




/// @nodoc


class _Loaded implements SettingsState {
  const _Loaded({required this.appState});
  

 final  AppState appState;

/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&(identical(other.appState, appState) || other.appState == appState));
}


@override
int get hashCode => Object.hash(runtimeType,appState);

@override
String toString() {
  return 'SettingsState.loaded(appState: $appState)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $SettingsStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 AppState appState
});


$AppStateCopyWith<$Res> get appState;

}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? appState = null,}) {
  return _then(_Loaded(
appState: null == appState ? _self.appState : appState // ignore: cast_nullable_to_non_nullable
as AppState,
  ));
}

/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppStateCopyWith<$Res> get appState {
  
  return $AppStateCopyWith<$Res>(_self.appState, (value) {
    return _then(_self.copyWith(appState: value));
  });
}
}

/// @nodoc


class _DataReset implements SettingsState {
  const _DataReset();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DataReset);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SettingsState.dataReset()';
}


}




// dart format on
