import 'package:creekfrontend/features/booking_details/screens/bookings_details_screen.dart';
import 'package:creekfrontend/features/home/widgets/book_now_button.dart';
import 'package:flutter/material.dart';

class WashPackageData {
  final String tag;
  final String title;
  final String duration;
  final String price;
  final List<String> features;
  final int extraCount;

  const WashPackageData({
    required this.tag,
    required this.title,
    required this.duration,
    required this.price,
    required this.features,
    required this.extraCount,
  });
}

class WashPackageCard extends StatelessWidget {
  final WashPackageData data;
  const WashPackageCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(18),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Tag chip
        _TagChip(label: data.tag),
        const SizedBox(height: 10),

        // Title
        Text(
          data.title,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w900,
            color: Color(0xFF1A1A1A),
            letterSpacing: 0.3,
          ),
        ),
        const SizedBox(height: 4),

        // Duration & price
        Text(
          '${data.duration} • ${data.price}',
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: Color(0xFF3BA8E0),
          ),
        ),
        const SizedBox(height: 14),

        // Features
        ...data.features.map((f) => _FeatureRow(text: f)),

        // Extra count
        if (data.extraCount > 0) ...[
          const SizedBox(height: 6),
          Text(
            '+ ${data.extraCount} more features',
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF888888),
              fontStyle: FontStyle.italic,
            ),
          ),
        ],

        const SizedBox(height: 18),
        // In wash_package_card.dart — BookNowButton onPressed
        BookNowButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => BookingDetailScreen(
                  title: data.title,
                  duration: data.duration,
                  tag: data.tag,
                  price: data.price,
                  features: data.features,
                ),
              ),
            );
          },
        ),
      ],
    ),
  );
}

class _TagChip extends StatelessWidget {
  final String label;
  const _TagChip({required this.label});

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
    decoration: BoxDecoration(
      color: const Color(0xFFFFF3E0),
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: const Color(0xFFF0A830), width: 0.8),
    ),
    child: Text(
      label,
      style: const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w700,
        color: Color(0xFFF0A830),
        letterSpacing: 0.6,
      ),
    ),
  );
}

class _FeatureRow extends StatelessWidget {
  final String text;
  const _FeatureRow({required this.text});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: 7),
    child: Row(
      children: [
        const Icon(
          Icons.check_circle_outline_rounded,
          size: 16,
          color: Color(0xFF3BA8E0),
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: const TextStyle(fontSize: 13, color: Color(0xFF444444)),
        ),
      ],
    ),
  );
}
