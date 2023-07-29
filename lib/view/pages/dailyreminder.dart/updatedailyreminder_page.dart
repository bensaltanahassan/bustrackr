import 'package:bustrackr/controllers/dailyreminder/updatedailyreminder_controller.dart';
import 'package:bustrackr/core/shared/custombottomnavbutton.dart';
import 'package:bustrackr/view/widgets/dailyreminder/customchoicechip.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateDailyReminderPage extends StatelessWidget {
  const UpdateDailyReminderPage({super.key});

  @override
  Widget build(BuildContext context) {
    UpdateDailyReminderController controller =
        Get.put(UpdateDailyReminderController());
    return Scaffold(
      bottomNavigationBar: CustomBottomNavButton(
        text: "Update",
        onTap: controller.updateDailyReminder,
      ),
      appBar: AppBar(
        title: const Text(
          "Set Daily Reminder",
        ),
      ),
      body: GetBuilder<UpdateDailyReminderController>(builder: (controller) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            padding: const EdgeInsets.only(bottom: 50),
            children: [
              const Card(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.bus_alert_outlined,
                        color: Colors.green,
                      ),
                      SizedBox(width: 10),
                      Text('Choose bus'),
                    ],
                  ),
                ),
              ),
              Wrap(
                spacing: 10,
                children: [
                  for (int i = 1; i <= 30; i++)
                    CustomChoiceChipe(
                      label: i.toString(),
                      onTap: (_) => controller.chooseBusNumber(i.toString()),
                      isSelected: controller.busNumber == i.toString(),
                    ),
                ],
              ),
              const SizedBox(height: 10),
              const Card(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: Colors.green,
                      ),
                      SizedBox(width: 10),
                      Text('Choose stop'),
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
                  // Hay Salam
                  CustomChoiceChipe(
                    label: "Hay Salam",
                    onTap: (p0) => {
                      controller.chooseStop("Hay Salam"),
                    },
                    isSelected: controller.stop == "Hay Salam",
                  ),
                ],
              ),
              const Card(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.calendar_today_outlined,
                        color: Colors.green,
                      ),
                      SizedBox(width: 10),
                      Text("Select days"),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 10,
                children: [
                  CustomChoiceChipe(
                    label: "Monday",
                    onTap: (p0) => {
                      controller.chooseDay("Monday"),
                    },
                    isSelected: controller.days.contains("Monday"),
                  ),
                  CustomChoiceChipe(
                    label: "Tuesday",
                    onTap: (p0) => {
                      controller.chooseDay("Tuesday"),
                    },
                    isSelected: controller.days.contains("Tuesday"),
                  ),
                  CustomChoiceChipe(
                    label: "Wednesday",
                    onTap: (p0) => {
                      controller.chooseDay("Wednesday"),
                    },
                    isSelected: controller.days.contains("Wednesday"),
                  ),
                  CustomChoiceChipe(
                    label: "Thursday",
                    onTap: (p0) => {
                      controller.chooseDay("Thursday"),
                    },
                    isSelected: controller.days.contains("Thursday"),
                  ),
                  CustomChoiceChipe(
                    label: "Friday",
                    onTap: (p0) => {
                      controller.chooseDay("Friday"),
                    },
                    isSelected: controller.days.contains("Friday"),
                  ),
                  CustomChoiceChipe(
                    label: "Saturday",
                    onTap: (p0) => {
                      controller.chooseDay("Saturday"),
                    },
                    isSelected: controller.days.contains("Saturday"),
                  ),
                  CustomChoiceChipe(
                    label: "Sunday",
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
                      const Text("Remind me"),
                      const Spacer(),
                      TextButton.icon(
                        onPressed: () {
                          controller.showPicker(context);
                        },
                        icon: const Icon(Icons.edit_outlined),
                        label: Text(controller.timeBefore == null
                            ? ""
                            : "${controller.timeBefore} min before"),
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
