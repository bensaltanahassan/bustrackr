import 'package:bustrackr/controllers/dailyreminder/adddailyreminder_controller.dart';
import 'package:bustrackr/core/shared/custombottomnavbutton.dart';
import 'package:bustrackr/view/widgets/dailyreminder/customchoicechip.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddDailyReminderPage extends StatelessWidget {
  const AddDailyReminderPage({super.key});

  @override
  Widget build(BuildContext context) {
    AddDailyReminderController controller =
        Get.put(AddDailyReminderController());
    return Scaffold(
      bottomNavigationBar: CustomBottomNavButton(
        text: AppLocalizations.of(context)!.add,
        onTap: controller.addDailyReminder,
      ),
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.addDailyReminder,
        ),
      ),
      body: GetBuilder<AddDailyReminderController>(builder: (controller) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            padding: const EdgeInsets.only(bottom: 50),
            children: [
              Card(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.bus_alert_outlined,
                        color: Colors.green,
                      ),
                      const SizedBox(width: 10),
                      Text(AppLocalizations.of(context)!.selectBus),
                    ],
                  ),
                ),
              ),
              Wrap(
                spacing: 10,
                children: [
                  for (int i = 1; i <= 11; i++)
                    CustomChoiceChipe(
                      label: i.toString(),
                      onTap: (_) => controller.chooseBusNumber(i.toString()),
                      isSelected: controller.busNumber == i.toString(),
                    ),
                ],
              ),
              const SizedBox(height: 10),
              Card(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        color: Colors.green,
                      ),
                      const SizedBox(width: 10),
                      Text(AppLocalizations.of(context)!.selectStop),
                    ],
                  ),
                ),
              ),
              Wrap(
                spacing: 10,
                children: [
                  CustomChoiceChipe(
                    label: "Marjane",
                    onTap: (p0) => {
                      controller.chooseStop("Marjane"),
                    },
                    isSelected: controller.stop == "Marjane",
                  ),
                  CustomChoiceChipe(
                    label: "Istienaf",
                    onTap: (p0) => {
                      controller.chooseStop("Istienaf"),
                    },
                    isSelected: controller.stop == "Istienaf",
                  ),
                  CustomChoiceChipe(
                    label: "El khawarizmi",
                    onTap: (p0) => {
                      controller.chooseStop("El khawarizmi"),
                    },
                    isSelected: controller.stop == "El khawarizmi",
                  ),
                  // Jnane Colomb
                  CustomChoiceChipe(
                    label: "Jnane Colomb",
                    onTap: (p0) => {
                      controller.chooseStop("Jnane Colomb"),
                    },
                    isSelected: controller.stop == "Jnane Colomb",
                  ),
                  // Miftah ELKhir
                  CustomChoiceChipe(
                    label: "Miftah ELKhir",
                    onTap: (p0) => {
                      controller.chooseStop("Miftah ELKhir"),
                    },
                    isSelected: controller.stop == "Miftah ELKhir",
                  ),
                ],
              ),
              Card(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.calendar_today_outlined,
                        color: Colors.green,
                      ),
                      const SizedBox(width: 10),
                      Text(AppLocalizations.of(context)!.selectDays),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 10,
                children: [
                  CustomChoiceChipe(
                    label: "Lundi",
                    onTap: (p0) => {
                      controller.chooseDay("Monday"),
                    },
                    isSelected: controller.days.contains("Monday"),
                  ),
                  CustomChoiceChipe(
                    label: "Mardi",
                    onTap: (p0) => {
                      controller.chooseDay("Tuesday"),
                    },
                    isSelected: controller.days.contains("Tuesday"),
                  ),
                  CustomChoiceChipe(
                    label: "Mercredi",
                    onTap: (p0) => {
                      controller.chooseDay("Wednesday"),
                    },
                    isSelected: controller.days.contains("Wednesday"),
                  ),
                  CustomChoiceChipe(
                    label: "Jeudi",
                    onTap: (p0) => {
                      controller.chooseDay("Thursday"),
                    },
                    isSelected: controller.days.contains("Thursday"),
                  ),
                  CustomChoiceChipe(
                    label: "Vendredi",
                    onTap: (p0) => {
                      controller.chooseDay("Friday"),
                    },
                    isSelected: controller.days.contains("Friday"),
                  ),
                  CustomChoiceChipe(
                    label: "Samedi",
                    onTap: (p0) => {
                      controller.chooseDay("Saturday"),
                    },
                    isSelected: controller.days.contains("Saturday"),
                  ),
                  CustomChoiceChipe(
                    label: "Dimanche",
                    onTap: (p0) => {
                      controller.chooseDay("Sunday"),
                    },
                    isSelected: controller.days.contains("Sunday"),
                  ),
                  CustomChoiceChipe(
                    label: "Daily",
                    onTap: (p0) {
                      controller.chooseAllDays("_");
                    },
                    isSelected: controller.days.length == 7,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Card(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.notifications_none_outlined,
                        color: Colors.green,
                      ),
                      const SizedBox(width: 10),
                      Text(AppLocalizations.of(context)!.remindMe),
                      const Spacer(),
                      TextButton.icon(
                        onPressed: () {
                          controller.showPicker(context);
                        },
                        icon: const Icon(Icons.edit_outlined),
                        label: Text(controller.timeBefore == null
                            ? ""
                            : "${controller.timeBefore} min ${AppLocalizations.of(context)!.before}"),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
