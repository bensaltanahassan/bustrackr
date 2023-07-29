import 'package:bustrackr/controllers/dailyreminder/dailyreminder_controller.dart';
import 'package:bustrackr/view/widgets/dailyreminder/customcarddailyreminder.dart';
import 'package:bustrackr/view/widgets/home/drawer_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DailyReminderPage extends StatelessWidget {
  const DailyReminderPage({super.key});

  @override
  Widget build(BuildContext context) {
    DailyReminderController controller = Get.put(DailyReminderController());
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: const Text(
          "Daily Reminders",
        ),
        actions: [
          IconButton(
            onPressed: () {
              controller.goToAddDailyReminderPage();
            },
            icon: const Icon(
              Icons.add_outlined,
              color: Colors.blue,
              size: 30,
            ),
          )
        ],
      ),
      body: GetBuilder<DailyReminderController>(builder: (controller) {
        return ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          itemCount: 30,
          itemBuilder: (context, index) {
            return const CustomCardDailyReminder();
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: 10);
          },
        );
      }),
    );
  }
}
