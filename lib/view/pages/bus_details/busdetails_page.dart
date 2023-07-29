import 'package:bustrackr/controllers/bus_details/busdetails_controller.dart';
import 'package:bustrackr/core/constants/assets.dart';
import 'package:bustrackr/core/shared/custom_containeropacity.dart';
import 'package:bustrackr/view/widgets/busdetails/appbarbusdetails.dart';
import 'package:bustrackr/view/widgets/busdetails/bottompagebusdetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BusDetailsPage extends StatelessWidget {
  const BusDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(BusDetailsController());
    return Scaffold(
        body: SafeArea(
      child: SizedBox(
        height: Get.height,
        width: Get.width,
        child: GetBuilder<BusDetailsController>(builder: (controller) {
          return Stack(
            children: [
              Image.asset(
                ImageAssets.maps,
                height: Get.height,
                width: Get.width,
                fit: BoxFit.cover,
              ),
              const CustomContainerOpacity(),
              const AppBarBusDetails(),
              const BottomPageBusDetails()
            ],
          );
        }),
      ),
    ));
  }
}
