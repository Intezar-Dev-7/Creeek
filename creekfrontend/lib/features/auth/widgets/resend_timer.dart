import 'dart:async';
import 'package:flutter/material.dart';

class ResendTimer extends StatefulWidget {
  final VoidCallback onResend;
  final int initialSeconds;

  const ResendTimer({
    super.key,
    required this.onResend,
    this.initialSeconds = 53,
  });

  @override
  State<ResendTimer> createState() => _ResendTimerState();
}

class _ResendTimerState extends State<ResendTimer> {
  late int _secondsLeft;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _secondsLeft = widget.initialSeconds;
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (_secondsLeft == 0) {
        t.cancel();
      } else {
        setState(() => _secondsLeft--);
      }
    });
  }

  void _handleResend() {
    setState(() => _secondsLeft = widget.initialSeconds);
    _startTimer();
    widget.onResend();
  }

  String get _formatted {
    final m = _secondsLeft ~/ 60;
    final s = _secondsLeft % 60;
    return '$m:${s.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Align(
    alignment: Alignment.centerRight,
    child: _secondsLeft > 0
        ? RichText(
            text: TextSpan(
              style: const TextStyle(fontSize: 13),
              children: [
                const TextSpan(
                  text: 'Resend OTP in ',
                  style: TextStyle(color: Color(0xFF888888)),
                ),
                TextSpan(
                  text: _formatted,
                  style: const TextStyle(
                    color: Color(0xFF3BA8E0),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          )
        : GestureDetector(
            onTap: _handleResend,
            child: const Text(
              'Resend OTP',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: Color(0xFF3BA8E0),
              ),
            ),
          ),
  );
}
