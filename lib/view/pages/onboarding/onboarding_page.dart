import 'package:bustrackr/controllers/onboarding/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    OnboardingController controller = Get.put(OnboardingController());
    return Scaffold(
      body: SafeArea(
        child: IntroductionScreen(
          showNextButton: true,
          next: Text(AppLocalizations.of(context)!.next),
          skip: Text(AppLocalizations.of(context)!.skip),
          done: Text(AppLocalizations.of(context)!.done),
          onDone: controller.onDone,
          onSkip: controller.onDone,
          showSkipButton: true,
          pages: controller.pages,
        ),
      ),
    );
  }
}
