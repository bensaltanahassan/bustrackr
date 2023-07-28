import 'package:bustrackr/core/constants/routes.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  int currentDrawerIndex = 0;
  goToProfilePage() {
    Get.toNamed(AppRoutes.profilePage);
  }

  goToPage(int index) {
    currentDrawerIndex = index;
    update();
    switch (index) {
      case 0:
        Get.toNamed(AppRoutes.nearbybus);
        break;
      case 1:
        Get.toNamed(AppRoutes.searchbusbynumber);
        break;
      case 2:
        Get.toNamed(AppRoutes.dailyreminder);
        break;
      case 4:
        Get.toNamed(AppRoutes.contactus);
        break;
      case 5:
        Get.toNamed(AppRoutes.languages);
        break;

      default:
    }
  }
}
