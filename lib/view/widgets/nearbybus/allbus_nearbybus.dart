import 'package:bustrackr/controllers/nerbybus/nerbybus_controller.dart';
import 'package:bustrackr/core/functions/calculate_approximatlytime.dart';
import 'package:bustrackr/view/widgets/nearbybus/custombus_nearbybus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllBusNearbyBusPage extends StatelessWidget {
  const AllBusNearbyBusPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.find<NerbyBusController>();
    return GetBuilder<NerbyBusController>(builder: (controller) {
      return Container(
        margin: const EdgeInsets.all(8),
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          height: 100,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: controller.listBus.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (c, i) => CustomBusHomePage(
              isChoiced: controller.busChoised == i,
              onTap: () {
                controller.trackingSingleBus(controller.listBus[i].busId!);
                controller.busChoised = i;
                controller.update();
              },
              ligne: controller.listBus[i].busNumber!,
              temp: calculateAndFormatApproximateTime(
                  controller.listBus[i].distanceInMeters!),
            ),
          ),
        ),
      );
    });
  }
}
