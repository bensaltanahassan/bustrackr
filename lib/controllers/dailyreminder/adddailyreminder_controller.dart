import 'package:bustrackr/core/shared/notifications/showsnackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddDailyReminderController extends GetxController {
  String? userId;
  String? busNumber;
  String? stop;
  List<String> days = [];
  String? timeBefore;

  showPicker(BuildContext context) {
    Picker(
      adapter: NumberPickerAdapter(
        data: [
          const NumberPickerColumn(
            begin: 1,
            end: 60,
            suffix: Text(" min"),
          ),
        ],
      ),
      hideHeader: true,
      looping: true,
      selecteds: [
        timeBefore != null ? int.parse(timeBefore!) - 1 : 10, // initial value
      ],
      title: Text(AppLocalizations.of(context)!.pleaseSelect),
      onConfirm: (Picker picker, List value) {
        timeBefore = picker.getSelectedValues()[0].toString();
        update();
      },
      cancelText: AppLocalizations.of(context)!.cancel,
      confirmText: AppLocalizations.of(context)!.confirm,
    ).showDialog(context);
  }

  chooseBusNumber(String busNumber) {
    this.busNumber = busNumber;
    update();
  }

  chooseStop(String stop) {
    this.stop = stop;
    update();
  }

  chooseAllDays(String _) {
    // check if all days choose , is yes thene clear the list , if no then choose all the days
    if (days.length == 7) {
      days.clear();
    } else {
      days = [
        "Saturday",
        "Sunday",
        "Monday",
        "Tuesday",
        "Wednesday",
        "Thursday",
        "Friday"
      ];
    }
    update();
  }

  chooseDay(String day) {
    // check if the day is exist , if yes then remove it , if no add it
    if (days.contains(day)) {
      days.remove(day);
    } else {
      days.add(day);
    }
    update();
  }

  addDailyReminder() {
    // check if all element not null
    if (busNumber == null ||
        stop == null ||
        days.isEmpty ||
        timeBefore == null) {
      MySnackBar.showCustomSnackBar(
        title: "Error",
        message: "Please fill all fields",
      );
      return;
    }
  }
}
