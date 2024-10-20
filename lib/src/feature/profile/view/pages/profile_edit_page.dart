import 'package:flutter/material.dart';
import '../../../../core/widgets/button_widget.dart';
import '../widget/profile_edit_textfield_widget.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({super.key});

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade600,
        title: const Text("Ma'lumotlarni o'zgartirish"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            const ProfileEditTextfieldWidget(text: 'Ism:'),
            const SizedBox(height: 20),
            const ProfileEditTextfieldWidget(text: 'Familiya:'),
            const SizedBox(height: 20),
            const ProfileEditTextfieldWidget(text: "Tug'ilgan sana:"),
            const SizedBox(height: 30),
            ButtonWidget(
              text: "Saqlash",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
