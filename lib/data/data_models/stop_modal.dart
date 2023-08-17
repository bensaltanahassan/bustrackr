class StopModel {
  String stopId;
  String name;
  double lat;
  double lng;

  StopModel({
    required this.stopId,
    required this.name,
    required this.lat,
    required this.lng,
  });

  factory StopModel.fromJson(Map<String, dynamic> json) {
    return StopModel(
      stopId: json['stopId'],
      name: json['name'],
      lat: json['lat'],
      lng: json['lng'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'stopId': stopId,
      'stopName': name,
      'latitude': lat,
      'longitude': lng,
    };
  }
}
