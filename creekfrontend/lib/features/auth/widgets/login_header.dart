import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) => Column(
    children: [
      Container(
        width: 72,
        height: 72,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: const LinearGradient(
            colors: [Color(0xFFFFC84A), Color(0xFFF0A830)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFF0A830).withOpacity(0.35),
              blurRadius: 16,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: const Center(child: _CarIcon()),
      ),
      const SizedBox(height: 20),
      const Text(
        'Welcome Back',
        style: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.w800,
          color: Color(0xFF1A1A1A),
          letterSpacing: -0.4,
        ),
      ),
    ],
  );
}

class _CarIcon extends StatelessWidget {
  const _CarIcon();

  @override
  Widget build(BuildContext context) =>
      CustomPaint(size: const Size(36, 22), painter: _CarPainter());
}

class _CarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final p = Paint()
      ..color = const Color(0xFF1A1A1A)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.6
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final w = size.width;
    final h = size.height;

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(0.05 * w, 0.41 * h, 0.90 * w, 0.41 * h),
        const Radius.circular(3),
      ),
      p,
    );

    canvas.drawPath(
      Path()
        ..moveTo(0.17 * w, 0.41 * h)
        ..lineTo(0.27 * w, 0.09 * h)
        ..lineTo(0.50 * w, 0.09 * h)
        ..lineTo(0.65 * w, 0.09 * h)
        ..lineTo(0.83 * w, 0.41 * h),
      p,
    );

    canvas.drawLine(
      Offset(0.50 * w, 0.09 * h),
      Offset(0.50 * w, 0.41 * h),
      p..strokeWidth = 1.1,
    );

    p
      ..strokeWidth = 1.6
      ..style = PaintingStyle.stroke;

    for (final cx in [0.24 * w, 0.76 * w]) {
      canvas.drawCircle(Offset(cx, 0.85 * h), 0.13 * w, p);
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
