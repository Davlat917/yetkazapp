final class ApiConst {
  const ApiConst._();

  static const Duration connectionTimeout = Duration(minutes: 1);
  static const Duration sendTimeout = Duration(minutes: 1);
  static const Duration receiveTimeout = Duration(minutes: 1);

  static const String baseUrl = "http://172.20.10.2:8080";
  static const String version = "/api/v1";

  // Gets
  static const String getAllRestaurant = "$version/restaurant/get-all";
  static const String getAllCategory = "$version/category/get-all";
  static const String getRestaurantCategoryId = "$version/restaurant/get-all-by-category";
  static const String getRestaurantId = "$version/restaurant/get";
  static const String getCategoryAllByRestaurant = "$version/category/get-all-by-restaurant";
  static const String getFoodAllByRestaurant = "$version/food/get-all-by-restaurant";
  static const String getSearchFood = "$version/search-food-and-restaurant/get-food";
  static const String getSearchRestaurant = "$version/search-food-and-restaurant/get-restaurant";
  static const String getCategoryAllByFood = "$version/category/get-all-by-food";
  static const String getFoodCategoryId = "$version/food/get-all-by-category";
  static const String getAllUserOrders = "$version/order/get-all-user-orders";
  static const String getAllDeliverOrders = "$version/order/get-all-by-deliver";
  static const String getCategoryAllForRestaurant = "$version/category/get-all-for-restaurant";

  // Posts
  static const String postOrderCreate = "$version/order/create";

  // Update
  static const String updateOrderStatusId = "$version/order/update-status";
  static const String updateOrderDeliverId = "$version/order/update-deliver";

  // Auth
  static const String apiToken = "$version/auth/login";
  static const String createAccount = "$version/auth/registration";
  static const String verifyEmail = "$version/auth/verification";
  static const String sendingEmail = "$version/auth/sending-otp";

  // get all projects list
  // static const String apiGetAllProjects = "$version/mobile/project";

  // additional
  // static const String apiFAQ = "$version/mobile/faq";
  // static const String apiGetHelpCredentials = "$version/mobile/company-info";
  // static const String apiGetPrivacyPolicy = "$version/mobile/doc";
  // static const String apiVerifyUser = "$version/mobile/identification/verificate";
  // static const String apiUserMe = "$version/user/me";
}

final class ApiParams {
  const ApiParams._();

  static Map<String, dynamic> cabinetSmsCheckParams({required String phone, required String code}) => <String, dynamic>{
        "phone": phone,
        "code": code,
      };

  static Map<String, dynamic> emptyParams() => <String, dynamic>{};
}
