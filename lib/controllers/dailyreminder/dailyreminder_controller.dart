import 'package:bustrackr/core/constants/routes.dart';
import 'package:get/get.dart';

class DailyReminderController extends GetxController {
  goToAddDailyReminderPage() {
    Get.toNamed(
      AppRoutes.adddailyreminder,
    );
  }
}
