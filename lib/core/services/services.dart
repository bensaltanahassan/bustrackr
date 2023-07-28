import 'dart:async';

import 'package:bustrackr/firebase_options.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MyServices extends GetxService {
  late Box boxHive;
  Future<MyServices> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await Hive.initFlutter();
    boxHive = await Hive.openBox('myBox');

    return this;
  }
}

initialService() async {
  await Get.putAsync(() => MyServices().init());
}
