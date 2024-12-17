import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final lottieProvider = ChangeNotifierProvider.autoDispose((ref) => LottieVm());

class LottieVm extends ChangeNotifier {
  LottieVm() {
    checkerLottie();
  }

  bool activeLottie = true;

  void checkerLottie() {
    Future.delayed(const Duration(seconds: 1), () {
      activeLottie = false;
      notifyListeners();
    });
  }
}
