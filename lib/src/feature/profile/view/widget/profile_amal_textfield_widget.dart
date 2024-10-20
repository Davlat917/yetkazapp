import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AmalTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;

  const AmalTextFieldWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: [DateInputFormatter()],
      decoration: InputDecoration(
        hintText: 'oy/yil',
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide.none,
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      ),
    );
  }
}

class DateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length > 5) {
      return oldValue;
    }
    String newText = newValue.text.replaceAll('/', '');
    if (newText.length >= 3) {
      newText = '${newText.substring(0, 2)}/${newText.substring(2)}';
    }
    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
