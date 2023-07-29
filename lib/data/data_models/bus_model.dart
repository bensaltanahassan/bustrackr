class BusModel {
  String busId;
  String busNumber;
  String currentLocation;
  String nextStop;
  String estimatedArrivalTime;

  BusModel({
    required this.busId,
    required this.busNumber,
    required this.currentLocation,
    required this.nextStop,
    required this.estimatedArrivalTime,
  });

  factory BusModel.fromJson(Map<String, dynamic> json) {
    return BusModel(
      busId: json['busId'],
      busNumber: json['busNumber'],
      currentLocation: json['currentLocation'],
      nextStop: json['nextStop'],
      estimatedArrivalTime: json['estimatedArrivalTime'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'busId': busId,
      'busNumber': busNumber,
      'currentLocation': currentLocation,
      'nextStop': nextStop,
      'estimatedArrivalTime': estimatedArrivalTime,
    };
  }
}
