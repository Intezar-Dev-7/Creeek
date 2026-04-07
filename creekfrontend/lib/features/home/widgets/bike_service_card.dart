import 'package:flutter/material.dart';
import 'book_now_button.dart';

class BikeServiceData {
  final String title;
  final List<String> features;

  const BikeServiceData({required this.title, required this.features});
}

class BikeServiceCard extends StatelessWidget {
  final BikeServiceData data;
  const BikeServiceCard({super.key, required this.data});

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
        // Title with blue dot
        Row(
          children: [
            Container(
              width: 10,
              height: 10,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF3BA8E0),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              data.title,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w800,
                color: Color(0xFF1A1A1A),
                letterSpacing: 0.3,
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),

        // Feature list (plain text, no icons)
        ...data.features.map(
          (f) => Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Text(
              f,
              style: const TextStyle(
                fontSize: 13,
                color: Color(0xFF444444),
                height: 1.4,
              ),
            ),
          ),
        ),

        const SizedBox(height: 18),
        BookNowButton(
          onPressed: () {
            // TODO: navigate to booking detail
          },
        ),
      ],
    ),
  );
}
