import 'package:bustrackr/data/data_models/bus_model.dart';
import 'package:bustrackr/data/data_models/stop_modal.dart';

class DailyReminderModelFireBase {
  String? reminderId;
  String? userId;
  String? busId;
  String? busStopId;
  List<String>? daysOfWeek;
  int? minutesBeforeArrival;
  String? dateCreated;

  DailyReminderModelFireBase({
    this.reminderId,
    this.userId,
    this.busId,
    this.busStopId,
    this.daysOfWeek,
    this.minutesBeforeArrival,
    this.dateCreated,
  });

  factory DailyReminderModelFireBase.fromJson(Map<String, dynamic> json) {
    return DailyReminderModelFireBase(
      reminderId: json['reminderId'],
      userId: json['userId'],
      busId: json['busId'],
      busStopId: json['busStopId'],
      daysOfWeek: List<String>.from(json['daysOfWeek']),
      minutesBeforeArrival: json['minutesBeforeArrival'],
      dateCreated: json["dateCreated"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'reminderId': reminderId,
      'userId': userId,
      'busId': busId,
      'busStopId': busStopId,
      'daysOfWeek': daysOfWeek,
      'minutesBeforeArrival': minutesBeforeArrival,
      "dateCreated": dateCreated ?? DateTime.now().toString(),
    };
  }
}

class DailyReminderModel {
  String reminderId;
  List<String> daysOfWeek;
  BusModel bus;
  int minutesBeforeArrival;
  StopModel busStop;
  String? dateCreated;

  DailyReminderModel({
    required this.reminderId,
    required this.daysOfWeek,
    required this.bus,
    required this.minutesBeforeArrival,
    required this.busStop,
    this.dateCreated,
  });
}
