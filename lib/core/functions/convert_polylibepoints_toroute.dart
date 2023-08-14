import 'package:bustrackr/data/data_models/bus_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

RoutesModel converPolylinePointsToRoute(List<LatLng> polylinePoints) {
  Map<String, dynamic> jsonMap = {"points": []};

  for (var latLng in polylinePoints) {
    jsonMap["points"].add({"lat": latLng.latitude, "lng": latLng.longitude});
  }

  RoutesModel route = RoutesModel.fromJson(jsonMap);

  return route;
}
