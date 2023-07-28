import 'package:bustrackr/controllers/bus_details/busdetails_controller.dart';
import 'package:bustrackr/view/widgets/busdetails/customlisttilebus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomPageBusDetails extends StatelessWidget {
  const BottomPageBusDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.find<BusDetailsController>();
    return GetBuilder<BusDetailsController>(builder: (controller) {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.95),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          height: 250,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding:
                    EdgeInsets.only(top: 12, left: 10, right: 10, bottom: 8),
                child: Text(
                  "Lignes 18",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Divider(),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    CustomListTileBus(
                      onTap: () => controller.goToBusTracking(),
                      title: "Ligne 18",
                      subtitle: "Jnane Colombe",
                      temp: "5",
                    ),
                    CustomListTileBus(
                      onTap: () => controller.goToBusTracking(),
                      title: "Ligne 18",
                      subtitle: "Jrayfate",
                      temp: "25",
                    ),
                    CustomListTileBus(
                      onTap: () => controller.goToBusTracking(),
                      title: "Ligne 18",
                      subtitle: "Faculté polydisciplinaire",
                      temp: "30",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
