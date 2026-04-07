import 'package:flutter/material.dart';

class ScheduledSuccessIcon extends StatelessWidget {
  const ScheduledSuccessIcon({super.key});

  @override
  Widget build(BuildContext context) => Container(
    width: 80,
    height: 80,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(color: const Color(0xFFF5D8A0), width: 2),
      color: const Color(0xFFFDF6EC),
    ),
    child: const Icon(Icons.check_rounded, size: 38, color: Color(0xFFF0A830)),
  );
}
