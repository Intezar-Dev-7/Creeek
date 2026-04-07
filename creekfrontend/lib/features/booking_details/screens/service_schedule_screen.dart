import 'package:creekfrontend/core/navigation/bottom_nav_bar.dart';
import 'package:creekfrontend/features/booking_details/widgets/schedule_action_row.dart';
import 'package:creekfrontend/features/booking_details/widgets/schedule_success_icon.dart';
import 'package:creekfrontend/features/booking_details/widgets/scheduled_detail_card.dart';
import 'package:flutter/material.dart';

class ServiceScheduledScreen extends StatelessWidget {
  final String packageName;
  final String price;

  const ServiceScheduledScreen({
    super.key,
    required this.packageName,
    required this.price,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.white,
    body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const Spacer(),

            const ScheduledSuccessIcon(),
            const SizedBox(height: 24),

            // Heading
            const Text(
              'SERVICE SCHEDULED!',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w900,
                color: Color(0xFF1A1A1A),
                letterSpacing: 0.4,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Your booking is confirmed for Goa.',
              style: TextStyle(fontSize: 13, color: Color(0xFF888888)),
            ),
            const SizedBox(height: 28),

            ScheduledDetailCard(packageName: packageName),
            const SizedBox(height: 20),

            const ScheduledActionRow(),
            const Spacer(),

            // Done button
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () => Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const BottomNav()),
                  (route) => false,
                ),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  padding: EdgeInsets.zero,
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                    side: const BorderSide(
                      color: Color(0xFF1A1A1A),
                      width: 1.5,
                    ),
                  ),
                ),
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFFFFC84A), Color(0xFFF0A830)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: const Center(
                    child: Text(
                      'DONE',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        letterSpacing: 1.4,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    ),
  );
}
