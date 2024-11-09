import 'package:flutter/material.dart';

class ProfileEditTextfieldWidget extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  final String? hintText;
  TextEditingController? textEditingController;
  ProfileEditTextfieldWidget({super.key, required this.text, this.onTap, this.hintText, this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      readOnly: onTap != null,
      onTap: onTap,
      decoration: InputDecoration(
        label: Text(text),
        hintText: hintText,
      ),
    );
  }
}
