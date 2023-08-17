import 'dart:convert';

BusModel busModelFromJson(String str) => BusModel.fromJson(json.decode(str));

String busModelToJson(BusModel data) => json.encode(data.toJson());

class BusModel {
  String? busId;
  String? busNumber;
  double? lat;
  double? lng;
  double? distanceInMeters;
  RoutesModel? routes;
  List<String>? stops;

  BusModel({
    this.busId,
    this.busNumber,
    this.lat,
    this.lng,
    this.distanceInMeters,
    this.routes,
    this.stops,
  });

  factory BusModel.fromJson(Map<String, dynamic> json) {
    return BusModel(
        busId: json["busId"],
        busNumber: json["busNumber"],
        lat: json["lat"]?.toDouble(),
        lng: json["lng"]?.toDouble(),
        routes: json["routes"] == null
            ? null
            : RoutesModel.fromJson(json["routes"]),
        stops: json['stops']?.cast<String>());
  }

  Map<String, dynamic> toJson() => {
        "busId": busId,
        "busNumber": busNumber,
        "lat": lat,
        "lng": lng,
        "routes": routes?.toJson(),
        "stops": stops
      };
}

class RoutesModel {
  List<Point>? points;

  RoutesModel({
    this.points,
  });

  RoutesModel.fromJson(Map<String, dynamic> json) {
    points = <Point>[];
    if (json['points'] != null) {
      json['points'].forEach((v) {
        points!.add(Point.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (points != null) {
      data['points'] = points!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Point {
  double? lat;
  double? lng;

  Point({
    this.lat,
    this.lng,
  });

  factory Point.fromJson(Map<String, dynamic> json) => Point(
        lat: json["lat"],
        lng: json["lng"],
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };
}
