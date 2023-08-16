import 'package:bustrackr/controllers/nerbybus/nerbybus_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchBarNearbyBus extends StatelessWidget {
  const SearchBarNearbyBus({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    NerbyBusController controller = Get.find<NerbyBusController>();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.only(top: 20),
      height: 60,
      width: Get.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {
              // open the drawer
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(Icons.menu),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: TextFormField(
              controller: controller.searchController,
              onChanged: controller.onChangeSearch,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.findBus,
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
