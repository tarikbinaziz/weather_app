import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/config/app_color.dart';
import 'package:weather_app/config/app_text.dart';
import 'package:weather_app/utils/extensions.dart';
import 'package:weather_app/views/home_screen/components/bottom_custom.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen size
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      bottomNavigationBar: CustomPaint(
        size: Size(screenWidth,
            screenHeight * 0.15), // Use screenWidth to take full width
        painter: RPSCustomPainter(),
        child: SizedBox(
          width: double.infinity, // Ensures the container takes full width
          height: screenHeight * 0.15, // Adjust height based on screen size
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.home, color: Colors.black),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search, color: Colors.black),
              ),
              const SizedBox(width: 50), // Space for FAB
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications, color: Colors.black),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.person, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
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
              SizedBox(height: 20.h),
              // Sunset/Sunrise row
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildInfoCard("Sunset", "5:51 PM"),
                    _buildInfoCard("Sunrise", "7:00 AM"),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              _buildInfoCard("UV Index", "1 Low"),
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
