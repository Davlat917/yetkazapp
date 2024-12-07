import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tezyetkazz/src/core/widgets/cupertino_eleveted_button_widget.dart';
import 'package:tezyetkazz/src/feature/auth/view/pages/verification_page.dart';
import 'package:tezyetkazz/src/feature/auth/view_model/vm/auth_controller.dart';
import 'package:tezyetkazz/src/feature/auth/view_model/vm/verification_vm.dart';
import 'package:tezyetkazz/src/feature/profile/view/widget/profile_edit_textfield_widget.dart';

class AuthPage extends ConsumerWidget {
  AuthPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var ctrAuth = ref.read(authVmProvider);
    ref.watch(authVmProvider);
    var ctrVerify = ref.read(verifyVmProvider);
    ref.watch(verifyVmProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("Kirish"),
      ),
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: ctrAuth.globalKey,
          child: Column(
            children: [
              ProfileEditTextfieldWidget(
                textEditingController: ctrAuth.emailController,
                text: "Email",
                validator: (value) {
                  if (value != null && value.contains("@gmail.com") && value.length > 3) {
                    return null;
                  } else {
                    return "Invalid email address";
                  }
                },
                onChanged: (value) => ctrAuth.onChanged,
              ),
              const SizedBox(height: 20),
              ProfileEditTextfieldWidget(
                textEditingController: ctrAuth.passwordController,
                text: "Parol",
                validator: (value) {
                  final regex = RegExp(r"^(?=.*?[a-z])(?=.*?[0-9]).{8,}$");
                  if (value != null && regex.hasMatch(value)) {
                    return null;
                  } else {
                    return "Invalid password";
                  }
                },
                onChanged: (value) => ctrAuth.onChanged,
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(20.0),
        child: CupertinoElevetedButtonWidget(
          child: Text(
            "Tasdiqlash",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
          onPressed: () async {
            ctrVerify.initializeFields();
            ctrVerify.startTimer();
            final result = ctrAuth.globalKey.currentState!.validate();
            if (result && ctrAuth.emailController.text.isNotEmpty && ctrAuth.passwordController.text.isNotEmpty) {
              debugPrint("Register button pressed");
              await ctrAuth.postData(
                email: ctrAuth.emailController.text,
                password: ctrAuth.passwordController.text,
              );
              await Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => VerificationPage('${ctrAuth.emailController.text}', "${ctrAuth.passwordController.text}"),
                ),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Ma'lumotlarni to'liq kiriting"),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
