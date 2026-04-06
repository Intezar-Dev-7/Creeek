import 'package:creekfrontend/core/constant/colors.dart';
import 'package:flutter/material.dart';

class CarPainterWidget extends StatelessWidget {
  const CarPainterWidget({super.key});

  @override
  Widget build(BuildContext context) =>
      CustomPaint(size: const Size(58, 34), painter: _CarPainter());
}

class _CarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final p = Paint()
      ..color = AppColors.textDark
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final w = size.width;
    final h = size.height;

    // Body
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(0.05 * w, 0.41 * h, 0.90 * w, 0.41 * h),
        const Radius.circular(4),
      ),
      p,
    );

    // Roof + windshield
    canvas.drawPath(
      Path()
        ..moveTo(0.17 * w, 0.41 * h)
        ..lineTo(0.27 * w, 0.09 * h)
        ..lineTo(0.50 * w, 0.09 * h) // split at centre
        ..lineTo(0.65 * w, 0.09 * h)
        ..lineTo(0.83 * w, 0.41 * h),
      p,
    );

    // Centre pillar
    canvas.drawLine(
      Offset(0.50 * w, 0.09 * h),
      Offset(0.50 * w, 0.41 * h),
      p..strokeWidth = 1.2,
    );

    // Wheels
    p
      ..strokeWidth = 1.8
      ..style = PaintingStyle.stroke;

    for (final cx in [0.24 * w, 0.76 * w]) {
      canvas.drawCircle(Offset(cx, 0.85 * h), 0.14 * w, p);
      canvas.drawCircle(
        Offset(cx, 0.85 * h),
        0.04 * w,
        p..style = PaintingStyle.fill,
      );
      p.style = PaintingStyle.stroke;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter old) => false;
}
