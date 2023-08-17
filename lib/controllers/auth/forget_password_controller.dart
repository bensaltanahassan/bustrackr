import 'package:bustrackr/core/classes/forgetpassword_exception.dart';
import 'package:bustrackr/data/data_source/auth_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bustrackr/core/shared/notifications/showsnackbar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
            title: AppLocalizations.of(Get.context!)!.success,
            message: AppLocalizations.of(Get.context!)!.emailSentSuccessfully);
      } else {
        String message = ForgetPasswordException(res).handleException();
        MySnackBar.showCustomSnackBar(
          title: AppLocalizations.of(Get.context!)!.error,
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
