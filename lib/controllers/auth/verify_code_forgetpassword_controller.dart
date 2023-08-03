import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyCodeForgetPasswordController extends GetxController {
  late TextEditingController codeController;

  void verifyCode() {}

  void goToChangePassword() {
    // Get.toNamed(AppRoutes.changepassword);
  }

  @override
  void onInit() {
    codeController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    codeController.dispose();
    super.onClose();
  }
}
