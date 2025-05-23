import 'package:bustrackr/data/data_models/users_model.dart';
import 'package:bustrackr/data/data_source/auth_data.dart';
import 'package:bustrackr/data/data_source/user_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bustrackr/core/classes/login_exception.dart';
import 'package:bustrackr/core/constants/routes.dart';
import 'package:bustrackr/core/shared/notifications/showsnackbar.dart';
import 'package:bustrackr/core/services/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginController extends GetxController {
  late bool showPassword;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isloading = false;

  late TextEditingController emailController;
  late TextEditingController passwordController;

  AuthData authData = AuthData();
  UserData userData = UserData();
  MyServices myServices = Get.find();

  void changeObscurity() {
    showPassword = !showPassword;
    update();
  }

  login() async {
    if (formKey.currentState!.validate()) {
      isloading = true;
      update();
      var resp = await authData.login(
          emailController.text.toLowerCase().trim(), passwordController.text);
      if (resp is FirebaseAuthException) {
        String message = LoginException(resp).handleException();
        MySnackBar.showCustomSnackBar(
          title: AppLocalizations.of(Get.context!)!.error,
          message: message,
        );
      } else if (resp is UserCredential) {
        if (!resp.user!.emailVerified) {
          goToVerifyEmailPage(resp);
        } else {
          var token = await authData.getToken();
          await userData.updateUserInfo(
            email: emailController.text.toLowerCase(),
            data: {"token": token},
          );
          UserModel? user = await userData
              .getUserByEmail(emailController.text.trim().toLowerCase());

          await myServices.boxHive.putAll({
            "step": "2",
            "user": user!.toJson(),
          });

          Get.offAllNamed(AppRoutes.nearbybus);
        }
      }
      isloading = false;
      update();
    }
  }

  goToVerifyEmailPage(UserCredential userCredential) {
    Get.offAllNamed(AppRoutes.verifyemail, arguments: {
      "userCredential": userCredential,
    });
  }

  void goToSignUp() {
    Get.offNamed(AppRoutes.signup);
  }

  void goToForgetPassword() {
    Get.toNamed(AppRoutes.forgetpassword);
  }

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    showPassword = false;

    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
