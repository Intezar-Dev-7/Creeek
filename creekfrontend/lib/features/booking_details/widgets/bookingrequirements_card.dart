import 'package:flutter/material.dart';

class BookingRequirementsCard extends StatelessWidget {
  const BookingRequirementsCard({super.key});

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: const Color(0xFFF8FBFF),
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: const Color(0xFFE8F0F8)),
    ),
    child: const Column(
      children: [
        _RequirementRow(
          icon: Icons.bolt_rounded,
          iconColor: Color(0xFFF0A830),
          text: 'Electricity within 20m required',
        ),
        SizedBox(height: 12),
        _RequirementRow(
          icon: Icons.water_drop_outlined,
          iconColor: Color(0xFF3BA8E0),
          text: 'Water must be provided',
        ),
      ],
    ),
  );
}

class _RequirementRow extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String text;

  const _RequirementRow({
    required this.icon,
    required this.iconColor,
    required this.text,
  });

  @override
  Widget build(BuildContext context) => Row(
    children: [
      Icon(icon, size: 18, color: iconColor),
      const SizedBox(width: 10),
      Text(
        text,
        style: const TextStyle(fontSize: 13, color: Color(0xFF444444)),
      ),
    ],
  );
}
