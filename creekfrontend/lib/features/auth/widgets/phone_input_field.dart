import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhoneInputField extends StatelessWidget {
  final TextEditingController controller;
  final String selectedCode;
  final ValueChanged<String> onCodeChanged;

  const PhoneInputField({
    super.key,
    required this.controller,
    required this.selectedCode,
    required this.onCodeChanged,
  });

  static const _countryCodes = ['+91', '+1', '+44', '+61', '+971'];

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'Phone Number',
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: Color(0xFF1A1A1A),
        ),
      ),
      const SizedBox(height: 8),
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFF3BA8E0), width: 1.5),
        ),
        child: Row(
          children: [
            // Country code picker
            _CountryCodePicker(
              value: selectedCode,
              items: _countryCodes,
              onChanged: onCodeChanged,
            ),
            // Divider
            Container(width: 1, height: 24, color: const Color(0xFFE0E0E0)),
            // Phone number input
            Expanded(
              child: TextField(
                controller: controller,
                keyboardType: TextInputType.phone,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF1A1A1A),
                ),
                decoration: const InputDecoration(
                  hintText: 'Enter phone number',
                  hintStyle: TextStyle(color: Color(0xFFBBBBBB), fontSize: 14),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 14),
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

class _CountryCodePicker extends StatelessWidget {
  final String value;
  final List<String> items;
  final ValueChanged<String> onChanged;

  const _CountryCodePicker({
    required this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) => DropdownButtonHideUnderline(
    child: DropdownButton<String>(
      value: value,
      icon: const Icon(
        Icons.keyboard_arrow_down_rounded,
        size: 16,
        color: Color(0xFF888888),
      ),
      padding: const EdgeInsets.only(left: 12, right: 4),
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Color(0xFF1A1A1A),
      ),
      items: items
          .map((c) => DropdownMenuItem(value: c, child: Text(c)))
          .toList(),
      onChanged: (v) => v != null ? onChanged(v) : null,
    ),
  );
}
