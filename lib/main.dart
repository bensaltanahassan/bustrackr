import 'package:bustrackr/core/constants/apptheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bustrackr/core/services/services.dart';
import 'package:bustrackr/routes.dart';

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
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bus Trackr',
      theme: AppThemes.themeEnglish,
      getPages: routes,
      defaultTransition: Transition.zoom,
      transitionDuration: const Duration(milliseconds: 500),
    );
  }
}
