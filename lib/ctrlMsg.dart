import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'utils.dart';

part 'ctrlMsg.freezed.dart';

//  flutter pub run build_runner build
// https://stackoverflow.com/questions/38908285/how-do-i-add-methods-or-values-to-enums-in-dart
// the angle will only change once
enum VentAngle {
  nc(0),
  increase(1),
  decrease(2),
  max(3);
  const VentAngle(this.value);
  final int value;
}

// the door will keep rising or falling
enum DoorStatus {
  rise(1),
  fall(2),
  stop(3);
  const DoorStatus(this.value);
  final int value;
}

@freezed
class ControlMessage with _$ControlMessage {
  const ControlMessage._();
  const factory ControlMessage({
    required String mac1,
    required String mac2,
    required bool isVentOn,
    required VentAngle angle,
    required DoorStatus door,
    required bool isLightOn,
    required bool isAuto
  }) = _ControlMessage;

  @override
  String toString() {
    // 2085134861/2507386961/z1/1/0/0/1q
    final s = "$mac1/$mac2/z${boolToNum(isVentOn)}/${angle.value}/${door.value}/${boolToNum(isLightOn)}/${boolToNum(isAuto)}q";
    return s;
  }

  static ControlMessage newDefaultWithMac(String mac1, String mac2){
    return ControlMessage(
      mac1: mac1,
      mac2: mac2,
      isVentOn: false,
      angle: VentAngle.nc,
      door: DoorStatus.stop,
      isLightOn: false,
      isAuto: false
    );
  }
}