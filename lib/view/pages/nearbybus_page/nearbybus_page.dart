import 'package:bustrackr/controllers/nerbybus/nerbybus_controller.dart';
import 'package:bustrackr/core/functions/calculate_approximatlytime.dart';
import 'package:bustrackr/core/shared/offlinewidget.dart';
import 'package:bustrackr/view/widgets/nearbybus/allbus_nearbybus.dart';
import 'package:bustrackr/view/widgets/home/drawer_home.dart';
import 'package:bustrackr/view/widgets/nearbybus/searchbar_nearbybuspage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';

class NerbyBusPage extends StatelessWidget {
  const NerbyBusPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NerbyBusController());
    return OfflineWidget(
      child: Scaffold(
          drawer: const CustomDrawer(),
          body: SafeArea(
            child: GetBuilder<NerbyBusController>(builder: (controller) {
              return controller.cameraPosition == null
                  ? const Center(child: CircularProgressIndicator())
                  : Stack(
                      children: [
                        SizedBox(
                          height: double.infinity,
                          width: double.infinity,
                          child: GoogleMap(
                            mapType: MapType.hybrid,
                            markers: controller.markers.toSet(),
                            initialCameraPosition: controller.cameraPosition!,
                            onMapCreated: (GoogleMapController mapcontroller) {
                              controller.gmc = mapcontroller;
                            },
                            polylines: {
                              Polyline(
                                polylineId: const PolylineId('polyline_id'),
                                color: Colors.blue,
                                points: controller.polylinePoints,
                                width: 4,
                              ),
                            },
                          ),
                        ),
                        // const CustomContainerOpacity(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: [
                              const SearchBarNearbyBus(),
                              if (controller.searchList.isNotEmpty)
                                Container(
                                  // define like lists of search
                                  constraints:
                                      const BoxConstraints(maxHeight: 300),
                                  width: Get.width,
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: controller.searchList.length,
                                    itemBuilder: (context, index) {
                                      return ListTile(
                                        onTap: () {
                                          String busId = controller
                                              .searchList[index].busId!;
                                          controller.searchList.clear();
                                          controller.trackingSingleBus(busId);
                                        },
                                        leading: const Icon(
                                          Icons.bus_alert,
                                          color: Colors.green,
                                        ),
                                        title: Text(
                                          "Bus ${controller.searchList[index].busNumber}",
                                          style: GoogleFonts.roboto(),
                                        ),
                                        subtitle: Text(
                                          "Faculté discipline - EL course",
                                          style: GoogleFonts.roboto(),
                                        ),
                                        trailing: Text(
                                          calculateAndFormatApproximateTime(
                                            controller.searchList[index]
                                                .distanceInMeters!,
                                          ),
                                          style: GoogleFonts.roboto(),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              const Spacer(),
                              const AllBusNearbyBusPage(),
                            ],
                          ),
                        )
                      ],
                    );
            }),
          )),
    );
  }
}
