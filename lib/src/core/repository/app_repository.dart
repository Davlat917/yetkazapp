import 'package:tezyetkazz/src/feature/home/view_model/data/entity/category_get_all_for_restaurant_model.dart';
import 'package:tezyetkazz/src/feature/home/view_model/data/entity/category_get_by_restaurant_model.dart';
import 'package:tezyetkazz/src/feature/home/view_model/data/entity/food_get_all_by_categoryid_model.dart';
import 'package:tezyetkazz/src/feature/home/view_model/data/entity/food_get_by_restaurant_id_model.dart';
import 'package:tezyetkazz/src/feature/home/view_model/data/entity/get_restaraunt_id_model.dart';
import 'package:tezyetkazz/src/feature/home/view_model/data/entity/get_restaraunt_model.dart';
import 'package:tezyetkazz/src/feature/orders/view_model/data/entity/order_get_all_users_model.dart';
import 'package:tezyetkazz/src/feature/orders/view_model/data/entity/order_get_deliver_model.dart';
import 'package:tezyetkazz/src/feature/orders/view_model/data/entity/order_post_model.dart';
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

  Future<SearchFoodModel> getSearchFood({required String query});

  Future<SearchRestaurantModel> getSearchRestaurant({required String queryRestaurant});

  Future<OrderGetAllUsersModel> getOrderAllUsers({required int page});

  Future<OrderGetDeliverModel> getOrderAllDelivers({required int page});

  Future<void> postOrders({required OrderPostModel orderPostModel});

  Future<void> updateOrderStatusId({required String id});

  Future<FoodGetByRestaurantIdModel> getFoodByRestaurant({required int page, required String restaurantId});

  Future<CategoryGetAllForRestaurantModel> getCategoryAllForRestaurant({required String foodCategoryId});

  Future<FoodGetAllByCategoryIdModel> getFoodAllByCategoryId({required String id, required int page});
}
