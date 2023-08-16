import 'package:bustrackr/data/data_models/users_model.dart';
import 'package:bustrackr/data/data_source/auth_data.dart';
import 'package:bustrackr/data/data_source/user_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bustrackr/core/classes/signup_exception.dart';
import 'package:bustrackr/core/constants/routes.dart';
import 'package:bustrackr/core/shared/notifications/showsnackbar.dart';

class SignUpController extends GetxController {
  late bool showPassword;
  bool? isLoading = false;

  late TextEditingController completNameController;
  late TextEditingController phoneController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPassowrdController;

  bool showGmailFieldBool = false;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AuthData authData = AuthData();
  UserData userData = UserData();

  void changeObscurity() {
    showPassword = !showPassword;
    update();
  }

  signUp() async {
    if (formKey.currentState!.validate()) {
      isLoading = true;
      update();
      var response =
          await authData.signUp(emailController.text, passwordController.text);
      if (response is FirebaseAuthException) {
        String err = SignUpException(response).handleException();
        MySnackBar.showCustomSnackBar(
          title: "Error",
          message: err,
        );
      } else if (response is UserCredential) {
        // get the date of now as string
        String dateNow = DateTime.now().toString();

        UserModel user = UserModel(
          email: emailController.text.trim().toLowerCase(),
          nomComplet: completNameController.text.trim(),
          telephone: phoneController.text.trim(),
          uid: response.user!.uid,
          dateCreated: dateNow,
        );
        await authData.sendEmailVerification(response);
        await userData.addUser(user);

        isLoading = false;
        update();

        goToVerifyEmailPage(response);
      }
    } else {}
  }

  goToVerifyEmailPage(UserCredential userCredential) {
    Get.toNamed(AppRoutes.verifyemail, arguments: {
      "userCredential": userCredential,
    });
  }

  goToLoginPage() {
    Get.offAllNamed(AppRoutes.login);
  }

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPassowrdController = TextEditingController();
    completNameController = TextEditingController();
    phoneController = TextEditingController();

    showPassword = false;
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPassowrdController.dispose();
    completNameController.dispose();
    phoneController.dispose();
    super.onClose();
  }
}
