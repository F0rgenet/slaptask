// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppSettings {

@HiveField(0) String? get goals;@HiveField(1) int get taskCount;@HiveField(2) int get frequencyHours;@HiveField(3) bool get unlimitedRegen;
/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppSettingsCopyWith<AppSettings> get copyWith => _$AppSettingsCopyWithImpl<AppSettings>(this as AppSettings, _$identity);

  /// Serializes this AppSettings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppSettings&&(identical(other.goals, goals) || other.goals == goals)&&(identical(other.taskCount, taskCount) || other.taskCount == taskCount)&&(identical(other.frequencyHours, frequencyHours) || other.frequencyHours == frequencyHours)&&(identical(other.unlimitedRegen, unlimitedRegen) || other.unlimitedRegen == unlimitedRegen));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,goals,taskCount,frequencyHours,unlimitedRegen);

@override
String toString() {
  return 'AppSettings(goals: $goals, taskCount: $taskCount, frequencyHours: $frequencyHours, unlimitedRegen: $unlimitedRegen)';
}


}

/// @nodoc
abstract mixin class $AppSettingsCopyWith<$Res>  {
  factory $AppSettingsCopyWith(AppSettings value, $Res Function(AppSettings) _then) = _$AppSettingsCopyWithImpl;
@useResult
$Res call({
@HiveField(0) String? goals,@HiveField(1) int taskCount,@HiveField(2) int frequencyHours,@HiveField(3) bool unlimitedRegen
});




}
/// @nodoc
class _$AppSettingsCopyWithImpl<$Res>
    implements $AppSettingsCopyWith<$Res> {
  _$AppSettingsCopyWithImpl(this._self, this._then);

  final AppSettings _self;
  final $Res Function(AppSettings) _then;

/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? goals = freezed,Object? taskCount = null,Object? frequencyHours = null,Object? unlimitedRegen = null,}) {
  return _then(_self.copyWith(
goals: freezed == goals ? _self.goals : goals // ignore: cast_nullable_to_non_nullable
as String?,taskCount: null == taskCount ? _self.taskCount : taskCount // ignore: cast_nullable_to_non_nullable
as int,frequencyHours: null == frequencyHours ? _self.frequencyHours : frequencyHours // ignore: cast_nullable_to_non_nullable
as int,unlimitedRegen: null == unlimitedRegen ? _self.unlimitedRegen : unlimitedRegen // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AppSettings].
extension AppSettingsPatterns on AppSettings {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppSettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppSettings() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppSettings value)  $default,){
final _that = this;
switch (_that) {
case _AppSettings():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppSettings value)?  $default,){
final _that = this;
switch (_that) {
case _AppSettings() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@HiveField(0)  String? goals, @HiveField(1)  int taskCount, @HiveField(2)  int frequencyHours, @HiveField(3)  bool unlimitedRegen)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppSettings() when $default != null:
return $default(_that.goals,_that.taskCount,_that.frequencyHours,_that.unlimitedRegen);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@HiveField(0)  String? goals, @HiveField(1)  int taskCount, @HiveField(2)  int frequencyHours, @HiveField(3)  bool unlimitedRegen)  $default,) {final _that = this;
switch (_that) {
case _AppSettings():
return $default(_that.goals,_that.taskCount,_that.frequencyHours,_that.unlimitedRegen);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@HiveField(0)  String? goals, @HiveField(1)  int taskCount, @HiveField(2)  int frequencyHours, @HiveField(3)  bool unlimitedRegen)?  $default,) {final _that = this;
switch (_that) {
case _AppSettings() when $default != null:
return $default(_that.goals,_that.taskCount,_that.frequencyHours,_that.unlimitedRegen);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppSettings implements AppSettings {
   _AppSettings({@HiveField(0) this.goals, @HiveField(1) this.taskCount = 5, @HiveField(2) this.frequencyHours = 24, @HiveField(3) this.unlimitedRegen = false});
  factory _AppSettings.fromJson(Map<String, dynamic> json) => _$AppSettingsFromJson(json);

@override@HiveField(0) final  String? goals;
@override@JsonKey()@HiveField(1) final  int taskCount;
@override@JsonKey()@HiveField(2) final  int frequencyHours;
@override@JsonKey()@HiveField(3) final  bool unlimitedRegen;

/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppSettingsCopyWith<_AppSettings> get copyWith => __$AppSettingsCopyWithImpl<_AppSettings>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppSettingsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppSettings&&(identical(other.goals, goals) || other.goals == goals)&&(identical(other.taskCount, taskCount) || other.taskCount == taskCount)&&(identical(other.frequencyHours, frequencyHours) || other.frequencyHours == frequencyHours)&&(identical(other.unlimitedRegen, unlimitedRegen) || other.unlimitedRegen == unlimitedRegen));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,goals,taskCount,frequencyHours,unlimitedRegen);

@override
String toString() {
  return 'AppSettings(goals: $goals, taskCount: $taskCount, frequencyHours: $frequencyHours, unlimitedRegen: $unlimitedRegen)';
}


}

/// @nodoc
abstract mixin class _$AppSettingsCopyWith<$Res> implements $AppSettingsCopyWith<$Res> {
  factory _$AppSettingsCopyWith(_AppSettings value, $Res Function(_AppSettings) _then) = __$AppSettingsCopyWithImpl;
@override @useResult
$Res call({
@HiveField(0) String? goals,@HiveField(1) int taskCount,@HiveField(2) int frequencyHours,@HiveField(3) bool unlimitedRegen
});




}
/// @nodoc
class __$AppSettingsCopyWithImpl<$Res>
    implements _$AppSettingsCopyWith<$Res> {
  __$AppSettingsCopyWithImpl(this._self, this._then);

  final _AppSettings _self;
  final $Res Function(_AppSettings) _then;

/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? goals = freezed,Object? taskCount = null,Object? frequencyHours = null,Object? unlimitedRegen = null,}) {
  return _then(_AppSettings(
goals: freezed == goals ? _self.goals : goals // ignore: cast_nullable_to_non_nullable
as String?,taskCount: null == taskCount ? _self.taskCount : taskCount // ignore: cast_nullable_to_non_nullable
as int,frequencyHours: null == frequencyHours ? _self.frequencyHours : frequencyHours // ignore: cast_nullable_to_non_nullable
as int,unlimitedRegen: null == unlimitedRegen ? _self.unlimitedRegen : unlimitedRegen // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
