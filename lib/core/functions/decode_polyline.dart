import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:dio/dio.dart';

Future<Set<Polyline>> getPolyline({
  required double lat,
  required double lang,
  required double destLat,
  required double destLong,
}) async {
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();
  Set<Polyline> polylineSet = {};

  String googleMapKey = ""; //TODO add key
  String url =
      "https://maps.googleapis.com/maps/api/directions/json?origin=$lat,$lang&destination=$destLat,$destLong&key=$googleMapKey";

  var response = await Dio().post(url);
  var data = response.data;
  List<dynamic> routes = data["routes"];
  Map<String, dynamic> route = routes[0];
  Map<String, dynamic> poly = route["overview_polyline"];
  String encodedString = poly["points"];
  List<PointLatLng> polylineCoord =
      polylinePoints.decodePolyline(encodedString);
  for (var point in polylineCoord) {
    polylineCoordinates.add(LatLng(point.latitude, point.longitude));
  }
  Polyline polyline = Polyline(
    polylineId: const PolylineId("polyline"),
    color: Colors.blue,
    points: polylineCoordinates,
    width: 5,
  );

  polylineSet.add(polyline);
  return polylineSet;
}
