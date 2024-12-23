import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/components/format_hour.dart';
import 'package:weather_app/components/loader.dart';
import 'package:weather_app/config/app_color.dart';
import 'package:weather_app/config/app_text.dart';
import 'package:weather_app/controller/selected_day_controller.dart';
import 'package:weather_app/controller/weather_controller.dart';
import 'package:weather_app/utils/extensions.dart';
import 'package:weather_app/views/home_screen/components/bottom_custom.dart';
import 'package:weather_app/views/home_screen/components/shimmer_widget.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final weatherState = ref.watch(weatherProvider);

    return Scaffold(
      extendBody: true,
      bottomNavigationBar: weatherState.isLoading
          ? const SizedBox()
          : SizedBox(
              height: 272.h,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  CustomPaint(
                    size: Size(double.infinity,
                        272.h), // Use screenWidth to take full width
                    painter: RPSCustomPainter(),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 4.h),
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
                              Image.asset("assets/images/sun-fog.6 1.png",
                                  width: 50.w),
                              32.pw,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Sunset",
                                    style: AppTextStyle.normalBodyCircular
                                        .copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: weatherState.currentWeather ==
                                                  null
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
                                    style: AppTextStyle.normalBodyCircular
                                        .copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: weatherState.currentWeather ==
                                                  null
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
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 4.h),
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
                              Image.asset("assets/images/uv_index.png",
                                  width: 50.w),
                              32.pw,
                              Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "UV Index",
                                      style: AppTextStyle.normalBodyCircular
                                          .copyWith(
                                              fontWeight: FontWeight.w500,
                                              color:
                                                  Colors.white.withOpacity(0.6)
                                              //fontSize: 18.sp,
                                              ),
                                    ),
                                    Text(
                                      "1 Low",
                                      style: AppTextStyle.normalBodyCircular
                                          .copyWith(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 20.sp,
                                              color: Colors.white
                                                  .withOpacity(0.6)),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        12.ph,
                      ],
                    ),
                  )
                ],
              ),
            ),
      body: weatherState.isLoading
          ? buildShimmerLoading(context)
          : weatherState.errorMessage.isNotEmpty
              ? Text("Error: ${weatherState.errorMessage}")
              : SingleChildScrollView(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        stops: [0.1, 1],
                        colors: [
                          AppColor.secondaryColor,
                          AppColor.primaryColor,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 60.h),
                        Text(
                          weatherState.currentWeather?.areaName ?? "",
                          style: AppTextStyle.largeTitle,
                        ),
                        15.ph,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/map_pin.png",
                              height: 13.63.h,
                              width: 11.83.w,
                            ),
                            5.pw,
                            Text(
                              "Current Location",
                              style: AppTextStyle.smallBody,
                            ),
                          ],
                        ),
                        20.ph,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CachedNetworkImage(
                              imageUrl:
                                  "https://openweathermap.org/img/wn/${weatherState.currentWeather?.weatherIcon}@4x.png",
                              width: 135.w,
                              height: 130.h,
                              fit: BoxFit.cover,
                              placeholder: (context, url) => CustomShimmer(
                                width: 80.w,
                                height: 80.w,
                                boxShape: BoxShape.circle,
                              ),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                            27.pw,
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "${weatherState.currentWeather?.temperature?.celsius?.round()}",
                                  style:
                                      AppTextStyle.normalBodyCircular.copyWith(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 102.sp,
                                    fontFamily: "Circular Std",
                                    height: 1,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 20.0.r),
                                  child: Text(
                                    "°",
                                    style: AppTextStyle.normalBodyCircular
                                        .copyWith(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 90.sp,
                                      fontFamily: "Circular Std",
                                      height: 1,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Text(
                          "${weatherState.currentWeather?.weatherDescription} - H:${weatherState.currentWeather?.tempMax?.celsius?.toStringAsFixed(0)}°  L:${weatherState.currentWeather?.tempMin?.celsius?.toStringAsFixed(0)}°",
                          //"Partly Cloud - H:17°  L:4°",
                          style: AppTextStyle.normalBodyCircular.copyWith(
                              fontWeight: FontWeight.w300, fontSize: 18.sp),
                        ),

                        32.ph,
                        // Tab bar
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildTabButton("Today", 0, () {
                              if (ref
                                      .read(selectedDayProvider.notifier)
                                      .state !=
                                  0) {
                                ref.read(selectedDayProvider.notifier).state =
                                    0;
                              }
                            }),
                            8.pw,
                            _buildTabButton("Next Days", 1, () {
                              debugPrint(
                                  "Next days selected  ${ref.read(selectedDayProvider)}");

                              if (ref
                                      .read(selectedDayProvider.notifier)
                                      .state !=
                                  2) {
                                debugPrint(
                                    "Next days selected  not 2  ${ref.read(selectedDayProvider)}");
                                ref.read(selectedDayProvider.notifier).state++;
                              }
                            }),
                          ],
                        ),
                        SizedBox(height: 25.h),
                        // Hourly weather
                        SizedBox(
                          height: 158.h,
                          child: Padding(
                            padding: EdgeInsets.only(left: 16.w),
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: weatherState.groupedForecast.isNotEmpty
                                  ? weatherState
                                      .groupedForecast[
                                          ref.watch(selectedDayProvider)]
                                      .length
                                  : 0,
                              itemBuilder: (context, hourIndex) {
                                final weather = weatherState.groupedForecast[
                                    ref.watch(selectedDayProvider)][hourIndex];
                                return _buildWeatherCard(weather: weather);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
    );
  }

  Widget _buildTabButton(String title, int dayIndex, void Function()? onTap) {
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

  Widget _buildWeatherCard({
    required Weather weather,
  }) {
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
                _formatTime(weather.date),
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
                "${weather.temperature?.celsius?.toInt() ?? '--'}°",
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

  String _formatTime(DateTime? dateTime) {
    if (dateTime == null) return '--';
    return DateFormat('ha').format(dateTime).toUpperCase();
  }
}
