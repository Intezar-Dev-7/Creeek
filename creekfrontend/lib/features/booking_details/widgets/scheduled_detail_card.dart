import 'package:flutter/material.dart';

class ScheduledDetailCard extends StatelessWidget {
  final String packageName;

  const ScheduledDetailCard({super.key, required this.packageName});

  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    padding: const EdgeInsets.all(18),
    decoration: BoxDecoration(
      color: const Color(0xFFF8FBFF),
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: const Color(0xFFE8F0F8)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Package name
        Text(
          packageName,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w900,
            color: Color(0xFF1A1A1A),
            letterSpacing: 0.3,
          ),
        ),
        const SizedBox(height: 16),

        // Date & Time
        _DetailRow(
          icon: Icons.calendar_month_rounded,
          label: 'DATE & TIME',
          value: 'Mar 25, 2026 • 10:00 AM',
        ),
        const SizedBox(height: 12),

        // Location
        _DetailRow(
          icon: Icons.location_on_outlined,
          label: 'LOCATION',
          value: 'Villa 12, Calangute Beach Road',
        ),
      ],
    ),
  );
}

class _DetailRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _DetailRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Icon(icon, size: 18, color: const Color(0xFF3BA8E0)),
      const SizedBox(width: 10),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: Color(0xFF888888),
              letterSpacing: 0.8,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1A1A1A),
            ),
          ),
        ],
      ),
    ],
  );
}
