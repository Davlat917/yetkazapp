import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tezyetkazz/src/core/storage/app_storage.dart';
import 'package:tezyetkazz/src/core/widgets/button_navigation_bar.dart';
import 'package:tezyetkazz/src/core/widgets/cupertino_eleveted_button_widget.dart';
import 'package:tezyetkazz/src/feature/map/view_model/vm/geocoding_func.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
import 'package:geolocator/geolocator.dart';

class CustomYandexMap extends StatefulWidget {
  const CustomYandexMap({super.key});

  @override
  State<CustomYandexMap> createState() => _CustomYandexMapState();
}

class _CustomYandexMapState extends State<CustomYandexMap> {
  late Position myPosition;
  String myLocationName = 'Toshkent Region';
  bool isLoading = false;
  late YandexMapController yandexMapController;
  List<MapObject> mapObjects = [];

  Future<void> _determinePosition() async {
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
      return Future.error('Location permissions are permanently denied.');
    }

    myPosition = await Geolocator.getCurrentPosition();
    isLoading = true;
    setState(() {
      centerMapOnUser();
    });
  }

  void onMapCreated(YandexMapController controller) {
    yandexMapController = controller;
    centerMapOnUser();
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
      setState(() {});
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

  @override
  void initState() {
    super.initState();
    _determinePosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text(
          "joylashgan joyingizni aniqlang".tr(),
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
      ),
      body: isLoading
          ? Stack(
              alignment: Alignment.center,
              children: [
                YandexMap(
                  onMapCreated: onMapCreated,
                  mapObjects: mapObjects,
                ),
                Positioned(
                  top: 40,
                  left: 20,
                  right: 20,
                  child: GestureDetector(
                    onTap: () async {
                      final selectedLocation = await Navigator.push<Point>(
                        context,
                        MaterialPageRoute(builder: (_) => const CustomYandexMap()),
                      );
                      if (selectedLocation != null) {
                        // Log the selected location to verify
                        print("Received location in HomePage: $selectedLocation");
                        // Fetch the location name and update provider
                        final newLocationName = await getAddressFromLatLong(
                          selectedLocation.latitude,
                          selectedLocation.longitude,
                        );
                        // locationSet(newLocationName);
                        // Log to confirm the provider updated
                        print("Updated location name: ${myLocationName}");
                      }
                    },
                    child: Container(
                      color: Colors.white.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                      child: Text(
                        myLocationName,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                ),
                const Icon(
                  Icons.location_on,
                  color: Colors.red,
                  size: 44,
                ),
              ],
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(height: 30),
            FloatingActionButton(
              onPressed: () => yandexMapController.moveCamera(CameraUpdate.zoomIn()),
              child: const Icon(Icons.add),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              icon: const Icon(
                Icons.my_location_outlined,
                color: Colors.black,
              ),
              onPressed: () => centerMapOnUser(),
              label: Text(
                "men qayerda".tr(),
                style: const TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(height: 30),
            FloatingActionButton(
              onPressed: () => yandexMapController.moveCamera(CameraUpdate.zoomOut()),
              child: const Icon(CupertinoIcons.minus),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: CupertinoElevetedButtonWidget(
                child: Text(
                  "saqlash".tr(),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onPressed: () async {
                  await AppStorage.$write(key: StorageKey.initialKey, value: "Success");
                  final cameraPosition = await yandexMapController.getCameraPosition();
                  final selectedLocation = Point(
                    latitude: cameraPosition.target.latitude,
                    longitude: cameraPosition.target.longitude,
                  );
                  Navigator.pop(context, selectedLocation);
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ButtonNavigationBar(),
                    ),
                    (context) => false,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
