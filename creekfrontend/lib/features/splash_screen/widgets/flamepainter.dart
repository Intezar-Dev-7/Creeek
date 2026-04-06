import 'package:creekfrontend/core/constant/colors.dart';
import 'package:flutter/material.dart';

class FlamePainterWidget extends StatelessWidget {
  const FlamePainterWidget({super.key});

  @override
  Widget build(BuildContext context) =>
      CustomPaint(size: const Size(22, 24), painter: _FlamePainter());
}

class _FlamePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    canvas.drawPath(_flamePath(w, h), Paint()..color = AppColors.amber);
    canvas.drawPath(_innerPath(w, h), Paint()..color = AppColors.amberLight);
  }

  static Path _flamePath(double w, double h) => Path()
    ..moveTo(0.5 * w, 0)
    ..cubicTo(0.85 * w, 0.28 * h, 0.85 * w, 0.50 * h, 0.85 * w, 0.50 * h)
    ..cubicTo(0.85 * w, 0.72 * h, 0.70 * w, 0.88 * h, 0.50 * w, 0.88 * h)
    ..cubicTo(0.30 * w, 0.88 * h, 0.15 * w, 0.72 * h, 0.15 * w, 0.50 * h)
    ..cubicTo(0.15 * w, 0.28 * h, 0.50 * w, 0, 0.50 * w, 0)
    ..close();

  static Path _innerPath(double w, double h) => Path()
    ..moveTo(0.5 * w, 0.15 * h)
    ..cubicTo(0.70 * w, 0.35 * h, 0.70 * w, 0.52 * h, 0.70 * w, 0.52 * h)
    ..cubicTo(0.70 * w, 0.65 * h, 0.61 * w, 0.74 * h, 0.50 * w, 0.74 * h)
    ..cubicTo(0.39 * w, 0.74 * h, 0.30 * w, 0.65 * h, 0.30 * w, 0.52 * h)
    ..cubicTo(0.30 * w, 0.35 * h, 0.50 * w, 0.15 * h, 0.50 * w, 0.15 * h)
    ..close();

  @override
  bool shouldRepaint(covariant CustomPainter old) => false;
}
