import 'package:bustrackr/core/classes/verifyemail_exception.dart';
import 'package:bustrackr/core/constants/routes.dart';
import 'package:bustrackr/core/functions/showsnackbar.dart';
import 'package:bustrackr/data/data_source/auth_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController {
  bool? isLoading;
  UserCredential? userCredential;
  AuthData authData = AuthData();

  initData() {
    isLoading = false;
    userCredential = Get.arguments["userCredential"];
  }

  sendVerifyEmail() async {
    if (isLoading == false) {
      isLoading = true;
      update();
      var resp = await authData.sendEmailVerification(userCredential!);
      if (resp is FirebaseAuthException) {
        String message = EmailVerificationException(resp).handleException();
        MySnackBar.showCustomSnackBar(
          title: "Error",
          message: message,
        );
      } else {
        MySnackBar.showCustomSnackBar(
          title: "Success",
          message: "Email sent successfully",
        );
      }
      isLoading = false;
      update();
    }
  }

  goToLoginPage() {
    Get.offAllNamed(
      AppRoutes.login,
    );
  }

  @override
  void onInit() {
    initData();
    super.onInit();
  }
}
