import 'package:flutter/material.dart';

class SearchBarSearchBusByNumber extends StatelessWidget {
  const SearchBarSearchBusByNumber({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 60,
      // width: Get.width * 8,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: TextFormField(
          decoration: const InputDecoration(
            hintText: "Search",
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
