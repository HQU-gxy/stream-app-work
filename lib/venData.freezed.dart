// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'venData.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$VenData {
  String get mac1 => throw _privateConstructorUsedError;
  String get mac2 => throw _privateConstructorUsedError;
  double get speed => throw _privateConstructorUsedError; // speed per second
  double get distance => throw _privateConstructorUsedError;
  int get angle => throw _privateConstructorUsedError; // alias openControl
  bool get isVentOn => throw _privateConstructorUsedError;
  int get mode => throw _privateConstructorUsedError;
  bool get isLightOpen => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VenDataCopyWith<VenData> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VenDataCopyWith<$Res> {
  factory $VenDataCopyWith(VenData value, $Res Function(VenData) then) =
      _$VenDataCopyWithImpl<$Res, VenData>;
  @useResult
  $Res call(
      {String mac1,
      String mac2,
      double speed,
      double distance,
      int angle,
      bool isVentOn,
      int mode,
      bool isLightOpen});
}

/// @nodoc
class _$VenDataCopyWithImpl<$Res, $Val extends VenData>
    implements $VenDataCopyWith<$Res> {
  _$VenDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mac1 = null,
    Object? mac2 = null,
    Object? speed = null,
    Object? distance = null,
    Object? angle = null,
    Object? isVentOn = null,
    Object? mode = null,
    Object? isLightOpen = null,
  }) {
    return _then(_value.copyWith(
      mac1: null == mac1
          ? _value.mac1
          : mac1 // ignore: cast_nullable_to_non_nullable
              as String,
      mac2: null == mac2
          ? _value.mac2
          : mac2 // ignore: cast_nullable_to_non_nullable
              as String,
      speed: null == speed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as double,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
      angle: null == angle
          ? _value.angle
          : angle // ignore: cast_nullable_to_non_nullable
              as int,
      isVentOn: null == isVentOn
          ? _value.isVentOn
          : isVentOn // ignore: cast_nullable_to_non_nullable
              as bool,
      mode: null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as int,
      isLightOpen: null == isLightOpen
          ? _value.isLightOpen
          : isLightOpen // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_VenDataCopyWith<$Res> implements $VenDataCopyWith<$Res> {
  factory _$$_VenDataCopyWith(
          _$_VenData value, $Res Function(_$_VenData) then) =
      __$$_VenDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String mac1,
      String mac2,
      double speed,
      double distance,
      int angle,
      bool isVentOn,
      int mode,
      bool isLightOpen});
}

/// @nodoc
class __$$_VenDataCopyWithImpl<$Res>
    extends _$VenDataCopyWithImpl<$Res, _$_VenData>
    implements _$$_VenDataCopyWith<$Res> {
  __$$_VenDataCopyWithImpl(_$_VenData _value, $Res Function(_$_VenData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mac1 = null,
    Object? mac2 = null,
    Object? speed = null,
    Object? distance = null,
    Object? angle = null,
    Object? isVentOn = null,
    Object? mode = null,
    Object? isLightOpen = null,
  }) {
    return _then(_$_VenData(
      mac1: null == mac1
          ? _value.mac1
          : mac1 // ignore: cast_nullable_to_non_nullable
              as String,
      mac2: null == mac2
          ? _value.mac2
          : mac2 // ignore: cast_nullable_to_non_nullable
              as String,
      speed: null == speed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as double,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
      angle: null == angle
          ? _value.angle
          : angle // ignore: cast_nullable_to_non_nullable
              as int,
      isVentOn: null == isVentOn
          ? _value.isVentOn
          : isVentOn // ignore: cast_nullable_to_non_nullable
              as bool,
      mode: null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as int,
      isLightOpen: null == isLightOpen
          ? _value.isLightOpen
          : isLightOpen // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_VenData extends _VenData {
  const _$_VenData(
      {required this.mac1,
      required this.mac2,
      required this.speed,
      required this.distance,
      required this.angle,
      required this.isVentOn,
      required this.mode,
      required this.isLightOpen})
      : super._();

  @override
  final String mac1;
  @override
  final String mac2;
  @override
  final double speed;
// speed per second
  @override
  final double distance;
  @override
  final int angle;
// alias openControl
  @override
  final bool isVentOn;
  @override
  final int mode;
  @override
  final bool isLightOpen;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VenData &&
            (identical(other.mac1, mac1) || other.mac1 == mac1) &&
            (identical(other.mac2, mac2) || other.mac2 == mac2) &&
            (identical(other.speed, speed) || other.speed == speed) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.angle, angle) || other.angle == angle) &&
            (identical(other.isVentOn, isVentOn) ||
                other.isVentOn == isVentOn) &&
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.isLightOpen, isLightOpen) ||
                other.isLightOpen == isLightOpen));
  }

  @override
  int get hashCode => Object.hash(runtimeType, mac1, mac2, speed, distance,
      angle, isVentOn, mode, isLightOpen);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VenDataCopyWith<_$_VenData> get copyWith =>
      __$$_VenDataCopyWithImpl<_$_VenData>(this, _$identity);
}

abstract class _VenData extends VenData {
  const factory _VenData(
      {required final String mac1,
      required final String mac2,
      required final double speed,
      required final double distance,
      required final int angle,
      required final bool isVentOn,
      required final int mode,
      required final bool isLightOpen}) = _$_VenData;
  const _VenData._() : super._();

  @override
  String get mac1;
  @override
  String get mac2;
  @override
  double get speed;
  @override // speed per second
  double get distance;
  @override
  int get angle;
  @override // alias openControl
  bool get isVentOn;
  @override
  int get mode;
  @override
  bool get isLightOpen;
  @override
  @JsonKey(ignore: true)
  _$$_VenDataCopyWith<_$_VenData> get copyWith =>
      throw _privateConstructorUsedError;
}
