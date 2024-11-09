import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final trackingVmProvider = ChangeNotifierProvider((ref) => TrackingVm());

class TrackingVm extends ChangeNotifier {
  bool isCanceled = false; // Add a cancellation flag
  int currentStep = 0;

  TrackingVm() {
    tracking(); // Start tracking on initialization
  }

  void tracking() {
    Timer.periodic(const Duration(seconds: 10), (timer) {
      if (isCanceled || currentStep >= 3) {
        timer.cancel();
      } else {
        currentStep++;
        notifyListeners();
      }
    });
  }

  void cancelOrder() {
    isCanceled = true;
    notifyListeners();
  }
}
