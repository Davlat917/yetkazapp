import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tezyetkazz/src/feature/profile/view/widget/profile_edit_textfield_widget.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kirish"),
      ),
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            ProfileEditTextfieldWidget(text: "Email"),
            const SizedBox(height: 20),
            ProfileEditTextfieldWidget(text: "Parol"),
          ],
        ),
      ),
    );
  }
}
