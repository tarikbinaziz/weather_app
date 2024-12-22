import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlobalFunction {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  // context less navigation
  static void changeStatusBarColor({
    Color color = Colors.transparent,
    Brightness? iconBrightness,
    Brightness? brightness,
  }) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: color, //or set color with: Color(0xFF0000FF)
        statusBarIconBrightness:
            iconBrightness ?? Brightness.dark, // For Android (dark icons)
        statusBarBrightness: brightness ?? Brightness.light,
      ),
    );
  }

  static void showCustomSnackbar({
    required String message,
    required bool isSuccess,
    bool isTop = false,
  }) {
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          16.r,
        ),
      ),
      dismissDirection:
          isTop ? DismissDirection.startToEnd : DismissDirection.down,
      backgroundColor: isSuccess ? Colors.green : Colors.red,
      content: Text(message),
      margin: isTop
          ? EdgeInsets.only(
              bottom: MediaQuery.of(navigatorKey.currentState!.context)
                      .size
                      .height -
                  160,
              right: 20,
              left: 20,
            )
          : null,
    );
    ScaffoldMessenger.of(navigatorKey.currentState!.context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        snackBar,
      );
  }

  static Color getStatusColor(String status) {
    switch (status) {
      case 'Pending':
        return const Color(0xffF59E0B);
      case 'Completed':
        return Colors.green;
      case 'Cancelled':
        return Colors.red;
      case 'Confirm':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }
}
