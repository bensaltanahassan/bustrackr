import 'package:bustrackr/core/constants/routes.dart';
import 'package:bustrackr/data/data_models/bus_model.dart';
import 'package:bustrackr/data/data_models/dailyreminder_model.dart';
import 'package:bustrackr/data/data_models/stop_modal.dart';
import 'package:get/get.dart';

class DailyReminderController extends GetxController {
  List<DailyReminderModel> allDailyReminders = [
    DailyReminderModel(
      reminderId: "1",
      daysOfWeek: [
        "Lundi",
        "Mardi",
      ],
      bus: BusModel(busId: "1", busNumber: "18", lat: 2.2, lng: 2.2),
      minutesBeforeArrival: 3,
      busStop: StopModel(
        stopId: "1",
        stopName: "Oued Elbacha",
        latitude: 23.2,
        longitude: 23.2,
      ),
    ),
    DailyReminderModel(
      reminderId: "2",
      daysOfWeek: [
        "Jeudi",
        "Mardi",
      ],
      bus: BusModel(busId: "1", busNumber: "04", lat: 72.2, lng: 7.2),
      minutesBeforeArrival: 3,
      busStop: StopModel(
        stopId: "2",
        stopName: "ENSA",
        latitude: 23.2,
        longitude: 23.2,
      ),
    ),
    DailyReminderModel(
      reminderId: "3",
      daysOfWeek: [
        "Lundi",
        "Mardi",
      ],
      bus: BusModel(busId: "1", busNumber: "18", lat: 2.2, lng: 2.2),
      minutesBeforeArrival: 3,
      busStop: StopModel(
        stopId: "1",
        stopName: "El khawarizmi",
        latitude: 23.2,
        longitude: 23.2,
      ),
    ),
  ];

  goToAddDailyReminderPage() {
    Get.toNamed(
      AppRoutes.adddailyreminder,
    );
  }

  getAllDailyReminders() async {}
}
