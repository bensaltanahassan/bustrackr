import 'package:bustrackr/core/classes/forgetpassword_exception.dart';
import 'package:bustrackr/data/data_source/auth_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bustrackr/core/shared/notifications/showsnackbar.dart';

class ForgetPasswordController extends GetxController {
  bool isLoading = false;
  late TextEditingController emailController;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AuthData authData = AuthData();

  sendEmailChangePassword() async {
    if (formKey.currentState!.validate() && isLoading == false) {
      isLoading = true;
      update();

      var res = await authData
          .sendEmailResetPassword(emailController.text.trim().toLowerCase());
      if (res == true) {
        MySnackBar.showCustomSnackBar(
            title: "Succès",
            message: "Un email a été envoyé à votre adresse email");
      } else {
        String message = ForgetPasswordException(res).handleException();
        MySnackBar.showCustomSnackBar(
          title: "Error",
          message: message,
        );
      }

      isLoading = false;
      update();
    }
  }

  @override
  void onInit() {
    emailController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}
