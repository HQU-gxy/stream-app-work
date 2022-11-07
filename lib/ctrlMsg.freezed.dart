// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ctrlMsg.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ControlMessage {
  String get mac1 => throw _privateConstructorUsedError;
  String get mac2 => throw _privateConstructorUsedError;
  bool get isVentOn => throw _privateConstructorUsedError;
  VentAngle get angle => throw _privateConstructorUsedError;
  DoorStatus get door => throw _privateConstructorUsedError;
  bool get isLightOn => throw _privateConstructorUsedError;
  bool get isAuto => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ControlMessageCopyWith<ControlMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ControlMessageCopyWith<$Res> {
  factory $ControlMessageCopyWith(
          ControlMessage value, $Res Function(ControlMessage) then) =
      _$ControlMessageCopyWithImpl<$Res, ControlMessage>;
  @useResult
  $Res call(
      {String mac1,
      String mac2,
      bool isVentOn,
      VentAngle angle,
      DoorStatus door,
      bool isLightOn,
      bool isAuto});
}

/// @nodoc
class _$ControlMessageCopyWithImpl<$Res, $Val extends ControlMessage>
    implements $ControlMessageCopyWith<$Res> {
  _$ControlMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mac1 = null,
    Object? mac2 = null,
    Object? isVentOn = null,
    Object? angle = null,
    Object? door = null,
    Object? isLightOn = null,
    Object? isAuto = null,
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
      isVentOn: null == isVentOn
          ? _value.isVentOn
          : isVentOn // ignore: cast_nullable_to_non_nullable
              as bool,
      angle: null == angle
          ? _value.angle
          : angle // ignore: cast_nullable_to_non_nullable
              as VentAngle,
      door: null == door
          ? _value.door
          : door // ignore: cast_nullable_to_non_nullable
              as DoorStatus,
      isLightOn: null == isLightOn
          ? _value.isLightOn
          : isLightOn // ignore: cast_nullable_to_non_nullable
              as bool,
      isAuto: null == isAuto
          ? _value.isAuto
          : isAuto // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ControlMessageCopyWith<$Res>
    implements $ControlMessageCopyWith<$Res> {
  factory _$$_ControlMessageCopyWith(
          _$_ControlMessage value, $Res Function(_$_ControlMessage) then) =
      __$$_ControlMessageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String mac1,
      String mac2,
      bool isVentOn,
      VentAngle angle,
      DoorStatus door,
      bool isLightOn,
      bool isAuto});
}

/// @nodoc
class __$$_ControlMessageCopyWithImpl<$Res>
    extends _$ControlMessageCopyWithImpl<$Res, _$_ControlMessage>
    implements _$$_ControlMessageCopyWith<$Res> {
  __$$_ControlMessageCopyWithImpl(
      _$_ControlMessage _value, $Res Function(_$_ControlMessage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mac1 = null,
    Object? mac2 = null,
    Object? isVentOn = null,
    Object? angle = null,
    Object? door = null,
    Object? isLightOn = null,
    Object? isAuto = null,
  }) {
    return _then(_$_ControlMessage(
      mac1: null == mac1
          ? _value.mac1
          : mac1 // ignore: cast_nullable_to_non_nullable
              as String,
      mac2: null == mac2
          ? _value.mac2
          : mac2 // ignore: cast_nullable_to_non_nullable
              as String,
      isVentOn: null == isVentOn
          ? _value.isVentOn
          : isVentOn // ignore: cast_nullable_to_non_nullable
              as bool,
      angle: null == angle
          ? _value.angle
          : angle // ignore: cast_nullable_to_non_nullable
              as VentAngle,
      door: null == door
          ? _value.door
          : door // ignore: cast_nullable_to_non_nullable
              as DoorStatus,
      isLightOn: null == isLightOn
          ? _value.isLightOn
          : isLightOn // ignore: cast_nullable_to_non_nullable
              as bool,
      isAuto: null == isAuto
          ? _value.isAuto
          : isAuto // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ControlMessage extends _ControlMessage {
  const _$_ControlMessage(
      {required this.mac1,
      required this.mac2,
      required this.isVentOn,
      required this.angle,
      required this.door,
      required this.isLightOn,
      required this.isAuto})
      : super._();

  @override
  final String mac1;
  @override
  final String mac2;
  @override
  final bool isVentOn;
  @override
  final VentAngle angle;
  @override
  final DoorStatus door;
  @override
  final bool isLightOn;
  @override
  final bool isAuto;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ControlMessage &&
            (identical(other.mac1, mac1) || other.mac1 == mac1) &&
            (identical(other.mac2, mac2) || other.mac2 == mac2) &&
            (identical(other.isVentOn, isVentOn) ||
                other.isVentOn == isVentOn) &&
            (identical(other.angle, angle) || other.angle == angle) &&
            (identical(other.door, door) || other.door == door) &&
            (identical(other.isLightOn, isLightOn) ||
                other.isLightOn == isLightOn) &&
            (identical(other.isAuto, isAuto) || other.isAuto == isAuto));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, mac1, mac2, isVentOn, angle, door, isLightOn, isAuto);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ControlMessageCopyWith<_$_ControlMessage> get copyWith =>
      __$$_ControlMessageCopyWithImpl<_$_ControlMessage>(this, _$identity);
}

abstract class _ControlMessage extends ControlMessage {
  const factory _ControlMessage(
      {required final String mac1,
      required final String mac2,
      required final bool isVentOn,
      required final VentAngle angle,
      required final DoorStatus door,
      required final bool isLightOn,
      required final bool isAuto}) = _$_ControlMessage;
  const _ControlMessage._() : super._();

  @override
  String get mac1;
  @override
  String get mac2;
  @override
  bool get isVentOn;
  @override
  VentAngle get angle;
  @override
  DoorStatus get door;
  @override
  bool get isLightOn;
  @override
  bool get isAuto;
  @override
  @JsonKey(ignore: true)
  _$$_ControlMessageCopyWith<_$_ControlMessage> get copyWith =>
      throw _privateConstructorUsedError;
}
