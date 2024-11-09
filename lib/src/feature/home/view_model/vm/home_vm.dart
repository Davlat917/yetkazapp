import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:tezyetkazz/src/core/api/api.constants.dart';
import 'package:tezyetkazz/src/core/api/api.dart';
import 'package:tezyetkazz/src/core/repository/app_repository_impl.dart';
import 'package:tezyetkazz/src/feature/home/view_model/data/entity/head_category_model.dart';
import 'package:tezyetkazz/src/feature/home/view_model/data/entity/restaraunt_category_model.dart';
import 'package:tezyetkazz/src/feature/map/view_model/vm/geocoding_func.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

final homeVmProvider = ChangeNotifierProvider((ref) => HomeVm());

class HomeVm extends ChangeNotifier {
  HomeVm() {
    buyurtmaBekor(true);
    getHeadCategory();
    getRestaurantCategory();
  }

  final List<String> _list = ['1', '1', '1', '1', '1', '1', '1', '1'];
  List<String> get list => _list;

  bool bekor = false;
  bool loading = false;

  // late AppRepositoryImpl repo;
  // late ApiService service;

  AppRepositoryImpl repositoryImpl = AppRepositoryImpl();
  List<HeadCategoryModel>? listHeadCategoryModel;
  List<RestaurantCategoryModel>? listRestaurantCategoryModel;

  late Position myPosition;
  String myLocationName = 'Toshkent Region';
  bool isLoading = false;
  late YandexMapController yandexMapController;
  List<MapObject> mapObjects = [];

  final List<String> _iconsList = [
    "assets/images/budae-jjigae.png",
    "assets/images/food-serving.png",
  ];

  List<String> get iconsList => _iconsList;

  int count = 1;

  void increment() {
    count++;
    notifyListeners();
  }

  void decrement() {
    if (count != 1) {
      count--;
    }
    notifyListeners();
  }

  void buyurtmaBekor(bool atmen) {
    bekor = atmen;
    notifyListeners();
  }

  Future<void> onRefresh() async {
    await Future.delayed(const Duration(seconds: 2));
  }

  Future<void> centerMapOnUser() async {
    if (isLoading) {
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

  void getHeadCategory() async {
    loading = true;
    notifyListeners();
    listHeadCategoryModel = await repositoryImpl.headCategoryGet();
    var result = await ApiService.get(ApiConst.headCategory, ApiParams.emptyParams());
    debugPrint("${headCategoryModelFromJson(result!)} Birinchi Qadam");
    debugPrint("${listHeadCategoryModel?.length}  Ikkinchi Qadam");
    loading = false;
    notifyListeners();
  }

  void getRestaurantCategory() async {
    loading = true;
    notifyListeners();
    listRestaurantCategoryModel = await repositoryImpl.restaurantCategoryGet();
    var result = await ApiService.get(ApiConst.restaurantCategory, ApiParams.emptyParams());
    debugPrint("${restaurantCategoryModelFromJson(result!)} RestaurantCategoryModel >>>>>");
    debugPrint("${listRestaurantCategoryModel?.length} ListRestaurantCategoryModel >>>>>");
    loading = false;
    notifyListeners();
  }
}
