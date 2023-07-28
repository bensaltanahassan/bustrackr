import 'package:bustrackr/controllers/dailyreminder/updatedailyreminder_controller.dart';
import 'package:bustrackr/core/constants/assets.dart';
import 'package:bustrackr/core/shared/custombottomnavbutton.dart';
import 'package:bustrackr/view/widgets/dailyreminder/customchoicechip.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class UpdateDailyReminderPage extends StatelessWidget {
  const UpdateDailyReminderPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(UpdateDailyReminderController());
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavButton(text: "Save"),
      appBar: AppBar(
        title: const Text(
          "Set Daily Reminder",
        ),
      ),
      body: GetBuilder<UpdateDailyReminderController>(builder: (controller) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
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
                      Text(
                        'Bus n° : 18 ',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ListTile(
                title: const Text("Jnane Colombe 2"),
                subtitle: Text(
                  "2 min before",
                  style:
                      GoogleFonts.roboto(fontSize: 14, color: Colors.grey[700]),
                ),
                trailing: Image.asset(ImageAssets.maps),
              ),
              const SizedBox(height: 10),
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
              const Wrap(
                spacing: 10,
                children: [
                  CustomChoiceChipe(label: "Monday"),
                  CustomChoiceChipe(
                    label: "Tuesday",
                    isSelected: true,
                  ),
                  CustomChoiceChipe(label: "Wednesday"),
                  CustomChoiceChipe(label: "Thursday"),
                  CustomChoiceChipe(label: "Friday"),
                  CustomChoiceChipe(
                    label: "Saturday",
                    isSelected: true,
                  ),
                  CustomChoiceChipe(label: "Sunday"),
                  CustomChoiceChipe(label: "Daily"),
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
                        label: const Text("2 min before"),
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
