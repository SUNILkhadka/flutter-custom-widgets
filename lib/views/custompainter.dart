import 'package:custom_components/color.dart';
import 'package:flutter/material.dart';

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = AppColor.navbar
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path0 = Path();
    path0.moveTo(size.width * 0.7850000, size.height * 0.3200000);
    path0.lineTo(size.width * 0.7862500, size.height * 0.7960000);
    path0.lineTo(size.width * 0.6225000, size.height * 0.2540000);
    path0.lineTo(size.width * 0.4875000, size.height * 0.5660000);
    path0.lineTo(size.width * 0.2800000, size.height * 0.3100000);
    path0.lineTo(size.width * 0.2137500, size.height * 0.5860000);
    path0.lineTo(size.width * 0.7850000, size.height * 0.3200000);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
