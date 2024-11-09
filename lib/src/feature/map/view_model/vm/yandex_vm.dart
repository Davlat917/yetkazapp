import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import 'geocoding_func.dart';

final yandexVmProvider = ChangeNotifierProvider((ref) => YandexVm());

class YandexVm extends ChangeNotifier {
  YandexVm() {
    _determinePosition();
  }

  // String myLocationName = "";
  late Position myPosition;
  String myLocationName = 'No Address';
  bool isLoading = false;
  late YandexMapController yandexMapController;
  List<MapObject> mapObjects = [];

  Future<Position> _determinePosition() async {
    isLoading = false;
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied, we cannot request permissions.');
    }
    myPosition = await Geolocator.getCurrentPosition();
    isLoading = true;
    notifyListeners();
    return myPosition;
  }

  void onMapCreated(YandexMapController controller) {
    yandexMapController = controller;
    controller.moveCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: Point(latitude: myPosition.latitude, longitude: myPosition.longitude), zoom: 12),
      ),
    );
  }

  Future<void> findMe() async {
    try {
      Position position = await _determinePosition();
      yandexMapController.moveCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: Point(latitude: position.latitude, longitude: position.longitude),
            zoom: 16,
          ),
        ),
      );

      myLocationName = await getAddressFromLatLong(position.latitude, position.longitude);
      notifyListeners();
    } catch (e) {
      log("Error determining position: $e");
    }
  }

  void locationSet(String location) {
    myLocationName = location;
    print("YandexVm: myLocationName set to $myLocationName");
    notifyListeners();
  }

  void onCameraPositionChanged(CameraPosition cameraPosition, _, __) async {
    myLocationName = await getAddressFromLatLong(
      cameraPosition.target.latitude,
      cameraPosition.target.longitude,
    );
    notifyListeners();
  }
}
