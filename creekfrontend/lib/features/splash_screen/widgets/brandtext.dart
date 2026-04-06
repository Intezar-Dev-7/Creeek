import 'package:creekfrontend/core/constant/colors.dart';
import 'package:flutter/material.dart';

class BrandText extends StatelessWidget {
  const BrandText({super.key});

  @override
  Widget build(BuildContext context) => const Column(
    children: [
      Text(
        'Doorstep Vehicle Care - Goa',
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w800,
          color: AppColors.textDark,
          letterSpacing: -0.3,
        ),
      ),
      SizedBox(height: 6),
      Text(
        'Premium Resort Wash',
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: AppColors.blue,
          letterSpacing: 0.2,
        ),
      ),
    ],
  );
}
