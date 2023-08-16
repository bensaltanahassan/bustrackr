import 'package:bustrackr/core/constants/apptheme.dart';
import 'package:bustrackr/core/constants/locale.dart';
import 'package:bustrackr/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bustrackr/core/services/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialService();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bus Trackr',
      theme: AppThemes.themeEnglish,
      getPages: routes,
      // home: const TestHome(),
      defaultTransition: Transition.zoom,
      transitionDuration: const Duration(milliseconds: 400),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale("${myServices.boxHive.get('lang')}"),
    );
  }
}

class TestHome extends StatelessWidget {
  const TestHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.completName),
      ),
      body: Center(
        child: MaterialButton(
          onPressed: () {
            changeLanguage("en");
          },
          child: const Text("Change Language"),
        ),
      ),
    );
  }
}
