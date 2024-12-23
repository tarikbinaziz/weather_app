import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:weather_app/config/app_color.dart';

class CustomShimmer extends StatelessWidget {
  final double width;
  final double height;
  final BorderRadius? borderRadius;
  final BoxShape? boxShape;

  const CustomShimmer({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius,
    this.boxShape,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColor.secondaryColor,
      highlightColor: AppColor.primaryColor,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: AppColor.greyTextColor,
          shape: boxShape ?? BoxShape.rectangle,
          borderRadius: borderRadius,
        ),
      ),
    );
  }
}
