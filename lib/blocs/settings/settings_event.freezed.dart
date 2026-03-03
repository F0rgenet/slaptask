// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SettingsEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SettingsEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SettingsEvent()';
  }
}

/// @nodoc
class $SettingsEventCopyWith<$Res> {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SettingsLoad value)? load,
    TResult Function(SettingsUpdateGoals value)? updateGoals,
    TResult Function(SettingsUpdateFrequency value)? updateFrequency,
    TResult Function(SettingsUpdateTaskCount value)? updateTaskCount,
    TResult Function(SettingsToggleUnlimitedRegen value)? toggleUnlimitedRegen,
    TResult Function(SettingsResetData value)? resetData,
    TResult Function(SettingsSpawnTestNotification value)?
        spawnTestNotification,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case SettingsLoad() when load != null:
        return load(_that);
      case SettingsUpdateGoals() when updateGoals != null:
        return updateGoals(_that);
      case SettingsUpdateFrequency() when updateFrequency != null:
        return updateFrequency(_that);
      case SettingsUpdateTaskCount() when updateTaskCount != null:
        return updateTaskCount(_that);
      case SettingsToggleUnlimitedRegen() when toggleUnlimitedRegen != null:
        return toggleUnlimitedRegen(_that);
      case SettingsResetData() when resetData != null:
        return resetData(_that);
      case SettingsSpawnTestNotification() when spawnTestNotification != null:
        return spawnTestNotification(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SettingsLoad value) load,
    required TResult Function(SettingsUpdateGoals value) updateGoals,
    required TResult Function(SettingsUpdateFrequency value) updateFrequency,
    required TResult Function(SettingsUpdateTaskCount value) updateTaskCount,
    required TResult Function(SettingsToggleUnlimitedRegen value)
        toggleUnlimitedRegen,
    required TResult Function(SettingsResetData value) resetData,
    required TResult Function(SettingsSpawnTestNotification value)
        spawnTestNotification,
  }) {
    final _that = this;
    switch (_that) {
      case SettingsLoad():
        return load(_that);
      case SettingsUpdateGoals():
        return updateGoals(_that);
      case SettingsUpdateFrequency():
        return updateFrequency(_that);
      case SettingsUpdateTaskCount():
        return updateTaskCount(_that);
      case SettingsToggleUnlimitedRegen():
        return toggleUnlimitedRegen(_that);
      case SettingsResetData():
        return resetData(_that);
      case SettingsSpawnTestNotification():
        return spawnTestNotification(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SettingsLoad value)? load,
    TResult? Function(SettingsUpdateGoals value)? updateGoals,
    TResult? Function(SettingsUpdateFrequency value)? updateFrequency,
    TResult? Function(SettingsUpdateTaskCount value)? updateTaskCount,
    TResult? Function(SettingsToggleUnlimitedRegen value)? toggleUnlimitedRegen,
    TResult? Function(SettingsResetData value)? resetData,
    TResult? Function(SettingsSpawnTestNotification value)?
        spawnTestNotification,
  }) {
    final _that = this;
    switch (_that) {
      case SettingsLoad() when load != null:
        return load(_that);
      case SettingsUpdateGoals() when updateGoals != null:
        return updateGoals(_that);
      case SettingsUpdateFrequency() when updateFrequency != null:
        return updateFrequency(_that);
      case SettingsUpdateTaskCount() when updateTaskCount != null:
        return updateTaskCount(_that);
      case SettingsToggleUnlimitedRegen() when toggleUnlimitedRegen != null:
        return toggleUnlimitedRegen(_that);
      case SettingsResetData() when resetData != null:
        return resetData(_that);
      case SettingsSpawnTestNotification() when spawnTestNotification != null:
        return spawnTestNotification(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(String goals)? updateGoals,
    TResult Function(int hours)? updateFrequency,
    TResult Function(int count)? updateTaskCount,
    TResult Function(bool value)? toggleUnlimitedRegen,
    TResult Function()? resetData,
    TResult Function()? spawnTestNotification,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case SettingsLoad() when load != null:
        return load();
      case SettingsUpdateGoals() when updateGoals != null:
        return updateGoals(_that.goals);
      case SettingsUpdateFrequency() when updateFrequency != null:
        return updateFrequency(_that.hours);
      case SettingsUpdateTaskCount() when updateTaskCount != null:
        return updateTaskCount(_that.count);
      case SettingsToggleUnlimitedRegen() when toggleUnlimitedRegen != null:
        return toggleUnlimitedRegen(_that.value);
      case SettingsResetData() when resetData != null:
        return resetData();
      case SettingsSpawnTestNotification() when spawnTestNotification != null:
        return spawnTestNotification();
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function(String goals) updateGoals,
    required TResult Function(int hours) updateFrequency,
    required TResult Function(int count) updateTaskCount,
    required TResult Function(bool value) toggleUnlimitedRegen,
    required TResult Function() resetData,
    required TResult Function() spawnTestNotification,
  }) {
    final _that = this;
    switch (_that) {
      case SettingsLoad():
        return load();
      case SettingsUpdateGoals():
        return updateGoals(_that.goals);
      case SettingsUpdateFrequency():
        return updateFrequency(_that.hours);
      case SettingsUpdateTaskCount():
        return updateTaskCount(_that.count);
      case SettingsToggleUnlimitedRegen():
        return toggleUnlimitedRegen(_that.value);
      case SettingsResetData():
        return resetData();
      case SettingsSpawnTestNotification():
        return spawnTestNotification();
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function(String goals)? updateGoals,
    TResult? Function(int hours)? updateFrequency,
    TResult? Function(int count)? updateTaskCount,
    TResult? Function(bool value)? toggleUnlimitedRegen,
    TResult? Function()? resetData,
    TResult? Function()? spawnTestNotification,
  }) {
    final _that = this;
    switch (_that) {
      case SettingsLoad() when load != null:
        return load();
      case SettingsUpdateGoals() when updateGoals != null:
        return updateGoals(_that.goals);
      case SettingsUpdateFrequency() when updateFrequency != null:
        return updateFrequency(_that.hours);
      case SettingsUpdateTaskCount() when updateTaskCount != null:
        return updateTaskCount(_that.count);
      case SettingsToggleUnlimitedRegen() when toggleUnlimitedRegen != null:
        return toggleUnlimitedRegen(_that.value);
      case SettingsResetData() when resetData != null:
        return resetData();
      case SettingsSpawnTestNotification() when spawnTestNotification != null:
        return spawnTestNotification();
      case _:
        return null;
    }
  }
}

/// @nodoc

class SettingsLoad implements SettingsEvent {
  const SettingsLoad();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SettingsLoad);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SettingsEvent.load()';
  }
}

/// @nodoc

class SettingsUpdateGoals implements SettingsEvent {
  const SettingsUpdateGoals(this.goals);

  final String goals;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SettingsUpdateGoalsCopyWith<SettingsUpdateGoals> get copyWith =>
      _$SettingsUpdateGoalsCopyWithImpl<SettingsUpdateGoals>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SettingsUpdateGoals &&
            (identical(other.goals, goals) || other.goals == goals));
  }

  @override
  int get hashCode => Object.hash(runtimeType, goals);

  @override
  String toString() {
    return 'SettingsEvent.updateGoals(goals: $goals)';
  }
}

/// @nodoc
abstract mixin class $SettingsUpdateGoalsCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $SettingsUpdateGoalsCopyWith(
          SettingsUpdateGoals value, $Res Function(SettingsUpdateGoals) _then) =
      _$SettingsUpdateGoalsCopyWithImpl;
  @useResult
  $Res call({String goals});
}

/// @nodoc
class _$SettingsUpdateGoalsCopyWithImpl<$Res>
    implements $SettingsUpdateGoalsCopyWith<$Res> {
  _$SettingsUpdateGoalsCopyWithImpl(this._self, this._then);

  final SettingsUpdateGoals _self;
  final $Res Function(SettingsUpdateGoals) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? goals = null,
  }) {
    return _then(SettingsUpdateGoals(
      null == goals
          ? _self.goals
          : goals // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class SettingsUpdateFrequency implements SettingsEvent {
  const SettingsUpdateFrequency(this.hours);

  final int hours;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SettingsUpdateFrequencyCopyWith<SettingsUpdateFrequency> get copyWith =>
      _$SettingsUpdateFrequencyCopyWithImpl<SettingsUpdateFrequency>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SettingsUpdateFrequency &&
            (identical(other.hours, hours) || other.hours == hours));
  }

  @override
  int get hashCode => Object.hash(runtimeType, hours);

  @override
  String toString() {
    return 'SettingsEvent.updateFrequency(hours: $hours)';
  }
}

/// @nodoc
abstract mixin class $SettingsUpdateFrequencyCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $SettingsUpdateFrequencyCopyWith(SettingsUpdateFrequency value,
          $Res Function(SettingsUpdateFrequency) _then) =
      _$SettingsUpdateFrequencyCopyWithImpl;
  @useResult
  $Res call({int hours});
}

/// @nodoc
class _$SettingsUpdateFrequencyCopyWithImpl<$Res>
    implements $SettingsUpdateFrequencyCopyWith<$Res> {
  _$SettingsUpdateFrequencyCopyWithImpl(this._self, this._then);

  final SettingsUpdateFrequency _self;
  final $Res Function(SettingsUpdateFrequency) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? hours = null,
  }) {
    return _then(SettingsUpdateFrequency(
      null == hours
          ? _self.hours
          : hours // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class SettingsUpdateTaskCount implements SettingsEvent {
  const SettingsUpdateTaskCount(this.count);

  final int count;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SettingsUpdateTaskCountCopyWith<SettingsUpdateTaskCount> get copyWith =>
      _$SettingsUpdateTaskCountCopyWithImpl<SettingsUpdateTaskCount>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SettingsUpdateTaskCount &&
            (identical(other.count, count) || other.count == count));
  }

  @override
  int get hashCode => Object.hash(runtimeType, count);

  @override
  String toString() {
    return 'SettingsEvent.updateTaskCount(count: $count)';
  }
}

/// @nodoc
abstract mixin class $SettingsUpdateTaskCountCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $SettingsUpdateTaskCountCopyWith(SettingsUpdateTaskCount value,
          $Res Function(SettingsUpdateTaskCount) _then) =
      _$SettingsUpdateTaskCountCopyWithImpl;
  @useResult
  $Res call({int count});
}

/// @nodoc
class _$SettingsUpdateTaskCountCopyWithImpl<$Res>
    implements $SettingsUpdateTaskCountCopyWith<$Res> {
  _$SettingsUpdateTaskCountCopyWithImpl(this._self, this._then);

  final SettingsUpdateTaskCount _self;
  final $Res Function(SettingsUpdateTaskCount) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? count = null,
  }) {
    return _then(SettingsUpdateTaskCount(
      null == count
          ? _self.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class SettingsToggleUnlimitedRegen implements SettingsEvent {
  const SettingsToggleUnlimitedRegen(this.value);

  final bool value;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SettingsToggleUnlimitedRegenCopyWith<SettingsToggleUnlimitedRegen>
      get copyWith => _$SettingsToggleUnlimitedRegenCopyWithImpl<
          SettingsToggleUnlimitedRegen>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SettingsToggleUnlimitedRegen &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @override
  String toString() {
    return 'SettingsEvent.toggleUnlimitedRegen(value: $value)';
  }
}

/// @nodoc
abstract mixin class $SettingsToggleUnlimitedRegenCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $SettingsToggleUnlimitedRegenCopyWith(
          SettingsToggleUnlimitedRegen value,
          $Res Function(SettingsToggleUnlimitedRegen) _then) =
      _$SettingsToggleUnlimitedRegenCopyWithImpl;
  @useResult
  $Res call({bool value});
}

/// @nodoc
class _$SettingsToggleUnlimitedRegenCopyWithImpl<$Res>
    implements $SettingsToggleUnlimitedRegenCopyWith<$Res> {
  _$SettingsToggleUnlimitedRegenCopyWithImpl(this._self, this._then);

  final SettingsToggleUnlimitedRegen _self;
  final $Res Function(SettingsToggleUnlimitedRegen) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? value = null,
  }) {
    return _then(SettingsToggleUnlimitedRegen(
      null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class SettingsResetData implements SettingsEvent {
  const SettingsResetData();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SettingsResetData);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SettingsEvent.resetData()';
  }
}

/// @nodoc

class SettingsSpawnTestNotification implements SettingsEvent {
  const SettingsSpawnTestNotification();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SettingsSpawnTestNotification);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SettingsEvent.spawnTestNotification()';
  }
}

// dart format on
