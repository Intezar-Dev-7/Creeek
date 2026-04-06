import 'package:creekfrontend/core/constant/colors.dart';
import 'package:creekfrontend/features/splash_screen/widgets/carpainter.dart';
import 'package:creekfrontend/features/splash_screen/widgets/flamepainter.dart';
import 'package:flutter/material.dart';

class IconRing extends StatelessWidget {
  final double pulse, flame;
  const IconRing({super.key, required this.pulse, required this.flame});

  @override
  Widget build(BuildContext context) => SizedBox(
    width: 140,
    height: 140,
    child: Stack(
      alignment: Alignment.center,
      children: [
        Transform.scale(
          scale: pulse,
          child: Container(
            width: 128,
            height: 128,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.ringBorder, width: 1.5),
              color: AppColors.ringFill,
            ),
          ),
        ),
        const RepaintBoundary(child: CarPainterWidget()),
        Positioned(
          top: 14,
          right: 14,
          child: Transform.rotate(
            angle: flame,
            child: const RepaintBoundary(child: FlamePainterWidget()),
          ),
        ),
      ],
    ),
  );
}
