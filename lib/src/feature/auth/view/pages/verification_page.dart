import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:tezyetkazz/src/core/widgets/cupertino_eleveted_button_widget.dart';
import 'package:tezyetkazz/src/feature/auth/view_model/vm/auth_controller.dart';
import 'package:tezyetkazz/src/feature/auth/view_model/vm/verification_vm.dart';

class VerificationPage extends ConsumerWidget {
  VerificationPage(this.email, this.password);
  final String email;
  final String password;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var ctrAuth = ref.watch(authVmProvider);
    ref.read(authVmProvider);
    var ctrVerify = ref.watch(verifyVmProvider);
    ref.read(verifyVmProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "SMS kodni kiritish",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: Column(
          children: [
            PinCodeTextField(
              controller: ctrVerify.controllers,
              keyboardType: TextInputType.number,
              appContext: context,
              length: 4,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              pinTheme: PinTheme(
                selectedColor: Colors.amber,
                activeColor: Colors.green,
                shape: PinCodeFieldShape.underline,
                fieldWidth: 50,
                fieldHeight: 70,
                inactiveColor: Colors.black,
              ),
            ),
            20.verticalSpace,
            ctrVerify.secondsRemaining == 0
                ? IconButton(
                    onPressed: () {
                      ctrAuth.sendEmail(email: email);
                      ctrVerify.resetTimer();
                    },
                    icon: Icon(Icons.replay_sharp),
                  )
                : Text(
                    "(${ctrVerify.formatTime(ctrVerify.secondsRemaining)})",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
            Spacer(),
            CupertinoElevetedButtonWidget(
              child: Text(
                "Kirish",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              onPressed: () async {
                print("Entered code: ${ctrVerify.controllers.text}");
                if (ctrVerify.controllers.text.length == 4) {
                  await ctrAuth.otpPost(
                    password: password,
                    context: context,
                    email: email,
                    code: ctrVerify.controllers.text,
                  );
                } else {
                  print("Invalid code length");
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Kod noto'g'ri, qayta urinib ko'ring."),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
