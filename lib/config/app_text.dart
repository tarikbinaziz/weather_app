import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyle {
  AppTextStyle._();

  static final largeTitle = TextStyle(
      fontSize: 32.sp, fontWeight: FontWeight.w700, color: Colors.white);
  static final title = TextStyle(
      fontSize: 20.sp, fontWeight: FontWeight.w700, color: Colors.white);
  static final extraLargeBody = TextStyle(
      fontSize: 24.sp, fontWeight: FontWeight.w700, color: Colors.white);
  static final largeBody = TextStyle(
      fontSize: 18.sp, fontWeight: FontWeight.w700, color: Colors.white);
  static final normalBody = TextStyle(
      fontSize: 16.sp, fontWeight: FontWeight.w400, color: Colors.white);
  static final normalBodyCircular = TextStyle(
      fontFamily: "Circular Std",
      fontSize: 16.sp,
      fontWeight: FontWeight.w300,
      color: Colors.white);
  static final smallBody = TextStyle(
      fontSize: 12.sp, fontWeight: FontWeight.w400, color: Colors.white);
}
