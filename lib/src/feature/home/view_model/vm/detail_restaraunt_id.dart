import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tezyetkazz/src/core/repository/app_repository.dart';
import 'package:tezyetkazz/src/core/repository/app_repository_impl.dart';
import 'package:tezyetkazz/src/core/widgets/button_navigation_bar.dart';
import 'package:tezyetkazz/src/feature/home/view_model/data/entity/category_get_all_for_restaurant_model.dart';
import 'package:tezyetkazz/src/feature/home/view_model/data/entity/food_get_all_by_categoryid_model.dart';
import 'package:tezyetkazz/src/feature/home/view_model/data/entity/food_storage_model.dart';
import 'package:tezyetkazz/src/feature/home/view_model/data/entity/get_restaraunt_id_model.dart';

import '../../../../../setup.dart';

final restaurantDetailVm = ChangeNotifierProvider((ref) => RestaurantDetail());

class RestaurantDetail extends ChangeNotifier {
  RestaurantDetail();

  bool loadingRestaurantDetail = false;
  bool loadingFoodCategory = false;
  bool loadingFoods = false;
  bool loadingBody = false;

  AppRepo appRepo = AppRepositoryImpl();
  GetRestaurantIdModel? getRestaurantIdModel;
  CategoryGetAllForRestaurantModel? categoryGetAllForRestaurantModel;
  FoodGetAllByCategoryIdModel? foodGetAllByCategoryIdModel;

  Future<bool> getRestaurantId({required String resID}) async {
    print("Helooooooooooooooo===");
    loadingRestaurantDetail = true;
    notifyListeners();
    getRestaurantIdModel = await appRepo.getRestaurantIdModel(resId: resID);
    notifyListeners();

    if (getRestaurantIdModel != null) {
      notifyListeners();
      getCategoryAllForRestaurantVm(foodCategoryId: resID);
      return true;
    } else {}
    loadingRestaurantDetail = false;
    notifyListeners();
    return false;
  }

// category
  void getCategoryAllForRestaurantVm({required String foodCategoryId}) async {
    loadingFoodCategory = true;
    notifyListeners();
    categoryGetAllForRestaurantModel = await appRepo.getCategoryAllForRestaurant(foodCategoryId: foodCategoryId);
    loadingFoodCategory = false;
    notifyListeners();
    getFoodAllByCategoryId(id: categoryGetAllForRestaurantModel!.data![0].id.toString(), page: 0);
  }

// category food
  void getFoodAllByCategoryId({required String id, required int page}) async {
    print('Salommmlar');
    loadingFoods = true;
    notifyListeners();
    foodGetAllByCategoryIdModel = await appRepo.getFoodAllByCategoryId(id: id, page: page);
    loadingFoods = false;
    notifyListeners();
  }

  void tokenBox() {
    selectedIndex = 2;
    notifyListeners();
  }
}
