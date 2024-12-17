import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tezyetkazz/src/core/repository/app_repository.dart';
import 'package:tezyetkazz/src/core/repository/app_repository_impl.dart';
import 'package:tezyetkazz/src/core/storage/app_storage.dart';
import 'package:tezyetkazz/src/feature/orders/view_model/data/entity/order_get_all_users_model.dart';
import 'package:tezyetkazz/src/feature/orders/view_model/data/entity/order_get_deliver_model.dart';
import 'package:tezyetkazz/src/feature/orders/view_model/data/entity/order_post_model.dart';

final ordersVmProvider = ChangeNotifierProvider((ref) => OrdersVm());

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
    orderGetAllUsersModel = null;
    notifyListeners();
    loadingOrders = true;
    notifyListeners();

    try {
      final response = await appRepo.getOrderAllUsers(page: page);
      if (response != null && response.data != null && response.data != null) {
        orderGetAllUsersModel = response;
      } else {
        debugPrint("No data received from getOrderAllUsers API");
      }
    } catch (e) {
      debugPrint("Error in getOrderAllUsers: $e");
    }

    loadingOrders = false;
    notifyListeners();
  }

  void getOrderAllDeliversVm({required int page}) async {
    orderGetDeliverModel = null;
    notifyListeners();
    loadingDeliverOrders = true;
    notifyListeners();

    try {
      final response = await appRepo.getOrderAllDelivers(page: page);
      if (response != null && response.data != null && response.data != null) {
        orderGetDeliverModel = response;
      } else {
        debugPrint("No data received from getOrderAllDelivers API");
      }
    } catch (e) {
      debugPrint("Error in getOrderAllDelivers: $e");
    }

    loadingDeliverOrders = false;
    notifyListeners();
  }

  void updateOrderStatusIdVm({required String id, required bool status}) async {
    await appRepo.updateOrderStatusId(id: id, status: status);
    notifyListeners();
    getOrderAllDeliversVm(page: 0);
    getOrderAllUsersVm(page: 0);
  }

  void updateOrderDeliverIdVm({required String id, required bool status}) async {
    await appRepo.updateOrderDeliverId(id: id, status: status);
    notifyListeners();
    getOrderAllDeliversVm(page: 0);
    getOrderAllUsersVm(page: 0);
  }

  Future<void> onRefreshDeliver() async {
    await Future.delayed(const Duration(seconds: 2));
    getOrderAllDeliversVm(page: 0);
    notifyListeners();
  }
}
