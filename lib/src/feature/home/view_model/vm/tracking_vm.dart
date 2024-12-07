import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tezyetkazz/src/core/storage/app_storage.dart';

final trackingVmProvider = ChangeNotifierProvider((ref) => TrackingVm());

class TrackingVm extends ChangeNotifier {
  bool isCanceled = false; // Add a cancellation flag
  int currentStep = 0;

  TrackingVm() {
    tracking();
    getFoodsAmount();
  }

  String foodsAmount = "";

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

  void getFoodsAmount() async {
    foodsAmount = await AppStorage.$read(key: StorageKey.foodsAmount) ?? "";
    notifyListeners();
  }
}
