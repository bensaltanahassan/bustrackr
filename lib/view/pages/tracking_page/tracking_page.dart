import 'package:bustrackr/controllers/tracking/tracking_controller.dart';
import 'package:bustrackr/core/constants/assets.dart';
import 'package:bustrackr/view/widgets/tracking/appbar_tracking.dart';
import 'package:bustrackr/view/widgets/tracking/trajet_bustracking.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class TrackingPage extends StatelessWidget {
  const TrackingPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TrackingController());
    return Scaffold(
        body: SafeArea(
      child: SizedBox(
        height: Get.height,
        width: Get.width,
        child: GetBuilder<TrackingController>(builder: (controller) {
          return Stack(
            children: [
              Image.asset(
                ImageAssets.maps,
                height: Get.height,
                width: Get.width,
                fit: BoxFit.cover,
              ),
              const AppBarTracking(),
              const TrajetsBusTracking(),
            ],
          );
        }),
      ),
    ));
  }
}
