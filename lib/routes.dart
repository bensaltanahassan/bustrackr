import 'package:bustrackr/core/constants/routes.dart';
import 'package:bustrackr/view/pages/bus_details/busdetails_page.dart';
import 'package:bustrackr/view/pages/contactus/contactus_page.dart';
import 'package:bustrackr/view/pages/dailyreminder.dart/adddailyreminder_page.dart';
import 'package:bustrackr/view/pages/dailyreminder.dart/dailyreminder_page.dart';
import 'package:bustrackr/view/pages/dailyreminder.dart/updatedailyreminder_page.dart';
import 'package:bustrackr/view/pages/language_page/language_page.dart';
import 'package:bustrackr/view/pages/nearbybus_page/nearbybus_page.dart';
import 'package:bustrackr/view/pages/profile/profile_page.dart';
import 'package:bustrackr/view/pages/search_bus/search_buse_page.dart';
import 'package:bustrackr/view/pages/tracking_page/tracking_page.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  //home
  GetPage<dynamic>(name: AppRoutes.index, page: () => const NerbyBusPage()),
  // GetPage<dynamic>(name: AppRoutes.index, page: () => const LanguagePage()),
  GetPage<dynamic>(
    name: AppRoutes.nearbybus,
    page: () => const NerbyBusPage(),
  ),
  GetPage<dynamic>(
    name: AppRoutes.busDetails,
    page: () => const BusDetailsPage(),
  ),
  GetPage<dynamic>(
    name: AppRoutes.trackingPage,
    page: () => const TrackingPage(),
  ),
  GetPage<dynamic>(
    name: AppRoutes.profilePage,
    page: () => const ProfilePage(),
  ),
  GetPage<dynamic>(
    name: AppRoutes.searchbusbynumber,
    page: () => const SearchBusbyNumberPage(),
  ),
  GetPage<dynamic>(
    name: AppRoutes.dailyreminder,
    page: () => const DailyReminderPage(),
  ),
  GetPage<dynamic>(
    name: AppRoutes.updatedailyreminder,
    page: () => const UpdateDailyReminderPage(),
  ),
  GetPage<dynamic>(
    name: AppRoutes.adddailyreminder,
    page: () => const AddDailyReminderPage(),
  ),
  GetPage<dynamic>(
    name: AppRoutes.contactus,
    page: () => const ContactUsPage(),
  ),
  GetPage<dynamic>(
    name: AppRoutes.languages,
    page: () => const LanguagePage(),
  ),
];
