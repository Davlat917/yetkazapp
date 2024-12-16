import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:tezyetkazz/setup.dart';
import 'package:tezyetkazz/src/core/repository/app_repository.dart';
import 'package:tezyetkazz/src/core/repository/app_repository_impl.dart';
import 'package:tezyetkazz/src/feature/home/view_model/data/entity/category_get_all_for_restaurant_model.dart';
import 'package:tezyetkazz/src/feature/home/view_model/data/entity/category_get_by_restaurant_model.dart';
import 'package:tezyetkazz/src/feature/home/view_model/data/entity/food_get_by_restaurant_id_model.dart';
import 'package:tezyetkazz/src/feature/home/view_model/data/entity/get_restaraunt_model.dart';
import 'package:tezyetkazz/src/feature/map/view_model/vm/geocoding_func.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

final homeVmProvider = ChangeNotifierProvider((ref) => HomeVm());

class HomeVm extends ChangeNotifier {
  HomeVm() {
    buyurtmaBekor(true);
    getCategoryByRestaurant();
    getAllRestaurant(page: 0);
    boxLen();
  }

  void boxLen() {
    storagelen = boxFood.length;
    notifyListeners();
  }

  int storagelen = 0;

  final List<String> listAllCategoryImage = [
    "assets/images/budae-jjigae.png",
    "assets/images/food-serving.png",
    "assets/images/ice-cream.png",
    "assets/images/2024-07-26 00.07.34.jpg",
    "assets/images/cake.png",
    "assets/images/burger.png",
    "assets/images/5154652.png",
    "assets/images/meat-line-icon-free-vector-removebg-preview.png",
    "assets/images/2024-07-26 00.22.09.jpg",
    "assets/images/gift.png",
    "assets/images/sushi.png"
  ];

  final List<String> _list = ['1', '1', '1', '1', '1', '1', '1', '1'];
  List<String> get list => _list;

  bool bekor = false;
  bool loadingCategory = false;
  bool loadingRestaurant = false;
  bool loadingFood = false;
  bool loadingFoodCategory = false;
  bool loadingRestaurantDetail = false;
  bool loadingHome = false;
  String categoryName = "Barchasi";

  AppRepo appRepo = AppRepositoryImpl();
  // GetAllCategoryModel? getAllCategoryModel;
  GetRestaurantModel? getRestaurantModel;
  CategoryGetByRestaurantModel? categoryGetByRestaurantModel;
  FoodGetByRestaurantIdModel? foodGetByRestaurantIdModel;
  CategoryGetAllForRestaurantModel? categoryGetAllForRestaurantModell;

  late Position myPosition;
  String myLocationName = 'Toshkent Region';
  bool isloadingCategory = false;
  late YandexMapController yandexMapController;
  List<MapObject> mapObjects = [];

  final List<String> _iconsList = [
    "assets/images/budae-jjigae.png",
    "assets/images/food-serving.png",
  ];

  List<String> get iconsList => _iconsList;

  void buyurtmaBekor(bool atmen) {
    bekor = atmen;
    notifyListeners();
  }

  Future<void> onRefresh() async {
    await Future.delayed(const Duration(seconds: 2));
    getCategoryByRestaurant();
    notifyListeners();
  }

  Future<void> centerMapOnUser() async {
    if (isloadingCategory) {
      await yandexMapController.moveCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: Point(latitude: myPosition.latitude, longitude: myPosition.longitude),
            zoom: 15,
          ),
        ),
      );
      myLocationName = await getAddressFromLatLong(myPosition.latitude, myPosition.longitude);
      putLabel(myPosition);
      notifyListeners();
    }
  }

  void putLabel(Position position) {
    PlacemarkMapObject placemarkMapObject = PlacemarkMapObject(
      mapId: const MapObjectId("myLocation"),
      point: Point(
        latitude: position.latitude,
        longitude: position.longitude,
      ),
      opacity: 1,
      icon: PlacemarkIcon.single(
        PlacemarkIconStyle(
          image: BitmapDescriptor.fromAssetImage("assets/images/img.png"),
          scale: 0.4,
        ),
      ),
    );

    mapObjects.add(placemarkMapObject);
    log('Placed label at: ${position.latitude}, ${position.longitude}');
  }

  void getCategoryName({required String name}) async {
    categoryName = name;
    notifyListeners();
  }

  // void getAllCategory() async {
  //   debugPrint("Alikkkkkkkkkkkk");
  //   loadingCategory = true;
  //   notifyListeners();
  //   getAllCategoryModel = await appRepo.getAllCategory();
  //   debugPrint("${getAllCategoryModel} ListCategoryModel >>>>>");
  //   loadingCategory = false;
  //   notifyListeners();
  // }

  void getAllRestaurant({required int page}) async {
    loadingRestaurant = true;
    notifyListeners();
    getRestaurantModel = await appRepo.getRestaurantModel(page: page);
    loadingRestaurant = false;
    notifyListeners();
  }

  void getRestaurantCategoryId({required int page, required String categoryId}) async {
    loadingRestaurant = true;
    notifyListeners();
    getRestaurantModel = await appRepo.getRestaurantCategoryIdModel(page: page, categoryId: categoryId);
    loadingRestaurant = false;
    notifyListeners();
  }

  void getCategoryByRestaurant() async {
    loadingCategory = true;
    notifyListeners();
    categoryGetByRestaurantModel = await appRepo.getCategoryByRestaurant();
    loadingCategory = false;
    notifyListeners();
  }

  void getFoodByRestaurant({required int page, required String restaurantId}) async {
    loadingFood = true;
    notifyListeners();
    foodGetByRestaurantIdModel = await appRepo.getFoodByRestaurant(page: page, restaurantId: restaurantId);
    loadingFood = false;
    notifyListeners();
  }

  void getHomeLoading() {
    loadingHome = true;
    notifyListeners();

    loadingHome = false;
    notifyListeners();
  }
}
