import 'package:bustrackr/controllers/languages/languages_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LanguagesController());
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.languages),
      ),
      body: GetBuilder<LanguagesController>(builder: (controller) {
        return ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          children: [
            Text(
              AppLocalizations.of(context)!.selectLanguage,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
            const SizedBox(height: 20),
            ...controller.options
                .map(
                  (e) => RadioListTile(
                    title: Text(e.language),
                    value: e,
                    groupValue: controller.selectedLanguage,
                    onChanged: controller.submitChangeLanguage,
                  ),
                )
                .toList(),
          ],
        );
      }),
    );
  }
}
