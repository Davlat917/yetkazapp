import "dart:convert";
import "dart:developer";

import "package:flutter/widgets.dart";
import "package:tezyetkazz/src/core/api/api.constants.dart";
import "package:tezyetkazz/src/core/api/api.dart";
import "package:tezyetkazz/src/core/repository/app_repository.dart";
import "package:tezyetkazz/src/core/storage/app_storage.dart";
import "package:tezyetkazz/src/feature/home/view_model/data/entity/category_get_by_restaurant_model.dart";
import "package:tezyetkazz/src/feature/home/view_model/data/entity/food_get_by_restaurant_id_model.dart";
import "package:tezyetkazz/src/feature/home/view_model/data/entity/get_restaraunt_id_model.dart";
import "package:tezyetkazz/src/feature/home/view_model/data/entity/get_restaraunt_model.dart";
import "package:tezyetkazz/src/feature/search/view_model/data/entity/food_search_model.dart";
import "package:tezyetkazz/src/feature/search/view_model/data/entity/restaurant_search_model.dart";

class AppRepositoryImpl implements AppRepo {
  @override
  Future<GetRestaurantModel> getRestaurantModel({required int page}) async {
    var result = await ApiService.get("${ApiConst.getAllRestaurant}?page=$page&size=32", ApiParams.emptyParams());
    return getRestaurantModelFromJson(result!);
  }

  @override
  Future<GetRestaurantModel> getRestaurantCategoryIdModel({required int page, required String categoryId}) async {
    var result = await ApiService.get("${ApiConst.getRestaurantCategoryId}/${categoryId}?page=$page&size=10", ApiParams.emptyParams());
    return getRestaurantModelFromJson(result!);
  }

  @override
  Future<GetRestaurantIdModel> getRestaurantIdModel({required String restaurantId}) async {
    debugPrint("Start");
    var result = await ApiService.get("${ApiConst.getRestaurantId}/$restaurantId", ApiParams.emptyParams());
    debugPrint("REsultttt $result");
    return getRestaurantIdModelFromJson(result!);
  }

  @override
  Future<CategoryGetByRestaurantModel> getCategoryByRestaurant() async {
    debugPrint("RestaurantModel====================");
    var result = await ApiService.get(ApiConst.getCategoryAllByRestaurant, ApiParams.emptyParams());
    debugPrint(result);

    return categoryGetByRestaurantModelFromJson(result!);
  }

  @override
  Future<FoodGetByRestaurantIdModel> getFoodByRestaurant({required int page, required String restaurantId}) async {
    debugPrint("FooooooodddsssModel====================");
    var result = await ApiService.get("${ApiConst.getFoodAllByRestaurant}/${restaurantId}?page=${page}&size=10", ApiParams.emptyParams());
    debugPrint("RESULT================ $result");
    return foodGetByRestaurantIdModelFromJson(result!);
  }

  @override
  Future<SearchFoodModel> getSearchFood({required String query}) async {
    debugPrint("SearchFoodModel====================");
    var result = await ApiService.get("${ApiConst.getSearchFood}?foodName=$query", ApiParams.emptyParams());
    debugPrint("==========SearchResult===========");
    return searchFoodModelFromJson(result!);
  }

  @override
  Future<SearchRestaurantModel> getSearchRestaurant({required String queryRestaurant}) async {
    debugPrint("SearchRestaurantModel====================");
    var result = await ApiService.get("${ApiConst.getSearchRestaurant}?restaurantName=$queryRestaurant", ApiParams.emptyParams());
    debugPrint("==========SearchResultRestaurant===========");
    return searchRestaurantModelFromJson(result!);
  }

  @override
  Future<void> postData({
    required String email,
    required String password,
  }) async {
    try {
      debugPrint("Sending API request to create account...");
      await ApiService.post(
        ApiConst.createAccount,
        {
          "email": email,
          "password": password,
          "firstName": "firstName",
          "lastName": "lastName",
          "phoneNumber": "+998000000000",
          "birthDate": "2024-12-05T11:21:07.417Z",
          "gender": true,
        },
      );
      log("====Account creation successful.====");
    } catch (e) {
      log("<<<<<Error occurred while creating account: $e>>>>>");
    }
  }

  @override
  Future<void> postEmail({required String email}) async {
    log("+++++++Post Email+++++++");
    await ApiService.post(
      '${ApiConst.sendingEmail}/$email',
      ApiParams.emptyParams(),
    );
  }

  @override
  Future<bool> postOtp({required String email, required String code}) async {
    try {
      // Send OTP verification request
      final res = await ApiService.post(
        ApiConst.verifyEmail,
        {
          "email": email,
          "code": int.parse(code),
        },
      );

      log("OTP Verification Response: $res");

      return true;
    } catch (e) {
      debugPrint("STATUS ERROR: $e");
      return false;
    }
  }

  @override
  Future<bool> getToken({required String email, required String password}) async {
    try {
      final data = await ApiService.post(ApiConst.apiToken, {
        "username": email,
        "password": password,
      });
      final Map<String, dynamic> jsonMap = jsonDecode(data!);
      final String token = jsonMap['data']['accessToken'];

      debugPrint("Token retrieved: $token");
      await AppStorage.$write(key: StorageKey.accessToken, value: token);

      final res = await AppStorage.$read(key: StorageKey.accessToken);
      debugPrint("Stored token: $res");

      return true;
    } catch (e) {
      debugPrint("Error retrieving token: $e");
      return false;
    }
  }

  @override
  Future<bool> checkToken() async {
    final res = await AppStorage.$read(key: StorageKey.accessToken);
    return res != null && res.isNotEmpty;
  }
}
