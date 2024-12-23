import 'package:flutter/material.dart';

import 'package:page_transition/page_transition.dart';
import 'package:weather_app/views/home_screen/home_screen.dart';

class Routes {

  Routes._();
  //core
  static const home = '/';
}

Route generatedRoutes(RouteSettings settings) {
  Widget child;

  switch (settings.name) {
    //core
    case Routes.home:
      child = const HomeScreen();
      break;

    default:
      throw Exception('Invalid route: ${settings.name}');
  }
  debugPrint("Route: ${settings.name}");
  return PageTransition(
    child: child,
    type: PageTransitionType.fade,
    settings: settings,
    duration: const Duration(milliseconds: 300),
    reverseDuration: const Duration(milliseconds: 300),
  );
}
