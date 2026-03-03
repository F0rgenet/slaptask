// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppState {

 String? get goals; List<DayTasks> get days; int get taskCount; int get frequencyHours; bool get unlimitedRegen;
/// Create a copy of AppState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppStateCopyWith<AppState> get copyWith => _$AppStateCopyWithImpl<AppState>(this as AppState, _$identity);

  /// Serializes this AppState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppState&&(identical(other.goals, goals) || other.goals == goals)&&const DeepCollectionEquality().equals(other.days, days)&&(identical(other.taskCount, taskCount) || other.taskCount == taskCount)&&(identical(other.frequencyHours, frequencyHours) || other.frequencyHours == frequencyHours)&&(identical(other.unlimitedRegen, unlimitedRegen) || other.unlimitedRegen == unlimitedRegen));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,goals,const DeepCollectionEquality().hash(days),taskCount,frequencyHours,unlimitedRegen);

@override
String toString() {
  return 'AppState(goals: $goals, days: $days, taskCount: $taskCount, frequencyHours: $frequencyHours, unlimitedRegen: $unlimitedRegen)';
}


}

/// @nodoc
abstract mixin class $AppStateCopyWith<$Res>  {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) _then) = _$AppStateCopyWithImpl;
@useResult
$Res call({
 String? goals, List<DayTasks> days, int taskCount, int frequencyHours, bool unlimitedRegen
});




}
/// @nodoc
class _$AppStateCopyWithImpl<$Res>
    implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._self, this._then);

  final AppState _self;
  final $Res Function(AppState) _then;

/// Create a copy of AppState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? goals = freezed,Object? days = null,Object? taskCount = null,Object? frequencyHours = null,Object? unlimitedRegen = null,}) {
  return _then(_self.copyWith(
goals: freezed == goals ? _self.goals : goals // ignore: cast_nullable_to_non_nullable
as String?,days: null == days ? _self.days : days // ignore: cast_nullable_to_non_nullable
as List<DayTasks>,taskCount: null == taskCount ? _self.taskCount : taskCount // ignore: cast_nullable_to_non_nullable
as int,frequencyHours: null == frequencyHours ? _self.frequencyHours : frequencyHours // ignore: cast_nullable_to_non_nullable
as int,unlimitedRegen: null == unlimitedRegen ? _self.unlimitedRegen : unlimitedRegen // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AppState].
extension AppStatePatterns on AppState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppState value)  $default,){
final _that = this;
switch (_that) {
case _AppState():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppState value)?  $default,){
final _that = this;
switch (_that) {
case _AppState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? goals,  List<DayTasks> days,  int taskCount,  int frequencyHours,  bool unlimitedRegen)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppState() when $default != null:
return $default(_that.goals,_that.days,_that.taskCount,_that.frequencyHours,_that.unlimitedRegen);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? goals,  List<DayTasks> days,  int taskCount,  int frequencyHours,  bool unlimitedRegen)  $default,) {final _that = this;
switch (_that) {
case _AppState():
return $default(_that.goals,_that.days,_that.taskCount,_that.frequencyHours,_that.unlimitedRegen);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? goals,  List<DayTasks> days,  int taskCount,  int frequencyHours,  bool unlimitedRegen)?  $default,) {final _that = this;
switch (_that) {
case _AppState() when $default != null:
return $default(_that.goals,_that.days,_that.taskCount,_that.frequencyHours,_that.unlimitedRegen);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppState implements AppState {
  const _AppState({this.goals, final  List<DayTasks> days = const [], this.taskCount = 5, this.frequencyHours = 24, this.unlimitedRegen = false}): _days = days;
  factory _AppState.fromJson(Map<String, dynamic> json) => _$AppStateFromJson(json);

@override final  String? goals;
 final  List<DayTasks> _days;
@override@JsonKey() List<DayTasks> get days {
  if (_days is EqualUnmodifiableListView) return _days;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_days);
}

@override@JsonKey() final  int taskCount;
@override@JsonKey() final  int frequencyHours;
@override@JsonKey() final  bool unlimitedRegen;

/// Create a copy of AppState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppStateCopyWith<_AppState> get copyWith => __$AppStateCopyWithImpl<_AppState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppState&&(identical(other.goals, goals) || other.goals == goals)&&const DeepCollectionEquality().equals(other._days, _days)&&(identical(other.taskCount, taskCount) || other.taskCount == taskCount)&&(identical(other.frequencyHours, frequencyHours) || other.frequencyHours == frequencyHours)&&(identical(other.unlimitedRegen, unlimitedRegen) || other.unlimitedRegen == unlimitedRegen));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,goals,const DeepCollectionEquality().hash(_days),taskCount,frequencyHours,unlimitedRegen);

@override
String toString() {
  return 'AppState(goals: $goals, days: $days, taskCount: $taskCount, frequencyHours: $frequencyHours, unlimitedRegen: $unlimitedRegen)';
}


}

/// @nodoc
abstract mixin class _$AppStateCopyWith<$Res> implements $AppStateCopyWith<$Res> {
  factory _$AppStateCopyWith(_AppState value, $Res Function(_AppState) _then) = __$AppStateCopyWithImpl;
@override @useResult
$Res call({
 String? goals, List<DayTasks> days, int taskCount, int frequencyHours, bool unlimitedRegen
});




}
/// @nodoc
class __$AppStateCopyWithImpl<$Res>
    implements _$AppStateCopyWith<$Res> {
  __$AppStateCopyWithImpl(this._self, this._then);

  final _AppState _self;
  final $Res Function(_AppState) _then;

/// Create a copy of AppState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? goals = freezed,Object? days = null,Object? taskCount = null,Object? frequencyHours = null,Object? unlimitedRegen = null,}) {
  return _then(_AppState(
goals: freezed == goals ? _self.goals : goals // ignore: cast_nullable_to_non_nullable
as String?,days: null == days ? _self._days : days // ignore: cast_nullable_to_non_nullable
as List<DayTasks>,taskCount: null == taskCount ? _self.taskCount : taskCount // ignore: cast_nullable_to_non_nullable
as int,frequencyHours: null == frequencyHours ? _self.frequencyHours : frequencyHours // ignore: cast_nullable_to_non_nullable
as int,unlimitedRegen: null == unlimitedRegen ? _self.unlimitedRegen : unlimitedRegen // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
