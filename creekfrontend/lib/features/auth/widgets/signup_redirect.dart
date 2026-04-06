import 'package:flutter/material.dart';

class SignupRedirect extends StatelessWidget {
  const SignupRedirect({super.key});

  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text(
        "Don't have account? ",
        style: TextStyle(fontSize: 13, color: Color(0xFF888888)),
      ),
      GestureDetector(
        onTap: () {
          // TODO: navigate to SignupScreen
        },
        child: const Text(
          'Sign Up',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: Color(0xFF3BA8E0),
          ),
        ),
      ),
    ],
  );
}
