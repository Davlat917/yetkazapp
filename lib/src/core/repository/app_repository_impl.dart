import "dart:convert";
import "dart:developer";
import "package:flutter/widgets.dart";
import "package:tezyetkazz/src/core/api/api.constants.dart";
import "package:tezyetkazz/src/core/api/api.dart";
import "package:tezyetkazz/src/core/repository/app_repository.dart";
import "package:tezyetkazz/src/core/storage/app_storage.dart";
import "package:tezyetkazz/src/feature/home/view_model/data/entity/category_get_all_for_restaurant_model.dart";
import "package:tezyetkazz/src/feature/home/view_model/data/entity/category_get_by_restaurant_model.dart";
import "package:tezyetkazz/src/feature/home/view_model/data/entity/food_get_all_by_categoryid_model.dart";
import "package:tezyetkazz/src/feature/home/view_model/data/entity/food_get_by_restaurant_id_model.dart";
import "package:tezyetkazz/src/feature/home/view_model/data/entity/get_restaraunt_id_model.dart";
import "package:tezyetkazz/src/feature/home/view_model/data/entity/get_restaraunt_model.dart";
import "package:tezyetkazz/src/feature/orders/view_model/data/entity/order_get_all_users_model.dart";
import "package:tezyetkazz/src/feature/orders/view_model/data/entity/order_get_deliver_model.dart";
import "package:tezyetkazz/src/feature/orders/view_model/data/entity/order_post_model.dart";
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
  Future<GetRestaurantIdModel> getRestaurantIdModel({required String resId}) async {
    log("Start====NNMMN==$resId");
    var result = await ApiService.get("${ApiConst.getRestaurantId}/$resId", ApiParams.emptyParams());
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
  Future<bool> postData({
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
      return true;
    } catch (e) {
      log("<<<<<Error occurred while creating account: $e>>>>>");
      getToken(email: email, password: password);
      return false;
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

  @override
  Future<OrderGetAllUsersModel> getOrderAllUsers({required int page}) async {
    log("OrderGetAllUsersModel >>>>>>>>>>");
    var result = await ApiService.get("${ApiConst.getAllUserOrders}?page=1&size=32", ApiParams.emptyParams());
    log("OrderGetAllUsersModel  RESULT  $result>>>>>>>>>>");
    return orderGetAllUsersModelFromJson(result!);
  }

  @override
  Future<OrderGetDeliverModel> getOrderAllDelivers({required int page}) async {
    log("OrderGetDeliverModel >>>>>>>>>>");
    var result = await ApiService.get("${ApiConst.getAllDeliverOrders}?page=$page&size=10", ApiParams.emptyParams());
    log("OrderGetDeliverModel  RESULT  $result>>>>>>>>>>");
    return orderGetDeliverModelFromJson(result!);
  }

  @override
  Future<String> postOrders({required OrderPostModel orderPostModel}) async {
    log("postOrders RESULT======== ${orderPostModel.toJson()}>>>>>>>>>>");

    // Perform the API request
    var result = await ApiService.post(ApiConst.postOrderCreate, orderPostModel.toJson());

    log("postOrders RESULT $result>>>>>>>>>>");

    try {
      // Parse the response
      final parsedResult = jsonDecode(result!);

      // Extract the orderId
      final orderId = parsedResult['data']['orderId'] ?? '';

      log("Extracted orderId: $orderId");
      return orderId; // Return the orderId
    } catch (e) {
      log("Error parsing result or extracting orderId: $e");
      throw Exception("Failed to parse response or extract orderId");
    }
  }

  @override
  Future<CategoryGetAllForRestaurantModel> getCategoryAllForRestaurant({required String foodCategoryId}) async {
    log("CategoryGetAllForRestaurantModel >>>>>>>>>>");
    var result = await ApiService.get("${ApiConst.getCategoryAllForRestaurant}/$foodCategoryId", ApiParams.emptyParams());
    log("CategoryGetAllForRestaurantModel RESULT  $result>>>>>>>>>>");
    return categoryGetAllForRestaurantModelFromJson(result!);
  }

  @override
  Future<FoodGetAllByCategoryIdModel> getFoodAllByCategoryId({required String id, required int page}) async {
    log("FoodGetAllByCategoryIdModel >>>>>>>>>>");
    var result = await ApiService.get("${ApiConst.getFoodCategoryId}/$id?page=$page&size=10", ApiParams.emptyParams());
    log("FoodGetAllByCategoryIdModel RESULT  $result>>>>>>>>>>");
    return foodGetAllByCategoryIdModelFromJson(result!);
  }

  @override
  Future<void> updateOrderDeliverId({required String id, required bool status}) async {
    await ApiService.put(
      "${ApiConst.updateOrderDeliverId}/$id?status=$status",
      {},
    );
  }

  @override
  Future<void> updateOrderStatusId({required String id, required bool status}) async {
    await ApiService.put(
      "${ApiConst.updateOrderStatusId}/$id?status=$status",
      {},
    );
  }
}
