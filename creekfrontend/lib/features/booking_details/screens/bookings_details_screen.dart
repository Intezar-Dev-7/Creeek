import 'package:creekfrontend/features/booking_details/screens/service_schedule_screen.dart';
import 'package:creekfrontend/features/booking_details/widgets/booking_app_bar.dart';
import 'package:creekfrontend/features/booking_details/widgets/booking_bottom_bar.dart';
import 'package:creekfrontend/features/booking_details/widgets/booking_features_card.dart';
import 'package:creekfrontend/features/booking_details/widgets/booking_location_card.dart';
import 'package:creekfrontend/features/booking_details/widgets/bookingrequirements_card.dart';
import 'package:flutter/material.dart';

class BookingDetailScreen extends StatelessWidget {
  final String title;
  final String duration;
  final String tag;
  final String price;
  final List<String> features;

  const BookingDetailScreen({
    super.key,
    required this.title,
    required this.duration,
    required this.tag,
    required this.price,
    required this.features,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.white,
    appBar: BookingAppBar(title: title),
    body: ListView(
      padding: const EdgeInsets.all(16),
      children: [
        BookingFeaturesCard(
          title: title,
          duration: duration,
          tag: tag,
          features: features,
        ),
        const SizedBox(height: 16),
        const BookingRequirementsCard(),
        const SizedBox(height: 16),
        const BookingLocationCard(),
        const SizedBox(height: 100),
      ],
    ),
    bottomNavigationBar: BookingBottomBar(
      price: price,
      onConfirm: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) =>
              ServiceScheduledScreen(packageName: title, price: price),
        ),
      ),
    ),
  );
}
