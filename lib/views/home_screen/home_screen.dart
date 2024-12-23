import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/config/app_color.dart';
import 'package:weather_app/config/app_text.dart';
import 'package:weather_app/utils/extensions.dart';
import 'package:weather_app/views/home_screen/components/bottom_custom.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: SizedBox(
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
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
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
                              style: AppTextStyle.normalBodyCircular.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 16.sp,
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "5:51",
                                    style: TextStyle(
                                      color: AppColor.whiteColor,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
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
                                    text: "5:51",
                                    style: TextStyle(
                                      color: AppColor.whiteColor,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
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
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
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
                                "UV Index",
                                style: AppTextStyle.normalBodyCircular.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white.withOpacity(0.6)
                                    //fontSize: 18.sp,
                                    ),
                              ),
                              Text(
                                "1 Low",
                                style: AppTextStyle.normalBodyCircular.copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20.sp,
                                    color: Colors.white.withOpacity(0.6)),
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
      body: SingleChildScrollView(
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
                "Dhaka",
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
                  Image.asset(
                    "assets/images/partly_cloudy 1.png",
                    width: 135.w,
                    height: 130.h,
                  ),
                  27.pw,
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "13",
                        style: AppTextStyle.normalBodyCircular.copyWith(
                          fontWeight: FontWeight.w300,
                          fontSize: 122.sp,
                          fontFamily: "Circular Std",
                          height: 1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 16.0.r),
                        child: Text(
                          "°",
                          style: AppTextStyle.normalBodyCircular.copyWith(
                            fontWeight: FontWeight.w300,
                            fontSize: 110.sp,
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
                "Partly Cloud - H:17°  L:4°",
                style: AppTextStyle.normalBodyCircular
                    .copyWith(fontWeight: FontWeight.w300, fontSize: 18.sp),
              ),

              32.ph,
              // Tab bar
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildTabButton("Today", true),
                  8.pw,
                  _buildTabButton("Next Days", false),
                ],
              ),
              SizedBox(height: 25.h),
              // Hourly weather
              SizedBox(
                height: 158.h,
                child: Padding(
                  padding: EdgeInsets.only(left: 16.w),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    itemBuilder: (context, index) => _buildWeatherCard(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabButton(String title, bool isSelected) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: isSelected
            ? AppColor.whiteColor.withOpacity(0.1)
            : Colors.black.withOpacity(0.1),
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: Text(
        title,
        style: AppTextStyle.normalBody
            .copyWith(fontWeight: FontWeight.bold, fontSize: 14.sp),
      ),
    );
  }

  Widget _buildWeatherCard() {
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
                "Now",
                style: AppTextStyle.normalBodyCircular.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                ),
              ),
              8.ph,
              Icon(Icons.wb_sunny, color: AppColor.sunColor, size: 30.r),
              8.ph,
              SizedBox(height: 5.h),
              Text(
                "14°",
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

  Widget _buildInfoCard(String label, String value) {
    return Container(
      width: 160.w,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppColor.transparentWhite,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: AppColor.greyTextColor,
              fontSize: 14.sp,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: AppColor.whiteColor,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
