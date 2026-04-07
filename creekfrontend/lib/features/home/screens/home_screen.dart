import 'package:creekfrontend/features/home/widgets/bike_service_card.dart';
import 'package:creekfrontend/features/home/widgets/location_header.dart';
import 'package:creekfrontend/features/home/widgets/section_title.dart';
import 'package:creekfrontend/features/home/widgets/wash_package_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const _washPackages = [
    WashPackageData(
      tag: 'CARS & BIKES',
      title: 'BASIC WASH',
      duration: '30 mins',
      price: '₹399',
      features: ['Pressure wash', 'Quick tyre wash', 'Matt cleaning'],
      extraCount: 0,
    ),
    WashPackageData(
      tag: 'CARS & BIKES',
      title: 'SUPER WASH',
      duration: '45 mins',
      price: '₹599',
      features: ['2-Step foam', 'Detailed tyres', 'Vacuum clean'],
      extraCount: 0,
    ),
    WashPackageData(
      tag: 'CAR OR BIKE',
      title: 'ULTIMATE WASH',
      duration: '60 mins',
      price: '₹999',
      features: [
        'Pressure Wash',
        '2-Step Premium Foam',
        'Detailed Tyre Polish',
      ],
      extraCount: 5,
    ),
  ];

  static const _bikePackages = [
    BikeServiceData(
      title: 'GENERAL SERVICE',
      features: [
        'Engine oil change',
        'Air filter cleaning',
        'Chain tightening and lubrication',
        'Minor brake adjustment',
      ],
    ),
    BikeServiceData(
      title: 'MEDIUM SERVICE',
      features: [
        'Includes all General Service tasks',
        'Spark plug cleaning or replacement',
        'Brake pads/shoes inspection',
        'Carburetor or fuel injector cleaning',
        'Lubrication of all moving parts',
      ],
    ),
    BikeServiceData(
      title: 'ADVANCED SERVICE',
      features: [
        'Includes all Medium Service tasks',
        'Tappet (valve clearance) adjustment',
        'Clutch plate inspection',
        'Wheel bearing greasing',
        'Front fork oil replacement',
        'Coolant top-up',
        'Complete diagnostic scanning',
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: const Color(0xFFF0F4F8),
    body: SafeArea(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
        children: [
          const LocationHeader(),
          const SizedBox(height: 20),
          ..._washPackages.map(
            (p) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: WashPackageCard(data: p),
            ),
          ),
          const SectionTitle(title: 'BIKE SERVICING PACKAGES'),
          const SizedBox(height: 12),
          ..._bikePackages.map(
            (p) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: BikeServiceCard(data: p),
            ),
          ),
        ],
      ),
    ),
  );
}
