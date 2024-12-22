import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/config/app_color.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Inter',
    useMaterial3: true,
    scaffoldBackgroundColor: AppColor.primaryColor,
    canvasColor: AppColor.whiteColor,
    brightness: Brightness.light,
    dialogTheme: const DialogTheme(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.primaryColor,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: AppColor.whiteColor,
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: const IconThemeData(
        color: AppColor.whiteColor,
      ),
    ),
  );
}
