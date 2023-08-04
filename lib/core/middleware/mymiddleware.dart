import 'package:flutter/cupertino.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:bustrackr/core/constants/routes.dart';
import 'package:bustrackr/core/services/services.dart';

class MyMiddleWare extends GetMiddleware {
  @override
  int? get priority => 1;

  MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if (myServices.boxHive.get("step") == "2") {
      return RouteSettings(name: AppRoutes.nearbybus);
    }
    if (myServices.boxHive.get("step") == "1") {
      return RouteSettings(name: AppRoutes.login);
    }

    return null;
  }
}
