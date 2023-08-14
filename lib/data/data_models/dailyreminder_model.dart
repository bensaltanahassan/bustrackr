import 'package:bustrackr/data/data_models/bus_model.dart';
import 'package:bustrackr/data/data_models/stop_modal.dart';

class DailyReminderModel {
  String reminderId;
  List<String> daysOfWeek;
  BusModel bus;
  int minutesBeforeArrival;
  StopModel busStop;

  DailyReminderModel({
    required this.reminderId,
    required this.daysOfWeek,
    required this.bus,
    required this.minutesBeforeArrival,
    required this.busStop,
  });

  factory DailyReminderModel.fromJson(Map<String, dynamic> json) {
    return DailyReminderModel(
      reminderId: json['reminderId'],
      daysOfWeek: List<String>.from(json['daysOfWeek']),
      bus: BusModel.fromJson(json['bus']),
      minutesBeforeArrival: json['minutesBeforeArrival'],
      busStop: StopModel.fromJson(json['busStop']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'reminderId': reminderId,
      'daysOfWeek': daysOfWeek,
      'bus': bus.toJson(),
      'minutesBeforeArrival': minutesBeforeArrival,
      'busStop': busStop.toJson(),
    };
  }
}
