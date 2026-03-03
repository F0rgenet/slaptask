// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'day_tasks.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DayTasks {

@HiveField(0) String get date;@HiveField(1) List<Task> get tasks;@HiveField(2) bool get regenerated;
/// Create a copy of DayTasks
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DayTasksCopyWith<DayTasks> get copyWith => _$DayTasksCopyWithImpl<DayTasks>(this as DayTasks, _$identity);

  /// Serializes this DayTasks to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DayTasks&&(identical(other.date, date) || other.date == date)&&const DeepCollectionEquality().equals(other.tasks, tasks)&&(identical(other.regenerated, regenerated) || other.regenerated == regenerated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,const DeepCollectionEquality().hash(tasks),regenerated);

@override
String toString() {
  return 'DayTasks(date: $date, tasks: $tasks, regenerated: $regenerated)';
}


}

/// @nodoc
abstract mixin class $DayTasksCopyWith<$Res>  {
  factory $DayTasksCopyWith(DayTasks value, $Res Function(DayTasks) _then) = _$DayTasksCopyWithImpl;
@useResult
$Res call({
@HiveField(0) String date,@HiveField(1) List<Task> tasks,@HiveField(2) bool regenerated
});




}
/// @nodoc
class _$DayTasksCopyWithImpl<$Res>
    implements $DayTasksCopyWith<$Res> {
  _$DayTasksCopyWithImpl(this._self, this._then);

  final DayTasks _self;
  final $Res Function(DayTasks) _then;

/// Create a copy of DayTasks
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? tasks = null,Object? regenerated = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,tasks: null == tasks ? _self.tasks : tasks // ignore: cast_nullable_to_non_nullable
as List<Task>,regenerated: null == regenerated ? _self.regenerated : regenerated // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [DayTasks].
extension DayTasksPatterns on DayTasks {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DayTasks value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DayTasks() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DayTasks value)  $default,){
final _that = this;
switch (_that) {
case _DayTasks():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DayTasks value)?  $default,){
final _that = this;
switch (_that) {
case _DayTasks() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@HiveField(0)  String date, @HiveField(1)  List<Task> tasks, @HiveField(2)  bool regenerated)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DayTasks() when $default != null:
return $default(_that.date,_that.tasks,_that.regenerated);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@HiveField(0)  String date, @HiveField(1)  List<Task> tasks, @HiveField(2)  bool regenerated)  $default,) {final _that = this;
switch (_that) {
case _DayTasks():
return $default(_that.date,_that.tasks,_that.regenerated);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@HiveField(0)  String date, @HiveField(1)  List<Task> tasks, @HiveField(2)  bool regenerated)?  $default,) {final _that = this;
switch (_that) {
case _DayTasks() when $default != null:
return $default(_that.date,_that.tasks,_that.regenerated);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DayTasks extends DayTasks {
   _DayTasks({@HiveField(0) required this.date, @HiveField(1) required final  List<Task> tasks, @HiveField(2) this.regenerated = false}): _tasks = tasks,super._();
  factory _DayTasks.fromJson(Map<String, dynamic> json) => _$DayTasksFromJson(json);

@override@HiveField(0) final  String date;
 final  List<Task> _tasks;
@override@HiveField(1) List<Task> get tasks {
  if (_tasks is EqualUnmodifiableListView) return _tasks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tasks);
}

@override@JsonKey()@HiveField(2) final  bool regenerated;

/// Create a copy of DayTasks
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DayTasksCopyWith<_DayTasks> get copyWith => __$DayTasksCopyWithImpl<_DayTasks>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DayTasksToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DayTasks&&(identical(other.date, date) || other.date == date)&&const DeepCollectionEquality().equals(other._tasks, _tasks)&&(identical(other.regenerated, regenerated) || other.regenerated == regenerated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,const DeepCollectionEquality().hash(_tasks),regenerated);

@override
String toString() {
  return 'DayTasks(date: $date, tasks: $tasks, regenerated: $regenerated)';
}


}

/// @nodoc
abstract mixin class _$DayTasksCopyWith<$Res> implements $DayTasksCopyWith<$Res> {
  factory _$DayTasksCopyWith(_DayTasks value, $Res Function(_DayTasks) _then) = __$DayTasksCopyWithImpl;
@override @useResult
$Res call({
@HiveField(0) String date,@HiveField(1) List<Task> tasks,@HiveField(2) bool regenerated
});




}
/// @nodoc
class __$DayTasksCopyWithImpl<$Res>
    implements _$DayTasksCopyWith<$Res> {
  __$DayTasksCopyWithImpl(this._self, this._then);

  final _DayTasks _self;
  final $Res Function(_DayTasks) _then;

/// Create a copy of DayTasks
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? tasks = null,Object? regenerated = null,}) {
  return _then(_DayTasks(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,tasks: null == tasks ? _self._tasks : tasks // ignore: cast_nullable_to_non_nullable
as List<Task>,regenerated: null == regenerated ? _self.regenerated : regenerated // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
