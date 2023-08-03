import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showAwesomeDialog({
  String? title,
  String? content,
  String? titleFirstButton,
  void Function()? onTapFirstButton,
  String? titleSecondButton,
  void Function()? onTapSecondButton,
}) {
  Get.defaultDialog(
    contentPadding: const EdgeInsets.all(8),
    content: Text(
      content!,
      textAlign: TextAlign.center,
      style: TextStyle(
          color: Colors.grey[700], fontFamily: 'Roboto', fontSize: 18),
    ),
    title: title!,
    backgroundColor: Colors.amber,
    titlePadding: const EdgeInsets.all(8),
    titleStyle: const TextStyle(
        color: Colors.black,
        fontFamily: 'Roboto',
        fontSize: 24,
        fontWeight: FontWeight.bold),
    actions: [
      InkWell(
        onTap: onTapSecondButton,
        child: Container(
          width: 100,
          height: 50,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(10)),
          child: Text(
            titleSecondButton!,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
      InkWell(
        onTap: onTapFirstButton,
        child: Container(
          width: 100,
          height: 50,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
              color: Colors.green, borderRadius: BorderRadius.circular(10)),
          child: Text(
            titleFirstButton!,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    ],
  );
}
