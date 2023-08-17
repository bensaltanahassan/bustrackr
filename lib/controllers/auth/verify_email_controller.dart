import 'package:bustrackr/core/classes/verifyemail_exception.dart';
import 'package:bustrackr/core/constants/routes.dart';
import 'package:bustrackr/core/shared/notifications/showsnackbar.dart';
import 'package:bustrackr/data/data_source/auth_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
          title: AppLocalizations.of(Get.context!)!.error,
          message: message,
        );
      } else {
        MySnackBar.showCustomSnackBar(
          title: AppLocalizations.of(Get.context!)!.success,
          message: AppLocalizations.of(Get.context!)!.emailSentSuccessfully,
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
