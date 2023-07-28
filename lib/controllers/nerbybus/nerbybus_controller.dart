import 'package:bustrackr/core/constants/routes.dart';
import 'package:get/get.dart';

class NerbyBusController extends GetxController {
  goToBusDetailsPage() {
    Get.toNamed(AppRoutes.busDetails);
  }
}
