import 'package:bustrackr/controllers/dailyreminder/dailyreminder_controller.dart';
import 'package:bustrackr/controllers/home/home_controller.dart';
import 'package:bustrackr/core/shared/notifications/showsnackbar.dart';
import 'package:bustrackr/data/data_models/bus_model.dart';
import 'package:bustrackr/data/data_models/dailyreminder_model.dart';
import 'package:bustrackr/data/data_models/stop_modal.dart';
import 'package:bustrackr/data/data_models/users_model.dart';
import 'package:bustrackr/data/data_source/bus_data.dart';
import 'package:bustrackr/data/data_source/dailyreminder_data.dart';
import 'package:bustrackr/data/data_source/stops_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddDailyReminderController extends GetxController {
  bool? isLoadingBus;
  bool? isLoadingStops;
  bool? isError;
  UserModel? user;
  List<String> days = [];
  String? timeBefore;

  StopModel? stop;
  BusModel? bus;

  List<BusModel> listBus = [];
  List<StopModel> stopsByBus = [];

  getAllBuses() async {
    isLoadingBus = true;
    update();
    try {
      listBus.clear();

      BusData busData = BusData();
      var data = await busData.getAllBuss();

      for (var b in data) {
        BusModel bus = BusModel.fromJson(b.data() as Map<String, dynamic>);
        if (!listBus.any((element) => element.busNumber == bus.busNumber)) {
          listBus.add(bus);
        }
      }
      // sort by busNumber
      listBus.sort((a, b) => a.busNumber!.compareTo(b.busNumber!));
    } catch (_) {
      isError = true;
    }

    isLoadingBus = false;
    update();
  }

  getAllStopsByBus(BusModel bus) async {
    isLoadingStops = true;
    update();
    try {
      stopsByBus.clear();
      for (var stopId in bus.stops!) {
        var stop = await StopData().getStopById(stopId: stopId);
        stopsByBus.add(stop);
      }
    } catch (e) {
      isError = true;
    }

    isLoadingStops = false;
    update();
  }

  showPicker(BuildContext context) {
    Picker(
      adapter: NumberPickerAdapter(
        data: [
          NumberPickerColumn(
            begin: 1,
            end: 60,
            suffix: Text(" ${AppLocalizations.of(context)!.min}"),
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

  chooseBus(BusModel bus) {
    this.bus = bus;
    getAllStopsByBus(bus);
  }

  chooseStop(StopModel stop) {
    this.stop = stop;
    update();
  }

  chooseAllDays() {
    // check if all days choose , is yes thene clear the list , if no then choose all the days
    if (days.length == 7) {
      days.clear();
    } else {
      days = [
        "Lundi",
        "Mardi",
        "Mercredi",
        "Jeudi",
        "Vendredi",
        "Samedi",
        "Dimanche"
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

  addDailyReminder() async {
    // check if all element not null
    if (bus == null || stop == null || days.isEmpty || timeBefore == null) {
      MySnackBar.showCustomSnackBar(
        title: AppLocalizations.of(Get.context!)!.error,
        message: AppLocalizations.of(Get.context!)!.pleaseFillAllFields,
      );
      return;
    } else {
      try {
        isLoadingBus = true;
        update();
        DailyReminderModelFireBase dailyReminder = DailyReminderModelFireBase(
          busId: bus!.busId,
          busStopId: stop!.stopId,
          daysOfWeek: days,
          minutesBeforeArrival: int.parse(timeBefore!),
          userId: user!.uid,
          dateCreated: DateTime.now().toString(),
        );
        await DailyReminderData().addDailyReminder(dailyReminder);
        isLoadingBus = false;
        update();
        // tell him addess success
        MySnackBar.showCustomSnackBar(
          title: AppLocalizations.of(Get.context!)!.success,
          message: AppLocalizations.of(Get.context!)!.dailyAddedWithSuccess,
        );
        Get.find<DailyReminderController>().getAllDailyDailyReminders();
      } catch (_) {
        isLoadingBus = false;
        isError = true;
        update();
      }
    }
  }

  @override
  void onInit() {
    user = Get.find<HomeController>().user;
    getAllBuses();

    super.onInit();
  }
}
