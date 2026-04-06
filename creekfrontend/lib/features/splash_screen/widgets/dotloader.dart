import 'dart:math' as math;

import 'package:creekfrontend/core/constant/colors.dart';
import 'package:flutter/material.dart';

class DotLoader extends StatelessWidget {
  final double progress;
  const DotLoader({super.key, required this.progress});

  @override
  Widget build(BuildContext context) => Row(
    mainAxisSize: MainAxisSize.min,
    children: List.generate(3, (i) {
      final t = (progress - i * 0.2).clamp(0.0, 1.0);
      final v = math.sin(t * math.pi);
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3),
        child: Transform.scale(
          scale: 0.7 + 0.3 * v,
          child: Opacity(opacity: 0.5 + 0.5 * v, child: const _Dot()),
        ),
      );
    }),
  );
}

class _Dot extends StatelessWidget {
  const _Dot();

  @override
  Widget build(BuildContext context) => const SizedBox.square(
    dimension: 7,
    child: DecoratedBox(
      decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.amber),
    ),
  );
}
