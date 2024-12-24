import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/config/app_text.dart';

weaterDetailsWidget({String? title, String? value}) {
  return RichText(
    text: TextSpan(
      children: [
        TextSpan(
            text: title,
            style: AppTextStyle.normalBodyCircular
                .copyWith(fontWeight: FontWeight.w300, fontSize: 14.sp)),
        const TextSpan(text: " : "),
        TextSpan(
            text: value,
            style: AppTextStyle.normalBodyCircular
                .copyWith(fontWeight: FontWeight.w500, fontSize: 14.sp)),
      ],
    ),
  );
}
