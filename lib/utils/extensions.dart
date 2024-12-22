import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension NumModifier on num {
  Gap get ph => Gap(toDouble().h);
  Gap get pw => Gap(toDouble().w);
}

extension EasyNavigator on BuildContext {
  NavigatorState get nav {
    return Navigator.of(this);
  }
}

extension ThemeBrightnessExtension on BuildContext {
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
}
