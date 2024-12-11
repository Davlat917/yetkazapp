import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tezyetkazz/setup.dart';
import 'package:tezyetkazz/src/core/repository/app_repository.dart';
import 'package:tezyetkazz/src/core/repository/app_repository_impl.dart';
import 'package:tezyetkazz/src/feature/home/view/pages/home_detail_page.dart';
import 'package:tezyetkazz/src/feature/home/view_model/data/entity/category_get_all_for_restaurant_model.dart';
import 'package:tezyetkazz/src/feature/home/view_model/data/entity/food_get_all_by_categoryid_model.dart';
import 'package:tezyetkazz/src/feature/home/view_model/data/entity/food_get_by_restaurant_id_model.dart';
import 'package:tezyetkazz/src/feature/home/view_model/data/entity/food_storage_model.dart';
import 'package:tezyetkazz/src/feature/home/view_model/data/entity/get_restaraunt_id_model.dart';
import 'package:tezyetkazz/src/feature/home/view_model/data/entity/get_restaraunt_model.dart';

final homeDetailVmProvider = ChangeNotifierProvider((ref) => HomeDetailVm());

class HomeDetailVm extends ChangeNotifier {
  HomeDetailVm() {
    storageInitName();
    // getFoodAllByCategoryId(id: categoryGetAllForRestaurantModel!.data![0].id.toString(), page: 0);
    // getCategoryAllForRestaurantVm(foodCategoryId: foodGetByRestaurantIdModel!.data!.data![0].id.toString());
  }

  bool loadingRestaurantDetail = false;
  bool loadingFoods = false;
  bool loadingFoodCategory = false;

  AppRepo appRepo = AppRepositoryImpl();
  GetRestaurantIdModel? getRestaurantIdModel;
  FoodGetByRestaurantIdModel? foodGetByRestaurantIdModel;
  GetRestaurantModel? getRestaurantModel;
  FoodGetAllByCategoryIdModel? foodGetAllByCategoryIdModel;
  CategoryGetAllForRestaurantModel? categoryGetAllForRestaurantModel;

  int count = 1;

  List<String> storageFoodName = [];

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

    // Fetch data from the backend
    getRestaurantIdModel = await appRepo.getRestaurantIdModel(restaurantId: restaurantId);

    // Check if data is received
    if (getRestaurantIdModel != null) {
      // Navigate to the new page if data is available
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeDetailPage(),
        ),
      );
    } else {
      // Show Snackbar if no data is received
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Failed to fetch restaurant details. Please try again."),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
        ),
      );
      debugPrint("<<<<<<<<<<Stop>>>>>>>>>");
    }

    // Stop loading
    loadingRestaurantDetail = false;
    notifyListeners();
  }

  void storageInitName() {
    for (var item in boxFood.values.toList()) {
      storageFoodName.add(item.name!);
    }
  }

  bool containsName(String name) {
    return storageFoodName.contains(name);
  }

  void addToStorage(FoodStorageModel food) {
    boxFood.add(food);
    storageFoodName.add(food.name!);
    notifyListeners();
  }

  void getCategoryAllForRestaurantVm({required String foodCategoryId}) async {
    loadingFoodCategory = true;
    notifyListeners();
    categoryGetAllForRestaurantModel = await appRepo.getCategoryAllForRestaurant(foodCategoryId: foodCategoryId);
    loadingFoodCategory = false;
    notifyListeners();
    getFoodAllByCategoryId(id: categoryGetAllForRestaurantModel!.data![0].id.toString(), page: 0);
  }

  void getFoodAllByCategoryId({required String id, required int page}) async {
    loadingFoods = true;
    notifyListeners();
    foodGetAllByCategoryIdModel = await appRepo.getFoodAllByCategoryId(id: id, page: page);
    loadingFoods = false;
    notifyListeners();
  }
}
