import 'dart:io';

import 'package:bustrackr/core/constants/locale.dart';
import 'package:bustrackr/core/services/services.dart';
import 'package:get/get.dart';

class LanguageModel {
  String language;
  String languageCode;

  LanguageModel(this.language, this.languageCode);
}

class LanguagesController extends GetxController {
  late String lang;
  late LanguageModel selectedLanguage;

  // List of options for the radio button list
  List<LanguageModel> options = [
    LanguageModel('Français', 'fr'),
    LanguageModel('English', 'en'),
    LanguageModel('العربية', 'ar'),
  ];

  submitChangeLanguage(LanguageModel? languageModel) {
    selectedLanguage = languageModel!;

    changeLanguage(languageModel.languageCode);
  }

  @override
  void onInit() {
    lang = Get.find<MyServices>().boxHive.get("lang") ??
        Platform.localeName.split('_')[0];
    selectedLanguage =
        options.firstWhere((element) => element.languageCode == lang);
    super.onInit();
  }
}
