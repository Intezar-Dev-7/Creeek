import 'package:flutter/material.dart';

class BookingFeaturesCard extends StatelessWidget {
  final String title;
  final String duration;
  final String tag;
  final List<String> features;

  const BookingFeaturesCard({
    super.key,
    required this.title,
    required this.duration,
    required this.tag,
    required this.features,
  });

  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: const Color(0xFFF8FBFF),
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: const Color(0xFFE8F0F8)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        Text(
          title,
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w900,
            color: Color(0xFF1A1A1A),
            letterSpacing: 0.3,
          ),
        ),
        const SizedBox(height: 6),

        // Duration + tag
        Row(
          children: [
            Text(
              '$duration • $tag',
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: Color(0xFFF0A830),
                letterSpacing: 0.8,
              ),
            ),
          ],
        ),
        const SizedBox(height: 18),

        // Features
        ...features.map((f) => _FeatureRow(text: f)),
      ],
    ),
  );
}

class _FeatureRow extends StatelessWidget {
  final String text;
  const _FeatureRow({required this.text});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Row(
      children: [
        const Icon(
          Icons.check_circle_outline_rounded,
          size: 17,
          color: Color(0xFF3BA8E0),
        ),
        const SizedBox(width: 10),
        Text(
          text,
          style: const TextStyle(fontSize: 14, color: Color(0xFF333333)),
        ),
      ],
    ),
  );
}
