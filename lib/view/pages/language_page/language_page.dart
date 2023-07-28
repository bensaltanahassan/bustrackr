import 'package:bustrackr/controllers/languages/languages_controller.dart';
import 'package:bustrackr/core/shared/custombottomnavbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LanguagesController());
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavButton(text: "Continue"),
      appBar: AppBar(
        title: const Text("Language"),
      ),
      body: GetBuilder<LanguagesController>(builder: (controller) {
        return ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          children: [
            Text(
              "Select Language",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
            const SizedBox(height: 20),
            ...controller.options
                .asMap() // Convert the list into an indexed map
                .entries
                .map(
                  (entry) => RadioListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      entry.value,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    value: entry
                        .key, // Use the index as the value for the radio button
                    groupValue: controller.selectedOption,
                    onChanged: (value) {
                      controller.selectedOption = value!;
                      controller.update();
                    },
                  ),
                )
                .toList(),
          ],
        );
      }),
    );
  }
}
