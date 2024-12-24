import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final temperatureUnitProvider = ChangeNotifierProvider((ref) => TemperatureUnitProvider());
class TemperatureUnitProvider with ChangeNotifier {
  bool _isCelsius = true;

  bool get isCelsius => _isCelsius;

  void toggleUnit() {
    _isCelsius = !_isCelsius;
    notifyListeners();
  }
}


