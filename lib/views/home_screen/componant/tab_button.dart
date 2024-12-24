import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/config/app_color.dart';
import 'package:weather_app/config/app_text.dart';
import 'package:weather_app/controller/selected_day_controller.dart';

Widget buildTabButton(String title, int dayIndex, void Function()? onTap,
  WidgetRef ref) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: dayIndex == ref.watch(selectedDayProvider) ||
                ref.watch(selectedDayProvider) == 2 && title == "Next Days"
            ? AppColor.whiteColor.withOpacity(0.1)
            : Colors.black.withOpacity(0.1),
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: Text(
        title,
        style: AppTextStyle.normalBody
            .copyWith(fontWeight: FontWeight.bold, fontSize: 14.sp),
      ),
    ),
  );
}
