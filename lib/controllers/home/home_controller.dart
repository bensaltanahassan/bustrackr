import 'package:bustrackr/core/constants/routes.dart';
import 'package:bustrackr/core/services/services.dart';
import 'package:bustrackr/data/data_models/users_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  UserModel? user;
  MyServices myServices = Get.find();

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
        Get.toNamed(AppRoutes.dailyreminder);
        break;
      case 3:
        Get.toNamed(AppRoutes.contactus);
        break;
      case 4:
        Get.toNamed(AppRoutes.languages);
        break;

      default:
    }
  }

  initData() {
    Map<String, dynamic> data =
        Map<String, dynamic>.from(myServices.boxHive.get("user"));
    user = UserModel.fromJson(data);
  }

  @override
  void onInit() {
    initData();
    super.onInit();
  }
}
