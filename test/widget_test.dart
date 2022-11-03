import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:work2/main.dart';
import "package:work2/venData.dart";

void main() {
  group("venData parser", () {
    test("venData serialize", (){
      //        3323030949/3323030927  /z0.52           /40.2       /51           /1                /1           /1q
      final val = VenData(mac1: "3323030949", mac2: "3323030927", speed: 0.52, distance: 40.2, angle: 51, openControl: 1, mode: 1, isLightOpen: true);
      const ex = "3323030949/3323030927/z0.52/40.2/51/1/1/1q";
      expect(val.toString(), ex);
    });
    test("venData deserialize", (){
      const val = "3323030949/3323030927/z0.52/40.2/51/1/1/1q";
      final ex = VenData(mac1: "3323030949", mac2: "3323030927", speed: 0.52, distance: 40.2, angle: 51, openControl: 1, mode: 1, isLightOpen: true);
      expect(VenData.fromString(val), ex);
    });
  });
}
