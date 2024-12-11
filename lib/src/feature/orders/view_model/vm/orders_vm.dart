import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tezyetkazz/setup.dart';
import 'package:tezyetkazz/src/core/repository/app_repository.dart';
import 'package:tezyetkazz/src/core/repository/app_repository_impl.dart';
import 'package:tezyetkazz/src/core/storage/app_storage.dart';
import 'package:tezyetkazz/src/feature/orders/view_model/data/entity/order_get_all_users_model.dart';
import 'package:tezyetkazz/src/feature/orders/view_model/data/entity/order_get_deliver_model.dart';
import 'package:tezyetkazz/src/feature/orders/view_model/data/entity/order_post_model.dart';
import 'package:tezyetkazz/src/feature/orders/view_model/data/entity/foodm.dart';

final ordersVm = ChangeNotifierProvider((ref) => OrdersVm());

class OrdersVm extends ChangeNotifier {
  OrdersVm() {
    getOrderAllUsersVm(page: 0);
    getOrderAllDeliversVm(page: 0);
  }

  final List<String> steps = ['Qabul qilindi', 'Tayyorlanmoqda', 'Yo\'lda', 'Yetkazildi'];
  final int currentStep = 0;

  bool loadingOrders = false;
  bool loadingDeliverOrders = false;
  AppStorage? storage;
  AppRepo appRepo = AppRepositoryImpl();

  OrderGetAllUsersModel? orderGetAllUsersModel;
  OrderGetDeliverModel? orderGetDeliverModel;
  OrderPostModel? orderPostModel;

  void getOrderAllUsersVm({required int page}) async {
    loadingOrders = true;
    notifyListeners();
    orderGetAllUsersModel = await appRepo.getOrderAllUsers(page: page);
    loadingOrders = false;
    notifyListeners();
  }

  void getOrderAllDeliversVm({required int page}) async {
    loadingDeliverOrders = true;
    notifyListeners();
    orderGetDeliverModel = await appRepo.getOrderAllDelivers(page: page);
    loadingDeliverOrders = false;
    notifyListeners();
  }

  void updateOrderStatusIdVm({required String id}) async {
    await appRepo.updateOrderStatusId(id: id);
    notifyListeners();
    getOrderAllDeliversVm(page: 0);
  }
}
