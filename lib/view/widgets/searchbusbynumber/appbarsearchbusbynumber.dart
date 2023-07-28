import 'package:flutter/material.dart';

class AppBarSearchBusByNumber extends StatelessWidget {
  const AppBarSearchBusByNumber({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        height: 60,
        // width: Get.width * 8,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(Icons.menu),
            ),
            Expanded(
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: "Search",
                  border: InputBorder.none,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
