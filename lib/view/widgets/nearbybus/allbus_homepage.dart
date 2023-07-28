import 'package:bustrackr/controllers/nerbybus/nerbybus_controller.dart';
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
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: [
              CustomBusHomePage(
                onTap: () => controller.goToBusDetailsPage(),
                ligne: "18",
                temp: "05",
              ),
              CustomBusHomePage(
                onTap: () => controller.goToBusDetailsPage(),
                ligne: "04",
                temp: "30",
              ),
              CustomBusHomePage(
                onTap: () => controller.goToBusDetailsPage(),
                ligne: "12",
                temp: "15",
              ),
            ],
          ),
        ),
      );
    });
  }
}
