import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:dio/dio.dart';

Future<Set<Polyline>> getPolyline({
  required double originLat,
  required double originLng,
  required double destLat,
  required double destLng,
}) async {
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();
  Set<Polyline> polylineSet = {};

  String googleMapKey = "AIzaSyD4xK2PHTefVyqZQ0nQXxFJSiir9P_e3Bc";
  String url =
      "https://maps.googleapis.com/maps/api/directions/json?origin=$originLat,$originLng&destination=$destLat,$destLng&mode=TRANSIT&transit_mode=bus&key=$googleMapKey";

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

Future<List<LatLng>> decodePolyline(List<String> points) async {
  List<LatLng> polylinePoints = [];

  for (int i = 0; i < points.length - 1; i++) {
    LatLng origin = LatLng(
      double.parse(points[i].split(",")[0].trim()),
      double.parse(points[i].split(",")[1].trim()),
    );

    int nextIndex = i + 1;

    if (nextIndex >= points.length) {
      break; // Prevent index out of bounds error
    }

    LatLng destination = LatLng(
      double.parse(points[nextIndex].split(",")[0].trim()),
      double.parse(points[nextIndex].split(",")[1].trim()),
    );

    Set<Polyline> polylineSet = await getPolyline(
      originLat: origin.latitude,
      originLng: origin.longitude,
      destLat: destination.latitude,
      destLng: destination.longitude,
    );

    for (var element in polylineSet) {
      polylinePoints.addAll(element.points);
    }
  }

  return polylinePoints;
}

Future<List<LatLng>> decodePolylineBySegments(
    List<List<String>> routeSegments) async {
  List<LatLng> polylinePoints = [];
  for (var e in routeSegments) {
    List<String> points = e;
    LatLng origin = LatLng(
      double.parse(points[0].split(",")[0]),
      double.parse(points[0].split(",")[1]),
    );
    LatLng destination = LatLng(
      double.parse(points[1].split(",")[0]),
      double.parse(points[1].split(",")[1]),
    );
    Set<Polyline> polylineSet = await getPolyline(
      originLat: origin.latitude,
      originLng: origin.longitude,
      destLat: destination.latitude,
      destLng: destination.longitude,
    );
    for (var element in polylineSet) {
      polylinePoints.addAll(element.points);
    }
  }
  return polylinePoints;
}
