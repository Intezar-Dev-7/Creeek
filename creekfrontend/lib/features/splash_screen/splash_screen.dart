import 'package:creekfrontend/features/splash_screen/widgets/brandtext.dart';
import 'package:creekfrontend/features/splash_screen/widgets/dotloader.dart';
import 'package:creekfrontend/features/splash_screen/widgets/iconring.dart';
import 'package:creekfrontend/features/auth/screens/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  /// Single controller drives ALL animations via intervals.
  late final AnimationController _ctrl = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 4000),
  );

  // Entry animations (0 → 22% of timeline)
  late final Animation<double> _opacity = _curved(0.00, 0.22);
  late final Animation<double> _slide = Tween<double>(
    begin: 28,
    end: 0,
  ).animate(_interval(0.00, 0.22, Curves.easeOut));

  // Pulse (22% → 100%, repeats)
  late final Animation<double> _pulse = Tween<double>(
    begin: 1.0,
    end: 1.08,
  ).animate(_interval(0.22, 1.00, Curves.easeInOut));

  // Flame (22% → 100%, repeats)
  late final Animation<double> _flame = Tween<double>(
    begin: -0.10,
    end: 0.10,
  ).animate(_interval(0.22, 1.00, Curves.easeInOut));

  // Dot bounce (0 → 100%, repeats)
  late final Animation<double> _dots = _curved(0.00, 1.00);

  Animation<double> _interval(
    double begin,
    double end, [
    Curve curve = Curves.linear,
  ]) => CurvedAnimation(
    parent: _ctrl,
    curve: Interval(begin, end, curve: curve),
  );

  Animation<double> _curved(double begin, double end) =>
      CurvedAnimation(parent: _ctrl, curve: Interval(begin, end));

  @override
  void initState() {
    super.initState();
    // Run entry once, then loop the rest
    _ctrl.forward().then((_) => _ctrl.repeat());
    // Navigate to SignupScreen after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
    });
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.white,
    body: Center(
      child: AnimatedBuilder(
        animation: _ctrl,
        builder: (_, _) => Opacity(
          opacity: _opacity.value.clamp(0.0, 1.0),
          child: Transform.translate(
            offset: Offset(0, _slide.value),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconRing(pulse: _pulse.value, flame: _flame.value),
                const SizedBox(height: 28),
                const BrandText(),
                const SizedBox(height: 48),
                DotLoader(progress: _dots.value),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
