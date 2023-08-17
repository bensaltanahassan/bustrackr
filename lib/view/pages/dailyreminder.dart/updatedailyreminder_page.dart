import 'package:bustrackr/controllers/dailyreminder/updatedailyreminder_controller.dart';
import 'package:bustrackr/core/shared/custombottomnavbutton.dart';
import 'package:bustrackr/core/shared/handling_data_view.dart';
import 'package:bustrackr/view/widgets/dailyreminder/customchoicechip.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UpdateDailyReminderPage extends StatelessWidget {
  const UpdateDailyReminderPage({super.key});

  @override
  Widget build(BuildContext context) {
    UpdateDailyReminderController controller =
        Get.put(UpdateDailyReminderController());
    return Scaffold(
      bottomNavigationBar: CustomBottomNavButton(
        text: AppLocalizations.of(context)!.update,
        onTap: controller.updateDailyReminder,
      ),
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.setDailyReminder,
        ),
        actions: [
          IconButton(
            onPressed: () {
              controller.deleteDailyReminder();
            },
            icon: const Icon(Icons.delete_outline),
          ),
        ],
      ),
      body: GetBuilder<UpdateDailyReminderController>(builder: (controller) {
        return HandlingDataView(
          isLoading: controller.isLoadingBus,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              padding: const EdgeInsets.only(bottom: 50),
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
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
                    for (var bus in controller.listBus)
                      CustomChoiceChipe(
                        label: bus.busNumber!,
                        onTap: (_) => controller.chooseBus(bus),
                        isSelected: controller.bus != null &&
                            controller.bus!.busNumber == bus.busNumber,
                      ),
                  ],
                ),
                const SizedBox(height: 10),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
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
                controller.isLoadingStops == true
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Wrap(
                        spacing: 10,
                        children: [
                          for (var stop in controller.stopsByBus)
                            CustomChoiceChipe(
                              label: stop.name,
                              onTap: (p0) => {
                                controller.chooseStop(stop),
                              },
                              isSelected: controller.stop != null &&
                                  controller.stop!.name == stop.name,
                            ),
                        ],
                      ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
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
                      label: AppLocalizations.of(context)!.monday,
                      onTap: (p0) => {
                        controller.chooseDay("Lundi"),
                      },
                      isSelected: controller.days.contains("Lundi"),
                    ),
                    CustomChoiceChipe(
                      label: AppLocalizations.of(context)!.tuesday,
                      onTap: (p0) => {
                        controller.chooseDay("Mardi"),
                      },
                      isSelected: controller.days.contains("Mardi"),
                    ),
                    CustomChoiceChipe(
                      label: AppLocalizations.of(context)!.wednesday,
                      onTap: (p0) => {
                        controller.chooseDay("Mercredi"),
                      },
                      isSelected: controller.days.contains("Mercredi"),
                    ),
                    CustomChoiceChipe(
                      label: AppLocalizations.of(context)!.thursday,
                      onTap: (p0) => {
                        controller.chooseDay("Jeudi"),
                      },
                      isSelected: controller.days.contains("Jeudi"),
                    ),
                    CustomChoiceChipe(
                      label: AppLocalizations.of(context)!.friday,
                      onTap: (p0) => {
                        controller.chooseDay("Vendredi"),
                      },
                      isSelected: controller.days.contains("Vendredi"),
                    ),
                    CustomChoiceChipe(
                      label: AppLocalizations.of(context)!.saturday,
                      onTap: (p0) => {
                        controller.chooseDay("Samedi"),
                      },
                      isSelected: controller.days.contains("Samedi"),
                    ),
                    CustomChoiceChipe(
                      label: AppLocalizations.of(context)!.sunday,
                      onTap: (p0) => {
                        controller.chooseDay("Dimanche"),
                      },
                      isSelected: controller.days.contains("Dimanche"),
                    ),
                    CustomChoiceChipe(
                      label: AppLocalizations.of(context)!.daily,
                      onTap: (p0) {
                        controller.chooseAllDays();
                      },
                      isSelected: controller.days.length == 7,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
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
                              : "${controller.timeBefore} ${AppLocalizations.of(context)!.min} ${AppLocalizations.of(context)!.before}"),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
