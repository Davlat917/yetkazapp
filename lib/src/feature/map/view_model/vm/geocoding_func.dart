import 'package:flutter/cupertino.dart';
import 'package:yandex_geocoder/yandex_geocoder.dart';

Future<String> getAddressFromLatLong(double latitude, double longitude) async {
  final geocoder = YandexGeocoder(apiKey: '36fb6a7e-908c-4f11-9048-4ffb8488f95a');

  // Perform reverse geocoding
  final geocodeResult = await geocoder.getGeocode(ReverseGeocodeRequest(
    pointGeocode: (lat: latitude, lon: longitude),
  ));

  if (geocodeResult != null && geocodeResult.firstAddress != null) {
    // Get the first address result
    String address = geocodeResult.firstAddress!.formatted!;
    debugPrint('Address: $address');
    return address; // Return the address
  } else {
    debugPrint('No address found');
    return 'No address found'; // Return a default message if no address is found
  }
}
