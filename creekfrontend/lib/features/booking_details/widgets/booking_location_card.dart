import 'package:flutter/material.dart';

class BookingLocationCard extends StatelessWidget {
  const BookingLocationCard({super.key});

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: const Color(0xFFF8FBFF),
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: const Color(0xFFE8F0F8)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Address row
        const Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.location_on_outlined,
              size: 18,
              color: Color(0xFF3BA8E0),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                'Villa 12, Calangute Beach Road, Goa',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1A1A1A),
                  height: 1.4,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),

        // Amenity chips
        Row(
          children: [
            _AmenityChip(
              icon: Icons.electrical_services_rounded,
              label: 'Electricity',
            ),
            const SizedBox(width: 10),
            _AmenityChip(icon: Icons.water_drop_outlined, label: 'Water'),
          ],
        ),
      ],
    ),
  );
}

class _AmenityChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const _AmenityChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
    decoration: BoxDecoration(
      color: const Color(0xFFE8F4FB),
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: const Color(0xFF3BA8E0), width: 0.8),
    ),
    child: Row(
      children: [
        Icon(icon, size: 13, color: const Color(0xFF3BA8E0)),
        const SizedBox(width: 5),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Color(0xFF3BA8E0),
          ),
        ),
      ],
    ),
  );
}
