import 'package:creekfrontend/features/auth/screens/otp_screen.dart';
import 'package:creekfrontend/features/auth/widgets/continue_button.dart';
import 'package:creekfrontend/features/auth/widgets/login_header.dart';
import 'package:creekfrontend/features/auth/widgets/phone_input_field.dart';
import 'package:creekfrontend/features/auth/widgets/signup_redirect.dart';
import 'package:creekfrontend/features/auth/widgets/social_login_row.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneController = TextEditingController();
  String _selectedCountryCode = '+91';

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  void _onContinue() {
    final phone = _phoneController.text.trim();
    if (phone.isEmpty || phone.length < 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Enter a valid phone number')),
      );
      return;
    }
    // TODO: navigate to OTP screen
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>
            OtpScreen(phoneNumber: phone, countryCode: _selectedCountryCode),
      ),
    );
    debugPrint('Phone: $_selectedCountryCode $phone');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  PhoneInputField(
                    controller: _phoneController,
                    selectedCode: _selectedCountryCode,
                    onCodeChanged: (val) =>
                        setState(() => _selectedCountryCode = val),
                  ),
                  const SizedBox(height: 20),
                  ContinueButton(onPressed: _onContinue),
                  const SizedBox(height: 20),
                  const _Divider(),
                  const SizedBox(height: 20),
                  const SocialLoginRow(),
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
}

class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) => Row(
    children: [
      const Expanded(child: Divider(color: Color(0xFFE8E8E8))),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Text(
          'Quick Login Options',
          style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
        ),
      ),
      const Expanded(child: Divider(color: Color(0xFFE8E8E8))),
    ],
  );
}
