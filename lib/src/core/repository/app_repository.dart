import 'package:tezyetkazz/src/feature/home/view_model/data/entity/category_get_by_restaurant_model.dart';
import 'package:tezyetkazz/src/feature/home/view_model/data/entity/food_get_by_restaurant_id_model.dart';
import 'package:tezyetkazz/src/feature/home/view_model/data/entity/get_restaraunt_id_model.dart';
import 'package:tezyetkazz/src/feature/home/view_model/data/entity/get_restaraunt_model.dart';
import 'package:tezyetkazz/src/feature/search/view_model/data/entity/food_search_model.dart';
import 'package:tezyetkazz/src/feature/search/view_model/data/entity/restaurant_search_model.dart';

abstract class AppRepo {
  AppRepo._();

  Future<void> postData({
    required String email,
    required String password,
  });

  Future<void> postEmail({required String email});

  Future<bool> postOtp({required String email, required String code});

  Future<bool> checkToken();

  Future<bool> getToken({required String email, required String password});

  Future<GetRestaurantModel> getRestaurantModel({required int page});

  Future<GetRestaurantModel> getRestaurantCategoryIdModel({required int page, required String categoryId});

  Future<GetRestaurantIdModel> getRestaurantIdModel({required String restaurantId});

  Future<CategoryGetByRestaurantModel> getCategoryByRestaurant();

  Future<FoodGetByRestaurantIdModel> getFoodByRestaurant({required int page, required String restaurantId});

  Future<SearchFoodModel> getSearchFood({required String query});

  Future<SearchRestaurantModel> getSearchRestaurant({required String queryRestaurant});
}
