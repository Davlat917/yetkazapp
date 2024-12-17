import 'dart:async';
import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tezyetkazz/src/core/storage/app_storage.dart';
import 'package:tezyetkazz/src/feature/home/view/pages/home_tracking_page.dart';
import 'package:tezyetkazz/src/feature/orders/view_model/vm/orders_vm.dart';

final trackingVmProvider = ChangeNotifierProvider((ref) => TrackingVm());

class TrackingVm extends ChangeNotifier {
  // Pass OrdersVm to this class

  TrackingVm() {
    // tracking();
    // reset();
    getFoodsAmount();
  }

  // bool isCanceled = false;
  // int currentStep = 0;

  final List<String> steps = [
    'qabul qilindi'.tr(),
    'tayyorlanmoqda'.tr(),
    "yo'lda".tr(),
    'yetkazildi'.tr(),
  ];

  String foodsAmount = "";

  // void reset({bool canceled = false}) {
  //   isCanceled = canceled; // Agar bekor qilinsa, state-ni to'g'irlash
  //   currentStep = 0;
  //   if (!canceled) tracking(); // Faqat bekor qilinmagan bo'lsa, tracking'ni boshlash
  //   notifyListeners();
  // }
  //
  // void tracking() {
  //   Timer.periodic(const Duration(seconds: 10), (timer) {
  //     if (isCanceled || currentStep >= 3) {
  //       timer.cancel();
  //     } else {
  //       currentStep++;
  //       log('CurrentStep=======$currentStep');
  //       if (currentStep == 3) {
  //         OrdersVm ordersVm = OrdersVm();
  //         ordersVm.updateOrderDeliverIdVm(
  //           id: trackingOrderId, // Replace with the actual order ID
  //           status: true, // Replace with the desired status
  //         );
  //         notifyListeners();
  //       }
  //       notifyListeners();
  //     }
  //   });
  //   notifyListeners();
  // }
  //
  // void cancelOrder() {
  //   isCanceled = true;
  //   notifyListeners();
  // }

  void getFoodsAmount() async {
    foodsAmount = await AppStorage.$read(key: StorageKey.foodsAmount) ?? "";
    notifyListeners();
  }
}
