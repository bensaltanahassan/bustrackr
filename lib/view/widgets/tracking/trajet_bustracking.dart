import 'package:bustrackr/view/widgets/tracking/stepper_bustracking.dart';
import 'package:flutter/material.dart';

class TrajetsBusTracking extends StatelessWidget {
  const TrajetsBusTracking({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 300,
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Trajet du Bus",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const Divider(),
            Expanded(
              child: ListView(
                children: const [
                  StepperBusTracking(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
