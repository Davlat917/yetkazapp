final class ApiConst {
  const ApiConst._();

  static const Duration connectionTimeout = Duration(minutes: 1);
  static const Duration sendTimeout = Duration(minutes: 1);
  static const Duration receiveTimeout = Duration(minutes: 1);

  static const String baseUrl = "http://192.168.1.109:8080";
  static const String version = "/api/v1";

  // Home
  static const String getAllRestaurant = "$version/restaurant/get-all";
  static const String getAllCategory = "$version/category/get-all";
  static const String getRestaurantCategoryId = "$version/restaurant/get-all-by-category";
  static const String getRestaurantId = "$version/restaurant/get";
  static const String getCategoryAllByRestaurant = "$version/category/get-all-by-restaurant";
  static const String getFoodAllByRestaurant = "$version/food/get-all-by-restaurant";

  // auth
  static const String apiToken = "$version/token";
  // static const String createAccount = "$version/auth/register";
  // static const String verifyEmail = "$version/auth/verify/email";

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
