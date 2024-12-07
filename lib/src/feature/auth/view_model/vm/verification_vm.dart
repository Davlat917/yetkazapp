import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final verifyVmProvider = ChangeNotifierProvider((ref) => VerificationVm());

class VerificationVm extends ChangeNotifier {
  VerificationVm() {
    initializeFields();
  }

  late List<FocusNode> focusNodes;
  TextEditingController controllers = TextEditingController();

  int secondsRemaining = 119;
  late Timer _timer;

  void initializeFields() {
    focusNodes = List.generate(6, (_) => FocusNode());
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (secondsRemaining > 0) {
        secondsRemaining--;
        notifyListeners();
      } else {
        timer.cancel();
      }
    });
  }

  void resetTimer() {
    // Cancel the existing timer if running
    if (_timer.isActive) {
      _timer.cancel();
    }
    // Reset seconds and restart the timer
    secondsRemaining = 119;
    notifyListeners();
    startTimer();
  }

  String formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    return "${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}";
  }
}
