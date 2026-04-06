import 'package:creekfrontend/features/bike_servicing/screens/bike_servicing.dart';
import 'package:creekfrontend/features/bookings/screens/bookings_screen.dart';
import 'package:creekfrontend/features/home/screens/home_screen.dart';
import 'package:creekfrontend/features/user_profile/screens/user_profile_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomeScreen(),
    ServicingScreen(),
    BookingsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.white,
    extendBody: true,
    body: _pages[_currentIndex],
    bottomNavigationBar: CurvedNavigationBar(
      index: _currentIndex,
      height: 65,
      backgroundColor: Colors.transparent,
      color: Colors.white,
      buttonBackgroundColor: const Color(0xFFF0A830),
      animationDuration: const Duration(milliseconds: 340),
      animationCurve: Curves.easeInOut,
      onTap: (index) => setState(() => _currentIndex = index),
      items: [
        _navItem(Icons.home_rounded, 'Home', 0),
        _navItem(Icons.build_rounded, 'Servicing', 1),
        _navItem(Icons.calendar_month_rounded, 'Bookings', 2),
        _navItem(Icons.person_outline_rounded, 'Profile', 3),
      ],
    ),
  );

  Widget _navItem(IconData icon, String label, int index) => Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(
        icon,
        size: 24,
        color: _currentIndex == index ? Colors.white : const Color(0xFF3BA8E0),
      ),
      if (_currentIndex != index) ...[
        const SizedBox(height: 3),
        Text(
          label,
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: Color(0xFF888888),
          ),
        ),
      ],
    ],
  );
}
