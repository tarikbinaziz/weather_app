import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/config/app_color.dart';
import 'package:weather_app/config/app_text.dart';
import 'package:weather_app/controller/weather_controller.dart';
import 'package:weather_app/utils/extensions.dart';
import 'package:weather_app/widgets/bottom_custom.dart';
import 'package:weather_app/widgets/format_hour.dart';

class BottomNavWidget extends StatelessWidget {
  const BottomNavWidget({
    super.key,
    required this.weatherState,
  });

  final WeatherState weatherState;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 272.h,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CustomPaint(
            size: Size(
                double.infinity, 272.h), // Use screenWidth to take full width
            painter: RPSCustomPainter(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: AppColor.whiteColor.withOpacity(0.2),
                        width: 2.r),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColor.whiteColor.withOpacity(0.1),
                        AppColor.whiteColor.withOpacity(0.0),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset("assets/images/sun-fog.6 1.png", width: 50.w),
                      32.pw,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Sunset",
                            style: AppTextStyle.normalBodyCircular.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp,
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: weatherState.currentWeather == null
                                      ? "--"
                                      : formatToHour(DateTime.parse(
                                          "${weatherState.currentWeather?.sunset}",
                                        )),
                                  style: TextStyle(
                                    color: AppColor.whiteColor,
                                    fontSize: 18.sp,
                                  ),
                                ),
                                TextSpan(
                                    text: "PM",
                                    style: TextStyle(
                                      color: AppColor.whiteColor,
                                      fontSize: 12.sp,
                                    ))
                              ],
                            ),
                          ),
                        ],
                      ),
                      32.pw,
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Sunrise",
                            style: AppTextStyle.normalBodyCircular.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp,
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: weatherState.currentWeather == null
                                      ? "--"
                                      : formatToHour(DateTime.parse(
                                          "${weatherState.currentWeather?.sunrise}",
                                        )),
                                  style: TextStyle(
                                    color: AppColor.whiteColor,
                                    fontSize: 18.sp,
                                  ),
                                ),
                                TextSpan(
                                    text: "AM",
                                    style: TextStyle(
                                      color: AppColor.whiteColor,
                                      fontSize: 12.sp,
                                    ))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                8.ph,
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: AppColor.whiteColor.withOpacity(0.2),
                        width: 2.r),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        AppColor.whiteColor.withOpacity(0.1),
                        AppColor.whiteColor.withOpacity(0.0),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset("assets/images/uv_index.png", width: 50.w),
                      32.pw,
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "wind speed",
                              style: AppTextStyle.normalBodyCircular.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white.withOpacity(0.6)
                                  //fontSize: 18.sp,
                                  ),
                            ),
                            Text(
                              "${weatherState.currentWeather == null ? "--" : weatherState.currentWeather!.windSpeed} km/h",
                              style: AppTextStyle.normalBodyCircular.copyWith(
                                  // fontWeight: FontWeight.w500,
                                  fontSize: 14.sp,
                                  color: Colors.white.withOpacity(0.9)),
                            ),
                          ],
                        ),
                      ),
                      32.pw,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Cloudiness",
                            style: AppTextStyle.normalBodyCircular.copyWith(
                                fontWeight: FontWeight.w500,
                                color: Colors.white.withOpacity(0.6)
                                //fontSize: 18.sp,
                                ),
                          ),
                          Text(
                            "${weatherState.currentWeather == null ? "--" : weatherState.currentWeather!.cloudiness} %",
                            style: AppTextStyle.normalBodyCircular.copyWith(
                                // fontWeight: FontWeight.w500,
                                fontSize: 14.sp,
                                color: Colors.white.withOpacity(0.9)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                12.ph,
              ],
            ),
          ),
          Positioned(
            top: 14.h,
            left: 0,
            right: 0,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  width: 65.w,
                  height: 65.w, // Slightly smaller to create the border effect
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: AppColor.whiteColor.withOpacity(0.2),
                        width: 2.r),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        AppColor.whiteColor.withOpacity(0.6),
                        AppColor.primaryColor.withOpacity(0.3),
                      ],
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
                Image.asset(
                  "assets/images/piramid.png",
                  width: 12.w,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
