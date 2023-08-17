import 'package:bustrackr/core/constants/assets.dart';
import 'package:bustrackr/core/constants/routes.dart';
import 'package:bustrackr/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingController extends GetxController {
  int onBoardingPage = 0;

  List<PageViewModel> pages = [
    PageViewModel(
      title: AppLocalizations.of(Get.context!)!.title1,
      body: AppLocalizations.of(Get.context!)!.body1,
      image: Center(child: Image.asset(ImageAssets.onboarding1)),
    ),
    PageViewModel(
      title: AppLocalizations.of(Get.context!)!.title2,
      body: AppLocalizations.of(Get.context!)!.body2,
      image: Center(child: Image.asset(ImageAssets.onboarding2)),
    ),
    PageViewModel(
      title: AppLocalizations.of(Get.context!)!.title3,
      body: AppLocalizations.of(Get.context!)!.body3,
      image: Center(child: Image.asset(ImageAssets.onboarding3)),
    ),
  ];
  onDone() {
    Get.find<MyServices>().boxHive.put("step", "1");
    Get.offAllNamed(AppRoutes.languages);
  }
}
