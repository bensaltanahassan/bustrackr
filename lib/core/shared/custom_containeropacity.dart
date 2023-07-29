import 'package:flutter/material.dart';

class CustomContainerOpacity extends StatelessWidget {
  const CustomContainerOpacity({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      height: 120,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              Colors.white.withOpacity(.4),
              Colors.transparent,
            ],
          ),
        ), // Change the opacity value as needed
      ),
    );
  }
}
