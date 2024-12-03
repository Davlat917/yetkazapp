import 'package:tezyetkazz/src/feature/home/view_model/data/entity/category_get_by_restaurant_model.dart';
import 'package:tezyetkazz/src/feature/home/view_model/data/entity/food_get_by_restaurant_id_model.dart';
import 'package:tezyetkazz/src/feature/home/view_model/data/entity/get_all_category_model.dart';
import 'package:tezyetkazz/src/feature/home/view_model/data/entity/get_restaraunt_id_model.dart';
import 'package:tezyetkazz/src/feature/home/view_model/data/entity/get_restaraunt_model.dart';

abstract class AppRepo {
  AppRepo._();

  void registerPostData({
    required String email,
  });

  // Future<GetAllCategoryModel> getAllCategory();

  Future<GetRestaurantModel> getRestaurantModel({required int page});

  Future<GetRestaurantModel> getRestaurantCategoryIdModel({required int page, required String categoryId});

  Future<GetRestaurantIdModel> getRestaurantIdModel({required String restaurantId});

  Future<CategoryGetByRestaurantModel> getCategoryByRestaurant();

  Future<FoodGetByRestaurantIdModel> getFoodByRestaurant({required int page, required String restaurantId});
}
