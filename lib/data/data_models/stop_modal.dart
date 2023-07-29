class StopModel {
  String stopId;
  String stopName;
  double latitude;
  double longitude;
  List<String> busesAtStop;

  StopModel({
    required this.stopId,
    required this.stopName,
    required this.latitude,
    required this.longitude,
    required this.busesAtStop,
  });

  factory StopModel.fromJson(Map<String, dynamic> json) {
    return StopModel(
      stopId: json['stopId'],
      stopName: json['stopName'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      busesAtStop: List<String>.from(json['busesAtStop']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'stopId': stopId,
      'stopName': stopName,
      'latitude': latitude,
      'longitude': longitude,
      'busesAtStop': busesAtStop,
    };
  }
}
