import 'package:get/get.dart';

class ValidationInput {
  static validInput({String? val, int? min, int? max, String? type}) {
    if (val!.isEmpty) {
      return "valeurs ne doit pas etre vide";
    }

    if (type == "name") {
      if (!GetUtils.isUsername(val)) {
        return "nom n'est pas valide";
      }
    }
    if (type == "email") {
      if (!GetUtils.isEmail(val)) {
        return "Verifier l'email";
      }
    }
    if (type == "phone") {
      if (!GetUtils.isPhoneNumber(val)) {
        return "phone n'est pas verifie";
      }
    }
    if (type == "double") {
      if (!GetUtils.isNum(val)) {
        return "valeur doit etre un nombre";
      }
    }
    if (type == "int") {
      // check if the value is an integer
      if (int.tryParse(val) == null) {
        return "valeur doit etre un nombre";
      }
    }

    if (min != null && val.length < min) {
      return "valeur n'est pas doit etre inferieur à $min";
    }
    if (max != null && val.length > max) {
      return "valeur n'est pas doit etre superieur à $max";
    }
  }
}
