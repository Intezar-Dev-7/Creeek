import 'package:flutter/material.dart';

class ScheduledActionRow extends StatelessWidget {
  const ScheduledActionRow({super.key});

  @override
  Widget build(BuildContext context) => Row(
    children: [
      Expanded(
        child: _ActionButton(
          icon: Icons.call_outlined,
          label: 'Call Support',
          onTap: () {
            // TODO: launch phone call
          },
        ),
      ),
      const SizedBox(width: 12),
      Expanded(
        child: _ActionButton(
          icon: Icons.edit_outlined,
          label: 'Edit Booking',
          onTap: () {
            // TODO: navigate to edit booking
          },
        ),
      ),
    ],
  );
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: onTap,
    child: Container(
      height: 48,
      decoration: BoxDecoration(
        color: const Color(0xFFF8FBFF),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE8F0F8)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 16, color: const Color(0xFF3BA8E0)),
          const SizedBox(width: 6),
          Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1A1A1A),
            ),
          ),
        ],
      ),
    ),
  );
}
