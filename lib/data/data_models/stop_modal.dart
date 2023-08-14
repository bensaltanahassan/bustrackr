class StopModel {
  String stopId;
  String stopName;
  double latitude;
  double longitude;

  StopModel({
    required this.stopId,
    required this.stopName,
    required this.latitude,
    required this.longitude,
  });

  factory StopModel.fromJson(Map<String, dynamic> json) {
    return StopModel(
      stopId: json['stopId'],
      stopName: json['stopName'],
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'stopId': stopId,
      'stopName': stopName,
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}
