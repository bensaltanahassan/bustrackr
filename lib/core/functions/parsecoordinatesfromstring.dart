import 'package:google_maps_flutter/google_maps_flutter.dart';

// void main() {
//   String coordinatesString =
//       "[LatLng(32.32551, -9.26443), LatLng(32.32441, -9.26233), ...]";
//   List<LatLng> coordinatesList = parseCoordinatesString(coordinatesString);
//   print(coordinatesList);
// }

List<LatLng> parseCoordinatesString(String coordinatesString) {
  // Remove unnecessary characters
  coordinatesString = coordinatesString
      .replaceAll('LatLng(', '')
      .replaceAll(')', '')
      .replaceAll('[', '')
      .replaceAll(']', '');

  // Split into individual coordinate strings
  List<String> coordinateStrings = coordinatesString.split(', ');

  List<LatLng> coordinatesList = [];

  // Parse each coordinate string and create LatLng objects
  for (var coordinateString in coordinateStrings) {
    List<String> parts = coordinateString.split(', ');
    double lat = double.parse(parts[0]);
    double lng = double.parse(parts[1]);
    LatLng coordinate = LatLng(lat, lng);
    coordinatesList.add(coordinate);
  }

  return coordinatesList;
}
