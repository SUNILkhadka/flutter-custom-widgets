import 'package:custom_components/views/buttons.dart';
import 'package:custom_components/views/home.dart';
import 'package:custom_components/views/sliders.dart';
import 'package:flutter/material.dart';

class Routes {
  static const buttons = '/button';
  static const sliders = '/slider';
  static const home = '/';

  static Route<dynamic> routesSetting(RouteSettings settings) {
    switch (settings.name) {
      case (home):
        return MaterialPageRoute(builder: ((context) => HomePage()));

      case (buttons):
        return MaterialPageRoute(builder: ((context) => ButtonPage()));

      case (sliders):
        return MaterialPageRoute(builder: ((context) => SlidersPage()));

      default:
        throw const FormatException('PageNotFound');
    }
  }
}
