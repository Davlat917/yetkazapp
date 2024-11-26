import "dart:convert";
import "package:flutter/widgets.dart";
import "package:tezyetkazz/src/core/api/api.constants.dart";
import "package:tezyetkazz/src/core/api/api.dart";
import "package:tezyetkazz/src/core/repository/app_repository.dart";
import "package:tezyetkazz/src/core/storage/app_storage.dart";
import "package:tezyetkazz/src/feature/home/view_model/data/entity/head_category_model.dart";
import "package:tezyetkazz/src/feature/home/view_model/data/entity/restaraunt_category_model.dart";

class AppRepositoryImpl implements AppRepo {
  @override
  Future<bool> getToken({required String email, required String password}) async {
    try {
      final data = await ApiService.post(ApiConst.apiToken, {"email": email, "password": password});
      final Map<String, dynamic> jsonMap = jsonDecode(data!);
      final String token = jsonMap['data']['token'];

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
  void registerPostData({required String email}) {
    // TODO: implement registerPostData
  }

  @override
  Future<List<HeadCategoryModel>> headCategoryGet() async {
    var result = await ApiService.get(ApiConst.getAllCategory, ApiParams.emptyParams());

    debugPrint("${headCategoryModelFromJson(result!)} Birinchi Qadam");

    return headCategoryModelFromJson(result);
  }

  @override
  Future<GetAllCategoryModel> getAllCategory() async {
    debugPrint("Salommmmmmmm");
    var result = await ApiService.get(ApiConst.test, ApiParams.emptyParams());
    debugPrint("${ApiConst.baseUrl}baseUrl ${ApiConst.test} test");

    debugPrint("${getAllCategoryModelFromJson(result!)} RestaurantCategoryGet Birinchi Qadam");

    return getAllCategoryModelFromJson(result);
  }

  // @override
  // Future<void> postData({
  //   required String name,
  //   required String email,
  //   required String password,
  //   required String acceptedPassword,
  // }) async {
  //   try {
  //     debugPrint("Sending API request to create account...");
  //     await ApiService.post(
  //       ApiConst.createAccount,
  //       {
  //         "email": email,
  //         "name": name,
  //         "password": password,
  //         "acceptedPassword": acceptedPassword,
  //       },
  //     );
  //
  //     // Save email and password to storage for later use in getToken
  //     await AppStorage.$write(key: StorageKey.email, value: email);
  //     await AppStorage.$write(key: StorageKey.password, value: password);
  //     debugPrint("Account creation successful.");
  //   } catch (e) {
  //     debugPrint("Error occurred while creating account: $e");
  //   }
  // }

  //
  // @override
  // Future<bool> postOtp({required String email, required String code}) async {
  //   try {
  //     // Send OTP verification request
  //     final res = await ApiService.post(
  //       ApiConst.verifyEmail,
  //       {
  //         "email": email,
  //         "code": code,
  //       },
  //     );
  //
  //     debugPrint("OTP Verification Response: $res");
  //
  //     if (res != null) {
  //       // Decode the JSON response
  //       final Map<String, dynamic> jsonMap = jsonDecode(res);
  //
  //       // Check if 'success' is true
  //       if (jsonMap['success'] == true) {
  //         debugPrint("OTP verification successful.");
  //
  //         // Get the saved email and password from storage
  //         final savedEmail = await AppStorage.$read(key: StorageKey.email);
  //         final savedPassword = await AppStorage.$read(key: StorageKey.password);
  //
  //         if (savedEmail != null && savedPassword != null) {
  //           // Call getToken with the saved credentials
  //           return await getToken(email: savedEmail, password: savedPassword);
  //         } else {
  //           debugPrint("Error: Email or password not found in storage.");
  //           return false;
  //         }
  //       } else {
  //         debugPrint("Error: OTP verification failed.");
  //         return false;
  //       }
  //     } else {
  //       debugPrint("Error: OTP verification response is null.");
  //       return false;
  //     }
  //   } catch (e) {
  //     debugPrint("STATUS ERROR: $e");
  //     return false;
  //   }
  // }
}
