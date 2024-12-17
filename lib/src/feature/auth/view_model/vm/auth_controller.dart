import 'dart:async';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tezyetkazz/src/core/api/api.constants.dart';
import 'package:tezyetkazz/src/core/repository/app_repository.dart';
import 'package:tezyetkazz/src/core/repository/app_repository_impl.dart';
import 'package:tezyetkazz/src/core/widgets/button_navigation_bar.dart';
import 'package:tezyetkazz/src/feature/auth/view/pages/verification_page.dart';
import 'package:tezyetkazz/src/feature/profile/view/pages/profile_edit_page.dart';

final authVmProvider = ChangeNotifierProvider((ref) => AuthVm());

class AuthVm extends ChangeNotifier {
  AuthVm() {}

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  AppRepo appRepo = AppRepositoryImpl();

  void onChanged(String? value) {
    globalKey.currentState!.validate();
    notifyListeners();
  }

  String? validator(String? value) {
    if (value != null && value.isNotEmpty) {
      return null;
    } else {
      return "Please enter your name";
    }
  }

  Future<void> getToken({required String email, required String password, required BuildContext context}) async {
    debugPrint("2222222222222");
    await appRepo.getToken(email: email, password: password);
    await nextPage(context);
  }

  Future<void> nextPage(BuildContext context) async {
    debugPrint("33333333333333");
    await appRepo.checkToken()
        ? Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const ButtonNavigationBar()),
            ModalRoute.withName("/"),
          )
        : "Hello";
  }

  Future<void> postData({required String email, required String password, required BuildContext context}) async {
    final res = await appRepo.postData(email: email, password: password);
    if (res) {
      await Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => VerificationPage(emailController.text, passwordController.text),
        ),
      );
    } else {
      final result = await appRepo.getToken(email: email, password: password);
      if (result) {
        await Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const ProfileEditPage(),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Email yoki parol xato"),
          ),
        );
      }
    }
  }

  Future<void> sendEmail({required String email}) async {
    await appRepo.postEmail(email: email);
  }

  Future<void> otpPost({
    required BuildContext context,
    required String email,
    required String code,
    required String password,
  }) async {
    log('ADs ${code}');
    log("Ads Email >>> $email");
    Dio dio = Dio();
    var otpVerified = await dio.post(
      '${ApiConst.baseUrl}/api/v1/auth/verification',
      data: {
        "email": email,
        "otp": int.parse(code),
      },
    );
    // final otpVerified = await appRepo.postOtp(email: email, code: code);

    if (otpVerified.statusCode == 200 || otpVerified.statusCode == 201) {
      // Navigate to home if OTP verification and token retrieval are successful
      // context.go(AppRouteNames.home);
      getTokenVm(email: email, password: password, context: context);
    } else {
      // Show an error message if OTP verification or token retrieval failed
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to verify OTP or retrieve token')),
      );
    }
  }

  Future<void> getTokenVm({required String email, required String password, required BuildContext context}) async {
    final res = await appRepo.getToken(email: email, password: password);
    if (res) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const ProfileEditPage()),
        (context) => false,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Mavjud emas user')),
      );
    }
  }
}
