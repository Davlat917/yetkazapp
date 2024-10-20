import 'package:flutter/material.dart';

class AddcardButtonWidget extends StatelessWidget {
  const AddcardButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      color: Colors.grey.shade300,
      height: 35,
      minWidth: double.infinity,
      child: const Text("Davom etish"),
    );
  }
}
