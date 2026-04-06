import 'package:creekfrontend/core/navigation/bottom_nav_bar.dart';
import 'package:creekfrontend/features/auth/widgets/login_header.dart';
import 'package:creekfrontend/features/auth/widgets/otp_input_field.dart';
import 'package:creekfrontend/features/auth/widgets/resend_timer.dart';
import 'package:creekfrontend/features/auth/widgets/signup_redirect.dart';
import 'package:creekfrontend/features/auth/widgets/verify_button.dart';
import 'package:flutter/material.dart';

class OtpScreen extends StatefulWidget {
  final String phoneNumber;
  final String countryCode;

  const OtpScreen({
    super.key,
    required this.phoneNumber,
    required this.countryCode,
  });

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final List<TextEditingController> _controllers = List.generate(
    6,
    (_) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());

  String get _otp => _controllers.map((c) => c.text).join();

  void _onOtpChanged(int index, String value) {
    if (value.length == 1 && index < 5) {
      _focusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }
    setState(() {});
  }

  void _onVerify() {
    if (_otp.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter the complete OTP')),
      );
      return;
    }
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const BottomNav()),
      (route) => false,
    );
    debugPrint('OTP entered: $_otp');
  }

  void _onResend() {
    for (final c in _controllers) {
      c.clear();
    }
    _focusNodes.first.requestFocus();
    setState(() {});
    // TODO: resend OTP API call
    debugPrint('OTP resent to: ${widget.countryCode} ${widget.phoneNumber}');
  }

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    for (final f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: const Color(0xFFF0F4F8),
    body: SafeArea(
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const LoginHeader(),
                const SizedBox(height: 28),
                OtpInputRow(
                  controllers: _controllers,
                  focusNodes: _focusNodes,
                  onChanged: _onOtpChanged,
                ),
                const SizedBox(height: 12),
                ResendTimer(onResend: _onResend),
                const SizedBox(height: 20),
                VerifyButton(onPressed: _onVerify, isEnabled: _otp.length == 6),
                const SizedBox(height: 24),
                const SignupRedirect(),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
