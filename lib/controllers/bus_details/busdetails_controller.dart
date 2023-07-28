import 'package:bustrackr/core/constants/routes.dart';
import 'package:get/get.dart';

class BusDetailsController extends GetxController {
  goToBusTracking() {
    Get.toNamed(AppRoutes.trackingPage);
  }
}
