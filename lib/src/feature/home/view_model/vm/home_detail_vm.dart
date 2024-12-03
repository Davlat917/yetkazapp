import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tezyetkazz/src/core/repository/app_repository.dart';
import 'package:tezyetkazz/src/core/repository/app_repository_impl.dart';
import 'package:tezyetkazz/src/feature/home/view/pages/home_detail_page.dart';
import 'package:tezyetkazz/src/feature/home/view_model/data/entity/food_get_by_restaurant_id_model.dart';
import 'package:tezyetkazz/src/feature/home/view_model/data/entity/get_restaraunt_id_model.dart';
import 'package:tezyetkazz/src/feature/home/view_model/data/entity/get_restaraunt_model.dart';

final homeDetailVmProvider = ChangeNotifierProvider((ref) => HomeDetailVm());

class HomeDetailVm extends ChangeNotifier {
  HomeDetailVm() {}

  bool loadingRestaurantDetail = false;

  AppRepo appRepo = AppRepositoryImpl();
  GetRestaurantIdModel? getRestaurantIdModel;
  FoodGetByRestaurantIdModel? foodGetByRestaurantIdModel;
  GetRestaurantModel? getRestaurantModel;

  int count = 1;

  void init() {}

  void increment() {
    count++;
    notifyListeners();
  }

  void decrement() {
    if (count != 1) {
      count--;
    }
    notifyListeners();
  }

  void getRestaurantId({required String restaurantId, required BuildContext context}) async {
    debugPrint("<<<<<<<<<<getAllRestaurant>>>>>>>>>");
    loadingRestaurantDetail = true;
    notifyListeners();
    getRestaurantIdModel = await appRepo.getRestaurantIdModel(restaurantId: restaurantId);
    if (getRestaurantIdModel != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeDetailPage(),
        ),
      );
    } else {
      debugPrint("<<<<<<<<<<Stop>>>>>>>>>");
    }
    loadingRestaurantDetail = false;
    notifyListeners();
  }
}
