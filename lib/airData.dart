import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'utils.dart';

part 'airData.freezed.dart';

@freezed
class AirData with _$AirData {
  const AirData._();
  const factory AirData(
      {required String mac1,
      required String mac2,
      required double temperature,
      required double humidity,
      required double tvoc,
      required double hcho,
      required double co2,
      required List<int> smokeData,
      required List<int> smokeAlarm}) = _AirData;

  String toString() {
    final smokeDataJoined = smokeData.join("/");
    final smokeAlarmJoined = smokeAlarm.join("/");
    final s = '''
    $mac1/
    $mac2/
    a${temperature.toStringAsFixed(1)}/
    ${humidity.toStringAsFixed(1)}/
    ${tvoc.toStringAsFixed(1)}/
    ${hcho.toStringAsFixed(1)}/
    ${co2.toStringAsFixed(1)}/
    ${smokeDataJoined}/
    ${smokeAlarmJoined}s
    ''';
    var r = s.replaceAll(RegExp(r"\r?\n|\r|  "), "");
    return r;
  }

  static AirData? fromString(String str,
      {int smokeDataLength = 4, int smokeAlarmLength = 4}) {
    try {
      final l = str.split('/');
      final mac1 = l.pop();
      final mac2 = l.pop();
      final temperatureWithA = l.pop();
      final temperature = double.parse(temperatureWithA.substring(1));
      final humidity = double.parse(l.pop());
      final tvoc = double.parse(l.pop());
      final hcho = double.parse(l.pop());
      final co2 = double.parse(l.pop());
      // We don't know how many smoke data we have
      // Well it's predefined to 4
      final smokeData = <int>[];
      final smokeAlarm = <int>[];
      for (int _i in range(smokeDataLength)) {
        smokeData.add(int.parse(l.pop()));
      }
      for (int _i in range(smokeAlarmLength)) {
        final n = l.pop();
        final onlyDigit = n.replaceAll(RegExp(r"\D"), "");
        smokeData.add(int.parse(onlyDigit));
      }
      return AirData(
        mac1: mac1,
        mac2: mac2,
        temperature: temperature,
        humidity: humidity,
        tvoc: tvoc,
        hcho: hcho,
        co2: co2,
        smokeData: smokeData,
        smokeAlarm: smokeAlarm,
      );
    } on Exception catch (e) {
      return null;
    }
  }
}
