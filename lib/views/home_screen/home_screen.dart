import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/config/app_color.dart';
import 'package:weather_app/config/app_text.dart';
import 'package:weather_app/controller/selected_day_controller.dart';
import 'package:weather_app/controller/temp_unit_controller.dart';
import 'package:weather_app/controller/weather_controller.dart';
import 'package:weather_app/utils/extensions.dart';
import 'package:weather_app/utils/temp_converter.dart';
import 'package:weather_app/views/home_screen/componant/bottom_nav_widget.dart';
import 'package:weather_app/views/home_screen/componant/tab_button.dart';
import 'package:weather_app/views/home_screen/componant/weather_card.dart';
import 'package:weather_app/views/home_screen/componant/weather_details_widget.dart';
import 'package:weather_app/widgets/loader.dart';
import 'package:weather_app/widgets/shimmer_widget.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final weatherState = ref.watch(weatherProvider);
    final temperatureUnit = ref.watch(temperatureUnitProvider);

    return Scaffold(
      extendBody: true,
      bottomNavigationBar:
          weatherState.isLoading || weatherState.errorMessage.isNotEmpty
              ? const SizedBox()
              : BottomNavWidget(weatherState: weatherState),
      body: weatherState.isLoading
          ? buildShimmerLoading(context)
          : weatherState.errorMessage.isNotEmpty
              ? Center(
                  child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "Error: ${weatherState.errorMessage}",
                    textAlign: TextAlign.center,
                    style: AppTextStyle.normalBody,
                  ),
                ))
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
                        SizedBox(height: 52.h),
                        Stack(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  weatherState.currentWeather?.areaName ?? "",
                                  style: AppTextStyle.largeTitle
                                      .copyWith(fontSize: 24.sp),
                                ),
                                4.ph,
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
                              ],
                            ),
                            Positioned(
                              top: 16.h,
                              right: 0,
                              child: Row(
                                children: [
                                  Text(temperatureUnit.isCelsius ? 'C ' : 'F ',
                                      style: AppTextStyle.title),
                                  Switch(
                                    activeColor: AppColor.whiteColor,
                                    value: temperatureUnit.isCelsius,
                                    onChanged: (value) {
                                      temperatureUnit.toggleUnit();
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        10.ph,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CachedNetworkImage(
                              imageUrl:
                                  "https://openweathermap.org/img/wn/${weatherState.currentWeather?.weatherIcon}@4x.png",
                              width: 120.w,
                              height: 110.h,
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
                                  "${temperatureUnit.isCelsius ? weatherState.currentWeather?.temperature?.celsius?.round() : TemperatureConverter.toFahrenheit(weatherState.currentWeather?.temperature?.celsius ?? 0).round()}",
                                  style:
                                      AppTextStyle.normalBodyCircular.copyWith(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 80.sp,
                                    fontFamily: "Circular Std",
                                    height: 1,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 12.0.h),
                                  child: Text(
                                    "°",
                                    style: AppTextStyle.normalBodyCircular
                                        .copyWith(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 80.sp,
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
                          "${weatherState.currentWeather?.weatherDescription} - H:${temperatureUnit.isCelsius ? weatherState.currentWeather?.tempMax?.celsius?.round() : TemperatureConverter.toFahrenheit(weatherState.currentWeather?.tempMax?.celsius ?? 0).round()}°  L:${temperatureUnit.isCelsius ? weatherState.currentWeather?.tempMin?.celsius?.round() : TemperatureConverter.toFahrenheit(weatherState.currentWeather?.tempMin?.celsius ?? 0).round()}°",
                          style: AppTextStyle.normalBodyCircular.copyWith(
                              fontWeight: FontWeight.w300,
                              fontSize: 16.sp,
                              height: 1),
                        ),
                        8.ph,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                weaterDetailsWidget(
                                    title: "Pressure",
                                    value:
                                        "${weatherState.currentWeather?.pressure?.toStringAsFixed(0)} hPa"),
                                weaterDetailsWidget(
                                    title: "Humidity",
                                    value:
                                        "${weatherState.currentWeather?.humidity?.toStringAsFixed(0)} %"),
                                weaterDetailsWidget(
                                    title: "Wind Gust",
                                    value:
                                        "${weatherState.currentWeather?.windGust?.toStringAsFixed(0)} m/s"),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                weaterDetailsWidget(
                                    title: "Wind Speed",
                                    value:
                                        "${weatherState.currentWeather?.windSpeed?.toStringAsFixed(0) ?? "0"} m/s"),
                                weaterDetailsWidget(
                                    title: "Rain Last hour",
                                    value:
                                        "${weatherState.currentWeather?.rainLastHour?.toStringAsFixed(0) ?? "0"} mm"),
                                weaterDetailsWidget(
                                    title: "Snow Last hour",
                                    value:
                                        "${weatherState.currentWeather?.snowLastHour?.toStringAsFixed(0) ?? "0"} mm"),
                              ],
                            )
                          ],
                        ),

                        24.ph,
                        // Tab bar
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buildTabButton("Today", 0, () {
                              if (ref
                                      .read(selectedDayProvider.notifier)
                                      .state !=
                                  0) {
                                ref.read(selectedDayProvider.notifier).state =
                                    0;
                              }
                            }, ref),
                            8.pw,
                            buildTabButton("Next Days", 1, () {
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
                            }, ref),
                          ],
                        ),
                        SizedBox(height: 24.h),

                        SizedBox(
                          height: 140.h,
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
                                return buildWeatherCard(
                                    weather: weather, ref: ref);
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
}
