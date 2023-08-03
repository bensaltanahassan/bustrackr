import 'package:bustrackr/core/constants/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:lottie/lottie.dart';

class OfflineWidget extends StatelessWidget {
  const OfflineWidget({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
      connectivityBuilder: (
        BuildContext context,
        ConnectivityResult connectivity,
        Widget child,
      ) {
        if (connectivity == ConnectivityResult.none) {
          return Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // give it message en french no internet
                  Lottie.asset(ImageAssets.offline),
                  const SizedBox(height: 20),
                  const Text(
                    "Verifiez votre connexion internet",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.blue,
                      // disable the underline
                      decoration: TextDecoration.none,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return child;
        }
      },
      builder: (BuildContext context) {
        return child;
      },
    );
  }
}
