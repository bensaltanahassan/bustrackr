import 'package:bustrackr/core/constants/assets.dart';
import 'package:bustrackr/core/shared/custombottomnavbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:bustrackr/controllers/auth/verify_email_controller.dart';
import 'package:bustrackr/core/shared/offlinewidget.dart';
import 'package:bustrackr/core/shared/handling_data_view.dart';

class VerifyEmailPage extends StatelessWidget {
  const VerifyEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    VerifyEmailController controller = Get.put(VerifyEmailController());
    return OfflineWidget(
      child: Scaffold(
        bottomNavigationBar: CustomBottomNavButton(
          text: "Renvoyer",
          onTap: controller.sendVerifyEmail,
        ),
        body: GetBuilder<VerifyEmailController>(builder: (controller) {
          return HandlingDataView(
            isLoading: controller.isLoading,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Lottie.asset(ImageAssets.verificationemail),
                      const SizedBox(height: 20),
                      Text(
                        "Vérifiez votre boîte de réception et cliquez sur le lien de vérification pour vérifier votre email",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: CustomBottomNavButton(
                          text: "Back to login",
                          onTap: controller.goToLoginPage,
                          color: Colors.green,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
