import 'package:flutter/material.dart';

class ProfileEditTextfieldWidget extends StatelessWidget {
  final String text;
  const ProfileEditTextfieldWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        label: Text(text),
      ),
    );
  }
}
