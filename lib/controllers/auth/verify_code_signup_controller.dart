import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyCodeSignUpController extends GetxController {
  late TextEditingController codeController;

  void verifyCode() {}

  initData() {
    codeController = TextEditingController();
  }

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  @override
  void onClose() {
    codeController.dispose();
    super.onClose();
  }
}
