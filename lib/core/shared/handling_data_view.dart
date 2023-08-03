import 'package:bustrackr/core/constants/assets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HandlingDataView extends StatelessWidget {
  const HandlingDataView({super.key, this.isLoading, required this.child});

  final bool? isLoading;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return isLoading == true
        ? Center(
            child: Lottie.asset(
            ImageAssets.bus,
            height: 200,
            width: 300,
          ))
        : child;
  }
}
