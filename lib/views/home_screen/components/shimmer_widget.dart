import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:weather_app/config/app_color.dart';

class ShimmerEffect extends StatelessWidget {
  final double width;
  final double height;
  final BoxShape shape;

  const ShimmerEffect({
    super.key,
    required this.width,
    required this.height,
    this.shape = BoxShape.rectangle,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColor.secondaryColor,
      highlightColor: AppColor.secondaryColor.withOpacity(0.5),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          shape: shape,
          borderRadius: shape == BoxShape.rectangle
              ? BorderRadius.circular(
                  100.r) // Apply borderRadius only for BoxShape.rectangle
              : null,
        ),
      ),
    );
  }
}

Widget buildShimmerLoading(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        stops: [0.1, 1],
        colors: [AppColor.secondaryColor, AppColor.primaryColor],
        begin: Alignment.topLeft,
        end: Alignment.centerRight,
      ),
    ),
    child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 60.h),
          // Shimmer effect for city name
          ShimmerEffect(width: 200.w, height: 50.h),
          SizedBox(height: 15.h),
          // Shimmer effect for location text
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShimmerEffect(width: 30.w, height: 30.h, shape: BoxShape.circle),
              SizedBox(width: 5.w),
              ShimmerEffect(width: 100.w, height: 30.h),
            ],
          ),
          SizedBox(height: 20.h),
          // Shimmer effect for weather icon and temperature
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ShimmerEffect(
                    width: 100.w,
                    height: 100.h,
                    shape: BoxShape.circle), // Weather icon shimmer

                ShimmerEffect(width: 180.w, height: 90.h),
              ],
            ),
          ),
          SizedBox(height: 15.h),
          // Shimmer effect for weather description
          ShimmerEffect(width: 200.w, height: 40.h),
          SizedBox(height: 32.h),
          // Shimmer effect for bottom tabs (Today / Next Days)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShimmerEffect(width: 120.w, height: 40.h),
              SizedBox(width: 8.w),
              ShimmerEffect(width: 160.w, height: 40.h),
            ],
          ),
          SizedBox(height: 30.h),
          // Shimmer effect for hourly weather list
          SizedBox(
            height: 158.h,
            child: Padding(
              padding: EdgeInsets.only(left: 16.w),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 6, // Placeholder for 6 hours
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: ShimmerEffect(width: 65.w, height: 100.h),
                  );
                },
              ),
            ),
          ),

          SizedBox(height: 30.h),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShimmerEffect(width: 300.w, height: 90.h),
              SizedBox(height: 16.h),
              ShimmerEffect(width: 280.w, height: 90.h),
            ],
          ),
        ],
      ),
    ),
  );
}
