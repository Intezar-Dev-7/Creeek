import 'package:flutter/material.dart';

class VerifyButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isEnabled;

  const VerifyButton({
    super.key,
    required this.onPressed,
    this.isEnabled = false,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
    width: double.infinity,
    height: 52,
    child: ElevatedButton(
      onPressed: isEnabled ? onPressed : null,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        backgroundColor: Colors.transparent,
        disabledBackgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      child: Ink(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isEnabled
                ? [const Color(0xFFFFC84A), const Color(0xFFF0A830)]
                : [const Color(0xFFE0E0E0), const Color(0xFFCCCCCC)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(14),
        ),
        child: const Center(
          child: Text(
            'VERIFY OTP',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w800,
              color: Colors.white,
              letterSpacing: 1.2,
            ),
          ),
        ),
      ),
    ),
  );
}
