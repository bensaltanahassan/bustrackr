import 'package:another_stepper/another_stepper.dart';
import 'package:flutter/material.dart';

class StepperBusTracking extends StatelessWidget {
  const StepperBusTracking({super.key});

  @override
  Widget build(BuildContext context) {
    return AnotherStepper(
      activeIndex: 2,
      stepperDirection: Axis.vertical,
      iconWidth: 40,
      iconHeight: 40,
      verticalGap: 18,
      stepperList: [
        CustomStepBus(
          title: "Sidi Abdelkrim",
          subTitle: "20 min",
          isActive: false,
          isPassed: true,
        ),
        CustomStepBus(
          title: "Jnane Colombe 2",
          subTitle: "15 min",
          isActive: false,
          isPassed: true,
        ),
        CustomStepBus(
          title: "Miftah lkhir",
          subTitle: "10 min",
          isActive: true,
          isPassed: false,
        ),
        CustomStepBus(
          title: "Hay Salam",
          subTitle: "5 min",
          isActive: false,
          isPassed: false,
        ),
      ],
    );
  }

  StepperData CustomStepBus({
    required String title,
    required String subTitle,
    required bool isActive,
    required bool isPassed,
  }) {
    return StepperData(
        title: StepperText(
          title,
          textStyle: const TextStyle(
            color: Colors.grey,
          ),
        ),
        subtitle: StepperText(isPassed ? "Passé" : subTitle),
        iconWidget: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: isActive
                  ? Colors.blue
                  : isPassed
                      ? Colors.green
                      : Colors.grey,
              borderRadius: const BorderRadius.all(Radius.circular(30))),
          child: const Icon(Icons.bus_alert_outlined, color: Colors.white),
        ));
  }
}
