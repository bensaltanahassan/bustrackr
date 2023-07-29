import 'package:bustrackr/data/data_models/bus_model.dart';
import 'package:bustrackr/data/data_models/stop_modal.dart';
import 'package:flutter/material.dart';

class DailyReminderModel {
  String reminderId;
  String reminderTitle;
  String reminderDescription;
  TimeOfDay reminderTime;
  List<String> daysOfWeek;
  BusModel bus;
  int minutesBeforeArrival;
  StopModel busStop;

  DailyReminderModel({
    required this.reminderId,
    required this.reminderTitle,
    required this.reminderDescription,
    required this.reminderTime,
    required this.daysOfWeek,
    required this.bus,
    required this.minutesBeforeArrival,
    required this.busStop,
  });

  factory DailyReminderModel.fromJson(Map<String, dynamic> json) {
    return DailyReminderModel(
      reminderId: json['reminderId'],
      reminderTitle: json['reminderTitle'],
      reminderDescription: json['reminderDescription'],
      reminderTime: TimeOfDay(
        hour: json['reminderHour'],
        minute: json['reminderMinute'],
      ),
      daysOfWeek: List<String>.from(json['daysOfWeek']),
      bus: BusModel.fromJson(json['bus']),
      minutesBeforeArrival: json['minutesBeforeArrival'],
      busStop: StopModel.fromJson(json['busStop']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'reminderId': reminderId,
      'reminderTitle': reminderTitle,
      'reminderDescription': reminderDescription,
      'reminderHour': reminderTime.hour,
      'reminderMinute': reminderTime.minute,
      'daysOfWeek': daysOfWeek,
      'bus': bus.toJson(),
      'minutesBeforeArrival': minutesBeforeArrival,
      'busStop': busStop.toJson(),
    };
  }
}
