import 'package:bustrackr/controllers/home/home_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return GetBuilder<HomeController>(builder: (controller) {
      return NavigationDrawer(
          selectedIndex: controller.currentDrawerIndex,
          onDestinationSelected: controller.goToPage,
          children: [
            DrawerHeader(
                child: Row(
              children: [
                if (controller.user!.photoUrl == null)
                  const CircleAvatar(
                    radius: 60,
                    child: Icon(
                      Icons.person,
                      size: 60,
                    ),
                  ),
                if (controller.user!.photoUrl != null)
                  CachedNetworkImage(
                    imageUrl: controller.user!.photoUrl!,
                    height: 120,
                    width: 120,
                    fit: BoxFit.cover,
                    cacheKey: controller.user!.photoUrl!,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Center(
                      child: CircularProgressIndicator(
                          value: downloadProgress.progress),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.user!.nomComplet!,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      TextButton(
                        style: ButtonStyle(
                          padding:
                              MaterialStateProperty.all<EdgeInsetsGeometry>(
                            const EdgeInsets.symmetric(
                                horizontal: 0, vertical: 0),
                          ),
                        ),
                        onPressed: () {
                          controller.goToProfilePage();
                        },
                        child: Text(AppLocalizations.of(context)!.viewProfile,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  color: Colors.grey[700],
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                )),
                      ),
                    ],
                  ),
                )
              ],
            )),
            CustomNavigationDrawerDestination(
              title: AppLocalizations.of(context)!.nearbyBusStops,
              subTitle: AppLocalizations.of(context)!.nearbyBusStops,
              icon: Icons.location_on_outlined,
              color: Colors.red,
            ),

            CustomNavigationDrawerDestination(
              title: AppLocalizations.of(context)!.setDailyReminder,
              subTitle: AppLocalizations.of(context)!.dailyReminderForYourBus,
              icon: Icons.notifications_active_outlined,
              color: Colors.green,
            ),
            // share app
            CustomNavigationDrawerDestination(
              title: AppLocalizations.of(context)!.shareTheApp,
              subTitle: AppLocalizations.of(context)!.shareWithYourFriends,
              icon: Icons.share_outlined,
              color: Colors.blue,
            ),
            // connect us
            CustomNavigationDrawerDestination(
              title: AppLocalizations.of(context)!.contactUs,
              subTitle:
                  AppLocalizations.of(context)!.connectWithUsOnSocialMedia,
              icon: Icons.connect_without_contact_outlined,
              color: Colors.purple,
            ),
            // change language
            CustomNavigationDrawerDestination(
              title: AppLocalizations.of(context)!.changeLanguage,
              subTitle: AppLocalizations.of(context)!.changeTheLanguageOfTheApp,
              icon: Icons.language_outlined,
              color: Colors.orange,
            ),
            // logout
            CustomNavigationDrawerDestination(
              title: AppLocalizations.of(context)!.logout,
              subTitle: AppLocalizations.of(context)!.logoutFromTheApp,
              icon: Icons.logout_outlined,
              color: Colors.red,
            ),
          ]);
    });
  }

  // ignore: non_constant_identifier_names
  NavigationDrawerDestination CustomNavigationDrawerDestination(
      {required String title,
      required String subTitle,
      required IconData icon,
      Color? color}) {
    return NavigationDrawerDestination(
      icon: Icon(icon, color: color),
      label: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: Theme.of(Get.context!)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.w600, fontSize: 16),
          ),
          Text(
            subTitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(Get.context!).textTheme.titleSmall!.copyWith(
                  color: Colors.grey[700],
                  fontSize: 14,
                ),
          ),
        ],
      ),
    );
  }
}
