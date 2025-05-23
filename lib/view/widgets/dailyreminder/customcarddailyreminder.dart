import 'package:bustrackr/core/constants/routes.dart';
import 'package:bustrackr/data/data_models/dailyreminder_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomCardDailyReminder extends StatelessWidget {
  const CustomCardDailyReminder({
    super.key,
    required this.dailyReminderModel,
  });

  final DailyReminderModel dailyReminderModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(
          AppRoutes.updatedailyreminder,
          arguments: dailyReminderModel,
        );
      },
      child: Card(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  )),
              child: Row(
                children: [
                  const Icon(
                    Icons.bus_alert_outlined,
                    color: Colors.green,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "${AppLocalizations.of(context)!.busLine} ${dailyReminderModel.bus.busNumber}",
                    style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "${AppLocalizations.of(context)!.remindMe}: ",
                      style: GoogleFonts.roboto(
                        color: Colors.grey[600],
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text:
                          "${dailyReminderModel.minutesBeforeArrival} ${AppLocalizations.of(context)!.min} ",
                      style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(
                      text: "${AppLocalizations.of(context)!.before} ",
                      style: GoogleFonts.roboto(
                        color: Colors.grey[600],
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: "${dailyReminderModel.busStop.name} ",
                      style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(
                      text: "${AppLocalizations.of(context)!.at} ",
                      style: GoogleFonts.roboto(
                        color: Colors.grey[600],
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: dailyReminderModel.daysOfWeek
                          .map((day) =>
                              AppLocalizations.of(context)!.dayTranslate(day))
                          .join(', '),
                      style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

extension DayLocalization on AppLocalizations {
  String dayTranslate(String day) {
    switch (day.toLowerCase()) {
      case "lundi":
        return monday;
      case "mardi":
        return tuesday;
      case "mercredi":
        return wednesday;
      case "jeudi":
        return thursday;
      case "vendredi":
        return friday;
      case "samedi":
        return saturday;
      case "dimanche":
        return sunday;
      default:
        return day;
    }
  }
}
