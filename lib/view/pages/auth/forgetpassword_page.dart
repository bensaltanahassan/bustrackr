import 'package:bustrackr/core/constants/assets.dart';
import 'package:bustrackr/core/shared/custom_text_field.dart';
import 'package:bustrackr/core/shared/custombottomnavbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bustrackr/controllers/auth/forget_password_controller.dart';
import 'package:bustrackr/core/shared/handling_data_view.dart';
import 'package:bustrackr/core/shared/offlinewidget.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetPasswordController controller = Get.put(ForgetPasswordController());
    return OfflineWidget(
      child: Scaffold(
        bottomNavigationBar: CustomBottomNavButton(
          text: AppLocalizations.of(context)!.send,
          onTap: controller.sendEmailChangePassword,
        ),
        body: GetBuilder<ForgetPasswordController>(builder: (controller) {
          return HandlingDataView(
            isLoading: controller.isLoading,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 80, 20, 0),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Lottie.asset(
                        ImageAssets.bus,
                        height: 150,
                        width: 150,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        AppLocalizations.of(context)!.forgotPassword,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                              color: Colors.black.withOpacity(0.8),
                              fontWeight: FontWeight.w500,
                              fontSize: 22,
                            ),
                      ),
                      // tell him to insert his email to receive an email for recuparition
                      const SizedBox(height: 10),
                      Text(
                        AppLocalizations.of(context)!
                            .enterYourEmailToReceiveRecoveryEmail,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(height: 20),
                      CustomTextFormFieldAuth(
                        controller: controller.emailController,
                        labelText: AppLocalizations.of(context)!.email,
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
