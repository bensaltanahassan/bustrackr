import 'package:bustrackr/controllers/home/home_controller.dart';
import 'package:bustrackr/core/constants/routes.dart';
import 'package:bustrackr/data/data_models/bus_model.dart';
import 'package:bustrackr/data/data_models/dailyreminder_model.dart';
import 'package:bustrackr/data/data_models/stop_modal.dart';
import 'package:bustrackr/data/data_models/users_model.dart';
import 'package:bustrackr/data/data_source/bus_data.dart';
import 'package:bustrackr/data/data_source/dailyreminder_data.dart';
import 'package:bustrackr/data/data_source/stops_data.dart';
import 'package:get/get.dart';

class DailyReminderController extends GetxController {
  late UserModel user;
  bool? isLoading;
  bool? isError;
  DailyReminderData reminderData = DailyReminderData();

  List<DailyReminderModel> dailyRemindersList = [];

  getAllDailyDailyReminders() async {
    isLoading = true;
    update();
    try {
      dailyRemindersList.clear();
      // get data from firebase
      List<DailyReminderModelFireBase> dailyRemindersListFirebase = [];

      dailyRemindersListFirebase =
          await reminderData.getDailyRemindersByUserId(user.uid!);
      // know get all buses from firebase
      // 1. retreive all busIds+stopIds without dublicate
      List<String> busIds = [];
      List<String> stopIds = [];
      for (var d in dailyRemindersListFirebase) {
        if (!busIds.contains(d.busId)) {
          busIds.add(d.busId!);
        }
        if (!stopIds.contains(d.busStopId)) {
          stopIds.add(d.busStopId!);
        }
      }
      // 2.get All buses
      List<BusModel> buss = [];
      for (String busId in busIds) {
        buss.add(await BusData().getBusById(busId: busId));
      }

      // 3. get All stops
      List<StopModel> stops = [];
      for (String stopId in stopIds) {
        stops.add(await StopData().getStopById(stopId: stopId));
      }
      // 4. complete the list
      for (var d in dailyRemindersListFirebase) {
        BusModel bus = buss.firstWhere((element) => element.busId == d.busId);

        StopModel stop =
            stops.firstWhere((element) => element.stopId == d.busStopId);

        dailyRemindersList.add(DailyReminderModel(
          bus: bus,
          busStop: stop,
          daysOfWeek: d.daysOfWeek!,
          reminderId: d.reminderId!,
          minutesBeforeArrival: d.minutesBeforeArrival!,
          dateCreated: d.dateCreated,
        ));
      }

      // sort by date
      dailyRemindersList.sort((a, b) {
        DateTime dateA = DateTime.parse(a.dateCreated!);
        DateTime dateB = DateTime.parse(b.dateCreated!);
        return dateB.compareTo(dateA);
      });

      isLoading = false;
      update();
    } catch (e) {
      isError = true;
      isLoading = false;
      update();
    }
  }

  goToAddDailyReminderPage() {
    Get.toNamed(
      AppRoutes.adddailyreminder,
    );
  }

  goToUpdateDailyReminder(DailyReminderModel reminderModel) {
    Get.toNamed(AppRoutes.updatedailyreminder, arguments: reminderModel);
  }

  @override
  void onInit() {
    user = Get.find<HomeController>().user!;
    getAllDailyDailyReminders();
    super.onInit();
  }
}
