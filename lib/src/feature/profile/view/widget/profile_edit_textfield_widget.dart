import 'package:flutter/material.dart';

class ProfileEditTextfieldWidget extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  final String? hintText;
  final TextEditingController? textEditingController;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;

  ProfileEditTextfieldWidget({
    super.key,
    required this.text,
    this.onTap,
    this.hintText,
    this.textEditingController,
    this.onChanged,
    this.validator,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onChanged: onChanged,
      controller: textEditingController,
      readOnly: onTap != null,
      onTap: onTap,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        label: Text(text),
        hintText: hintText,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.yellow.shade600,
          ),
        ),
      ),
    );
  }
}
