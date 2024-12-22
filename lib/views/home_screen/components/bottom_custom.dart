import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Layer 1
    Paint paint_fill_0 = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;
    paint_fill_0.shader = ui.Gradient.linear(
      Offset(size.width * 0.37, size.height * 0.50),
      Offset(size.width * 0.63, size.height * 0.50),
      [Color(0xff000000), Color(0xffffffff)],
      [0.00, 1.00],
    );

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.4630000, size.height * 0.3548571);
    path_0.quadraticBezierTo(size.width * 0.4606833, size.height * 0.3830143,
        size.width * 0.4664333, size.height * 0.3975143);
    path_0.quadraticBezierTo(size.width * 0.4660583, size.height * 0.4111571,
        size.width * 0.4780333, size.height * 0.4169571);
    path_0.quadraticBezierTo(size.width * 0.4979417, size.height * 0.4330143,
        size.width * 0.5121083, size.height * 0.4169429);
    path_0.quadraticBezierTo(size.width * 0.5290667, size.height * 0.3991571,
        size.width * 0.5260000, size.height * 0.3548571);
    path_0.lineTo(size.width * 0.6250000, size.height * 0.4300000);
    path_0.lineTo(size.width * 0.6250000, size.height * 0.6442857);
    path_0.lineTo(size.width * 0.3741667, size.height * 0.6442857);
    path_0.lineTo(size.width * 0.3750000, size.height * 0.4285714);
    path_0.lineTo(size.width * 0.4630000, size.height * 0.3548571);
    path_0.close();

    canvas.drawPath(path_0, paint_fill_0);

    // Layer 1
    Paint paint_stroke_0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    canvas.drawPath(path_0, paint_stroke_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}