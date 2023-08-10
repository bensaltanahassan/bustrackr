import 'package:bustrackr/controllers/nerbybus/nerbybus_controller.dart';
import 'package:bustrackr/core/shared/custom_containeropacity.dart';
import 'package:bustrackr/view/widgets/nearbybus/allbus_nearbybus.dart';
import 'package:bustrackr/view/widgets/home/drawer_home.dart';
import 'package:bustrackr/view/widgets/nearbybus/searchbar_nearbybuspage.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';

class NerbyBusPage extends StatelessWidget {
  const NerbyBusPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NerbyBusController());
    return Scaffold(
        drawer: const CustomDrawer(),
        body: SafeArea(
          child: SizedBox(
            height: Get.height,
            width: Get.width,
            child: GetBuilder<NerbyBusController>(builder: (controller) {
              return Stack(
                children: [
                  SizedBox(
                    height: double.infinity,
                    width: double.infinity,
                    child: controller.cameraPosition == null
                        ? null
                        : GoogleMap(
                            mapType: MapType.hybrid,
                            markers: controller.markers.toSet(),
                            initialCameraPosition: controller.cameraPosition!,
                            onMapCreated: (GoogleMapController mapcontroller) {
                              controller.gmc = mapcontroller;
                            },
                          ),
                  ),
                  const CustomContainerOpacity(),
                  Column(
                    children: [
                      AppBar(
                        backgroundColor: Colors.transparent,
                        title: const Text("Nearby bus stops"),
                      ),
                      const SearchBarNearbyBus(),
                      const Spacer(),
                      const AllBusNearbyBusPage(),
                    ],
                  )
                ],
              );
            }),
          ),
        ));
  }
}
