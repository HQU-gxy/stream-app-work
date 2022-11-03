import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'venData.freezed.dart';

@freezed
class VenData with _$VenData {
  // https://qiita.com/imajoriri/items/84e1fc3674d5c9835938
  const VenData._();
  const factory VenData({
    required String mac1,
    required String mac2,
    required double speed, // speed per second
    required double distance,
    required int angle,
    required int openControl,
    required int mode,
    required bool isLightOpen,
  }) = _VenData;

  @override
  String toString() {
    //        3323030949/3323030927  /z0.52           /40.2       /51           /1                /1           /1q
    final f = boolToNum(isLightOpen);
    final s = '$mac1/$mac2/z${speed.toStringAsFixed(2)}/${distance.toStringAsFixed(1)}/$angle/$openControl/$mode/${f}q';
    return s;
  }

  static VenData? fromString(String s) {
    try {
      final l = s.split('/');
      final mac1 = l.pop();
      final mac2 = l.pop();
      final speedWithZ = l.pop();
      final speed = double.parse(speedWithZ.substring(1));
      final distance = double.parse(l.pop());
      final angle = int.parse(l.pop());
      final openCtrl = int.parse(l.pop());
      final mode = int.parse(l.pop());
      final isLightOpenWithQ = l.pop();
      int len = isLightOpenWithQ.length;
      int isL = int.parse(isLightOpenWithQ.substring(0, len-1));
      final isLightOpen = numToBool(isL);
      return VenData(
        mac1: mac1,
        mac2: mac2,
        speed: speed,
        distance: distance,
        angle: angle,
        openControl: openCtrl,
        mode: mode,
        isLightOpen: isLightOpen,
      );
    } on Exception catch (e) {
      return null;
    }
  }
}

extension on List<String> {
  String pop() {
    final val = first;
    removeAt(0);
    return val;
  }
}

bool numToBool(int n) {
  return n >= 1;
}

int boolToNum(bool b) => b ? 1 : 0;
