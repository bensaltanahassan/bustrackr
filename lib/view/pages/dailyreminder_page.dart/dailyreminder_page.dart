import 'package:bustrackr/view/widgets/dailyreminder/customcarddailyreminder.dart';
import 'package:bustrackr/view/widgets/home/drawer_home.dart';
import 'package:flutter/material.dart';

class DailyReminderPage extends StatelessWidget {
  const DailyReminderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: const Text(
          "Daily Reminders",
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add_outlined,
              color: Colors.blue,
              size: 30,
            ),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: const [
          CustomCardDailyReminder(),
          CustomCardDailyReminder(),
          CustomCardDailyReminder(),
          CustomCardDailyReminder(),
          CustomCardDailyReminder(),
          CustomCardDailyReminder(),
          CustomCardDailyReminder(),
          CustomCardDailyReminder(),
          CustomCardDailyReminder(),
        ],
      ),
    );
  }
}
