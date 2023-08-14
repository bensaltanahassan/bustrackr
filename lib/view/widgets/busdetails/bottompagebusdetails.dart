import 'package:bustrackr/controllers/bus_details/busdetails_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:easy_stepper/easy_stepper.dart';

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
                child: EasyStepper(
                  activeStep: 1,
                  lineLength: 70,
                  lineSpace: 0,
                  lineType: LineType.normal,
                  defaultLineColor: Colors.white,
                  finishedLineColor: Colors.orange,
                  activeStepTextColor: Colors.black87,
                  finishedStepTextColor: Colors.black87,
                  internalPadding: 0,
                  showLoadingAnimation: false,
                  stepRadius: 8,
                  showStepBorder: false,
                  lineThickness: 1.5,
                  steps: const [
                    EasyStep(
                      customStep: CircleAvatar(
                        radius: 8,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 7,
                          backgroundColor:
                              1 >= 0 ? Colors.orange : Colors.white,
                        ),
                      ),
                      title: 'Waiting',
                    ),
                    EasyStep(
                      customStep: CircleAvatar(
                        radius: 8,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 7,
                          backgroundColor:
                              1 >= 1 ? Colors.orange : Colors.white,
                        ),
                      ),
                      title: 'Order Received',
                      topTitle: true,
                    ),
                    EasyStep(
                      customStep: CircleAvatar(
                        radius: 8,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 7,
                          backgroundColor:
                              1 >= 2 ? Colors.orange : Colors.white,
                        ),
                      ),
                      title: 'Preparing',
                    ),
                    EasyStep(
                      customStep: CircleAvatar(
                        radius: 8,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 7,
                          backgroundColor:
                              1 >= 3 ? Colors.orange : Colors.white,
                        ),
                      ),
                      title: 'On Way',
                      topTitle: true,
                    ),
                    EasyStep(
                      customStep: CircleAvatar(
                        radius: 8,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 7,
                          backgroundColor:
                              1 >= 4 ? Colors.orange : Colors.white,
                        ),
                      ),
                      title: 'Delivered',
                    ),
                  ],
                  onStepReached: (index) {},
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
