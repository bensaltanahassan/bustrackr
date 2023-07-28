import 'package:get/get.dart';

class LanguagesController extends GetxController {
  int selectedOption = 0; // The default selected option index

  // List of options for the radio button list
  final List<String> options = [
    'English',
    'Français',
    'العربية',
    'Español',
  ];
}
