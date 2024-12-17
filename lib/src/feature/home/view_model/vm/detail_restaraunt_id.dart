import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tezyetkazz/setup.dart';
import 'package:tezyetkazz/src/core/repository/app_repository.dart';
import 'package:tezyetkazz/src/core/repository/app_repository_impl.dart';
import 'package:tezyetkazz/src/core/widgets/button_navigation_bar.dart';
import 'package:tezyetkazz/src/feature/home/view_model/data/entity/category_get_all_for_restaurant_model.dart';
import 'package:tezyetkazz/src/feature/home/view_model/data/entity/food_get_all_by_categoryid_model.dart';
import 'package:tezyetkazz/src/feature/home/view_model/data/entity/food_storage_model.dart';
import 'package:tezyetkazz/src/feature/home/view_model/data/entity/get_restaraunt_id_model.dart';

final restaurantDetailVm = ChangeNotifierProvider((ref) => RestaurantDetail());

class RestaurantDetail extends ChangeNotifier {
  RestaurantDetail() {
    jamiSumma();
  }

  bool loadingRestaurantDetail = false;
  bool loadingFoodCategory = false;
  bool loadingFoods = false;
  bool loadingBody = false;

  num sum = 0;

  AppRepo appRepo = AppRepositoryImpl();
  GetRestaurantIdModel? getRestaurantIdModel;
  CategoryGetAllForRestaurantModel? categoryGetAllForRestaurantModel;
  FoodGetAllByCategoryIdModel? foodGetAllByCategoryIdModel;

  void jamiSumma() {
    sum = 0; // Reset sum
    for (var item in boxFood.values) {
      sum += (item.price ?? 0) * (item.count ?? 1);
    }
    notifyListeners();
  }

  // Savatdan mahsulotni o'chirish
  void savatDelete(int index) {
    boxFood.deleteAt(index);
    jamiSumma(); // Update the total sum after deletion
  }

  // Mahsulot miqdorini oshirish
  void increment(int index) {
    final before = boxFood.values.toList()[index];
    int count = before.count ?? 0;
    count++;
    boxFood.putAt(
      index,
      FoodStorageModel(
        name: before.name,
        uploadPath: before.uploadPath,
        price: before.price,
        count: count,
      ),
    );
    jamiSumma(); // Update the total sum after increment
  }

  // Mahsulot miqdorini kamaytirish
  void decrement(int index) {
    final before = boxFood.values.toList()[index];
    int count = before.count ?? 0;
    if (count > 1) {
      // Prevent count from going below 1
      count--;
      boxFood.putAt(
        index,
        FoodStorageModel(
          name: before.name,
          uploadPath: before.uploadPath,
          price: before.price,
          count: count,
        ),
      );
      jamiSumma(); // Update the total sum after decrement
    }
  }

  // Savatga mahsulot qo'shish
  void addToCart(FoodStorageModel product) {
    int existingIndex = boxFood.values.toList().indexWhere((item) => item.name == product.name);

    if (existingIndex != -1) {
      // Agar mahsulot mavjud bo'lsa, miqdorini oshirish
      final existingProduct = boxFood.getAt(existingIndex);
      boxFood.putAt(
        existingIndex,
        FoodStorageModel(
          name: existingProduct!.name,
          uploadPath: existingProduct.uploadPath,
          price: existingProduct.price,
          count: (existingProduct.count ?? 0) + product.count!,
        ),
      );
    } else {
      // Yangi mahsulotni qo'shish
      boxFood.add(product);
    }

    jamiSumma(); // Jami summani yangilash
  }

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
