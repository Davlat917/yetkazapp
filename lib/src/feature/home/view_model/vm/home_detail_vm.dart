import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tezyetkazz/setup.dart';
import 'package:tezyetkazz/src/core/repository/app_repository.dart';
import 'package:tezyetkazz/src/core/repository/app_repository_impl.dart';
import 'package:tezyetkazz/src/feature/home/view_model/data/entity/food_storage_model.dart';
import 'package:tezyetkazz/src/feature/home/view_model/data/entity/get_restaraunt_id_model.dart';
import 'package:tezyetkazz/src/feature/home/view_model/data/entity/get_restaraunt_model.dart';

final homeDetailVmProvider = ChangeNotifierProvider.autoDispose((ref) => HomeDetailVm());

class HomeDetailVm extends ChangeNotifier {
  HomeDetailVm() {
    log("INDEX:== ALP");

    storageInitName();

    // getFoodAllByCategoryId(id: categoryGetAllForRestaurantModel!.data![0].id.toString(), page: 0);
    // getCategoryAllForRestaurantVm(foodCategoryId: foodGetAllByCategoryIdModel!.data!.data![0].id.toString());
  }

  bool loadingRestaurantDetail = false;
  AppRepo appRepo = AppRepositoryImpl();
  GetRestaurantModel? getRestaurantModel;
  GetRestaurantIdModel? getRestaurantIdModel;

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

  void foodStorageUpdate({
    required int index,
    required String? id,
    required String name,
    required String? uploadPath,
    required num? price,
    required int currentCount,
  }) async {
    await boxFood.putAt(
      index,
      FoodStorageModel(
        id: id,
        name: name,
        uploadPath: uploadPath,
        price: price,
        count: currentCount,
      ),
    );
    notifyListeners();
  }

  void foodStorageAdd({
    required String? id,
    required String name,
    required String? uploadPath,
    required num? price,
    required int currentCount,
  }) async {
    await boxFood.add(FoodStorageModel(
      id: id,
      name: name,
      uploadPath: uploadPath,
      price: price,
      count: currentCount,
    ));
    notifyListeners();
  }
}
