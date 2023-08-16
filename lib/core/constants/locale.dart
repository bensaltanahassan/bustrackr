import 'package:bustrackr/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

changeLanguage(String langCode) {
  MyServices myServices = Get.find();
  myServices.boxHive.put("lang", langCode);
  Get.updateLocale(Locale(langCode));
}
