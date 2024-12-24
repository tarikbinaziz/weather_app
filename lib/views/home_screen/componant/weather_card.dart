import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/config/app_color.dart';
import 'package:weather_app/config/app_text.dart';
import 'package:weather_app/controller/temp_unit_controller.dart';
import 'package:weather_app/utils/extensions.dart';
import 'package:weather_app/widgets/format_time.dart';
import 'package:weather_app/widgets/loader.dart';

Widget buildWeatherCard({
  required Weather weather,
  required WidgetRef ref,
}) {
  final tempUnit = ref.watch(temperatureUnitProvider);
  return Stack(
    alignment: Alignment.center,
    children: [
      // Inner container for content
      Container(
        margin: EdgeInsets.only(right: 10.w),
        width: 65.w, // Slightly smaller to create the border effect
        decoration: BoxDecoration(
          border: Border.all(
              color: AppColor.whiteColor.withOpacity(0.2), width: 2.r),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColor.whiteColor.withOpacity(0.8),
              AppColor.whiteColor.withOpacity(0.0),
            ],
          ),
          borderRadius: BorderRadius.circular(100.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              formatTime(weather.date),
              style: AppTextStyle.normalBodyCircular.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
              ),
            ),
            8.ph,
            CachedNetworkImage(
              imageUrl:
                  "https://openweathermap.org/img/wn/${weather.weatherIcon}@2x.png",
              width: 30.w,
              height: 30.h,
              fit: BoxFit.cover,
              placeholder: (context, url) => CustomShimmer(
                width: 30.w,
                height: 30.w,
                boxShape: BoxShape.circle,
              ),
            ),
            8.ph,
            SizedBox(height: 5.h),
            Text(
              "${tempUnit.isCelsius ? weather.temperature?.celsius?.toInt() ?? '--' : weather.temperature?.fahrenheit?.toInt() ?? '--'}°",
              style: AppTextStyle.normalBodyCircular.copyWith(
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
