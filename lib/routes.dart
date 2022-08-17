import 'package:flutter/material.dart';
import 'home.dart';
import 'setting.dart';
import 'all.dart';
import 'video.dart';

final Map<String, Function> routes = {
  '/vedio':(context) => const Video(),
  '/all':(context) => All(),
  '/home': (context) => const Home(),
  '/setting': (context) => const Setting()
};

var onGenerateRoute = (RouteSettings settings) {
  final String? name = settings.name;
  final Function? pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
  return null;
};
