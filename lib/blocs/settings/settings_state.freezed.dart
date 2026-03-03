// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SettingsState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SettingsState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SettingsState()';
  }
}

/// @nodoc
class $SettingsStateCopyWith<$Res> {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SettingsLoading value)? loading,
    TResult Function(SettingsLoaded value)? loaded,
    TResult Function(SettingsDataReset value)? dataReset,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case SettingsLoading() when loading != null:
        return loading(_that);
      case SettingsLoaded() when loaded != null:
        return loaded(_that);
      case SettingsDataReset() when dataReset != null:
        return dataReset(_that);
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
    required TResult Function(SettingsLoading value) loading,
    required TResult Function(SettingsLoaded value) loaded,
    required TResult Function(SettingsDataReset value) dataReset,
  }) {
    final _that = this;
    switch (_that) {
      case SettingsLoading():
        return loading(_that);
      case SettingsLoaded():
        return loaded(_that);
      case SettingsDataReset():
        return dataReset(_that);
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
    TResult? Function(SettingsLoading value)? loading,
    TResult? Function(SettingsLoaded value)? loaded,
    TResult? Function(SettingsDataReset value)? dataReset,
  }) {
    final _that = this;
    switch (_that) {
      case SettingsLoading() when loading != null:
        return loading(_that);
      case SettingsLoaded() when loaded != null:
        return loaded(_that);
      case SettingsDataReset() when dataReset != null:
        return dataReset(_that);
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
    TResult Function()? loading,
    TResult Function(String goals, int frequencyHours, int taskCount,
            bool unlimitedRegen)?
        loaded,
    TResult Function()? dataReset,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case SettingsLoading() when loading != null:
        return loading();
      case SettingsLoaded() when loaded != null:
        return loaded(_that.goals, _that.frequencyHours, _that.taskCount,
            _that.unlimitedRegen);
      case SettingsDataReset() when dataReset != null:
        return dataReset();
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
    required TResult Function() loading,
    required TResult Function(String goals, int frequencyHours, int taskCount,
            bool unlimitedRegen)
        loaded,
    required TResult Function() dataReset,
  }) {
    final _that = this;
    switch (_that) {
      case SettingsLoading():
        return loading();
      case SettingsLoaded():
        return loaded(_that.goals, _that.frequencyHours, _that.taskCount,
            _that.unlimitedRegen);
      case SettingsDataReset():
        return dataReset();
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
    TResult? Function()? loading,
    TResult? Function(String goals, int frequencyHours, int taskCount,
            bool unlimitedRegen)?
        loaded,
    TResult? Function()? dataReset,
  }) {
    final _that = this;
    switch (_that) {
      case SettingsLoading() when loading != null:
        return loading();
      case SettingsLoaded() when loaded != null:
        return loaded(_that.goals, _that.frequencyHours, _that.taskCount,
            _that.unlimitedRegen);
      case SettingsDataReset() when dataReset != null:
        return dataReset();
      case _:
        return null;
    }
  }
}

/// @nodoc

class SettingsLoading implements SettingsState {
  const SettingsLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SettingsLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SettingsState.loading()';
  }
}

/// @nodoc

class SettingsLoaded implements SettingsState {
  const SettingsLoaded(
      {required this.goals,
      required this.frequencyHours,
      required this.taskCount,
      required this.unlimitedRegen});

  final String goals;
  final int frequencyHours;
  final int taskCount;
  final bool unlimitedRegen;

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SettingsLoadedCopyWith<SettingsLoaded> get copyWith =>
      _$SettingsLoadedCopyWithImpl<SettingsLoaded>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SettingsLoaded &&
            (identical(other.goals, goals) || other.goals == goals) &&
            (identical(other.frequencyHours, frequencyHours) ||
                other.frequencyHours == frequencyHours) &&
            (identical(other.taskCount, taskCount) ||
                other.taskCount == taskCount) &&
            (identical(other.unlimitedRegen, unlimitedRegen) ||
                other.unlimitedRegen == unlimitedRegen));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, goals, frequencyHours, taskCount, unlimitedRegen);

  @override
  String toString() {
    return 'SettingsState.loaded(goals: $goals, frequencyHours: $frequencyHours, taskCount: $taskCount, unlimitedRegen: $unlimitedRegen)';
  }
}

/// @nodoc
abstract mixin class $SettingsLoadedCopyWith<$Res>
    implements $SettingsStateCopyWith<$Res> {
  factory $SettingsLoadedCopyWith(
          SettingsLoaded value, $Res Function(SettingsLoaded) _then) =
      _$SettingsLoadedCopyWithImpl;
  @useResult
  $Res call(
      {String goals, int frequencyHours, int taskCount, bool unlimitedRegen});
}

/// @nodoc
class _$SettingsLoadedCopyWithImpl<$Res>
    implements $SettingsLoadedCopyWith<$Res> {
  _$SettingsLoadedCopyWithImpl(this._self, this._then);

  final SettingsLoaded _self;
  final $Res Function(SettingsLoaded) _then;

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? goals = null,
    Object? frequencyHours = null,
    Object? taskCount = null,
    Object? unlimitedRegen = null,
  }) {
    return _then(SettingsLoaded(
      goals: null == goals
          ? _self.goals
          : goals // ignore: cast_nullable_to_non_nullable
              as String,
      frequencyHours: null == frequencyHours
          ? _self.frequencyHours
          : frequencyHours // ignore: cast_nullable_to_non_nullable
              as int,
      taskCount: null == taskCount
          ? _self.taskCount
          : taskCount // ignore: cast_nullable_to_non_nullable
              as int,
      unlimitedRegen: null == unlimitedRegen
          ? _self.unlimitedRegen
          : unlimitedRegen // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class SettingsDataReset implements SettingsState {
  const SettingsDataReset();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SettingsDataReset);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SettingsState.dataReset()';
  }
}

// dart format on
