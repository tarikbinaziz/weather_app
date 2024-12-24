import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:weather_app/config/app_color.dart';

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paintFill0 = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;
    paintFill0.shader = ui.Gradient.linear(
      Offset(size.width * 0.0, size.height * 0.5),
      Offset(size.width, size.height * 0.5),
      [const Color(0xffffffff).withOpacity(0.6), AppColor.primaryColor],
      [0.00, 1.00],
    );

    Path path_0 = Path();
    // Start at the bottom left corner
    path_0.moveTo(0, size.height);

    // Bottom left corner to the left of the circular notch
    path_0.lineTo(0, size.height * 0.5);

    // Left curve leading into the circular notch
    path_0.quadraticBezierTo(
      size.width * 0.2, size.height * 0.2, // Control point
      size.width * 0.4, size.height * 0.2, // Endpoint
    );

    // Circular notch
    path_0.arcToPoint(
      Offset(size.width * 0.6, size.height * 0.2), // End of arc
      radius: Radius.circular(size.width * 0.1), // Circular radius
      clockwise: false,
    );

    // Right curve leading out of the circular notch
    path_0.quadraticBezierTo(
      size.width * 0.8, size.height * 0.2, // Control point
      size.width, size.height * 0.5, // Endpoint
    );

    // Bottom right corner
    path_0.lineTo(size.width, size.height);

    // Close the path
    path_0.close();

    canvas.drawPath(path_0, paintFill0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
