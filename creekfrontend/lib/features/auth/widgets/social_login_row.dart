import 'package:flutter/material.dart';

class SocialLoginRow extends StatelessWidget {
  const SocialLoginRow({super.key});

  @override
  Widget build(BuildContext context) => Row(
    children: [
      Expanded(
        child: _SocialButton(
          label: 'Google',
          backgroundColor: const Color(0xFF3BA8E0),
          textColor: Colors.white,
          icon: _GoogleIcon(),
          onPressed: () {
            // TODO: Google sign-in
          },
        ),
      ),
      const SizedBox(width: 12),
      Expanded(
        child: _SocialButton(
          label: 'Apple',
          backgroundColor: const Color(0xFF1A1A1A),
          textColor: Colors.white,
          icon: const Icon(Icons.apple, color: Colors.white, size: 18),
          onPressed: () {
            // TODO: Apple sign-in
          },
        ),
      ),
    ],
  );
}

class _SocialButton extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color textColor;
  final Widget icon;
  final VoidCallback onPressed;

  const _SocialButton({
    required this.label,
    required this.backgroundColor,
    required this.textColor,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
    height: 48,
    child: ElevatedButton.icon(
      onPressed: onPressed,
      icon: icon,
      label: Text(
        label,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: textColor,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
  );
}

class _GoogleIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) => const Text(
    'G',
    style: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w800,
      color: Colors.white,
    ),
  );
}
