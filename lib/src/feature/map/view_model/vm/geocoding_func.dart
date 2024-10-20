import 'package:yandex_geocoder/yandex_geocoder.dart';

Future<String> getAddressFromLatLong(double latitude, double longitude) async {
  final geocoder = YandexGeocoder(apiKey: '9f1a0191-1514-479c-b1db-1eda6a0c0870');

  // Perform reverse geocoding
  final geocodeResult = await geocoder.getGeocode(ReverseGeocodeRequest(
    pointGeocode: (lat: latitude, lon: longitude),
  ));

  if (geocodeResult != null && geocodeResult.firstAddress != null) {
    // Get the first address result
    String address = geocodeResult.firstAddress!.formatted!;
    print('Address: $address');
    return address; // Return the address
  } else {
    print('No address found');
    return 'No address found'; // Return a default message if no address is found
  }
}
