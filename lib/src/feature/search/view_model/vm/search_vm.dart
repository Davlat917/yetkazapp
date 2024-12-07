import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tezyetkazz/src/core/repository/app_repository.dart';
import 'package:tezyetkazz/src/core/repository/app_repository_impl.dart';
import 'package:tezyetkazz/src/feature/search/view_model/data/entity/food_search_model.dart';
import 'package:tezyetkazz/src/feature/search/view_model/data/entity/restaurant_search_model.dart';

final searchVmProvider = ChangeNotifierProvider((ref) => SearchVm());

class SearchVm extends ChangeNotifier {
  SearchVm() {}

  bool loadingSearch = false;
  bool textActive = false;

  AppRepo appRepo = AppRepositoryImpl();
  SearchFoodModel? searchFoodModel;
  SearchRestaurantModel? searchRestaurantModel;
  List<Datum>? foods = [];
  List<DatumRestaurant>? restaurants = [];

  void getSearchFoodFunctionVm({required String query}) async {
    loadingSearch = true;
    notifyListeners();
    searchFoodModel = await appRepo.getSearchFood(query: query);
    foods = searchFoodModel!.data;
    loadingSearch = false;
    notifyListeners();
  }

  void getSearchRestaurantFunctionVm({required String queryRestaurant}) async {
    loadingSearch = true;
    notifyListeners();
    searchRestaurantModel = await appRepo.getSearchRestaurant(queryRestaurant: queryRestaurant);
    restaurants = searchRestaurantModel!.data;
    loadingSearch = false;
    notifyListeners();
  }

  void focusPage({bool isActive = false}) {
    textActive = isActive;
    notifyListeners();
  }
}
