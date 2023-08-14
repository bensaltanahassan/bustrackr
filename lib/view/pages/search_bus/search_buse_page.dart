// import 'package:bustrackr/controllers/searchbus/searchbusbynumber_controller.dart';
// import 'package:bustrackr/core/constants/assets.dart';
// import 'package:bustrackr/core/shared/custom_containeropacity.dart';
// import 'package:bustrackr/view/widgets/home/drawer_home.dart';
// import 'package:bustrackr/view/widgets/searchbusbynumber/searchbarsearchbusbynumber.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class SearchBusbyNumberPage extends StatelessWidget {
//   const SearchBusbyNumberPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Get.put(SearchBusByNumberController());
//     return Scaffold(
//         drawer: const CustomDrawer(),
//         body: SafeArea(
//           child: SizedBox(
//             height: Get.height,
//             width: Get.width,
//             child:
//                 GetBuilder<SearchBusByNumberController>(builder: (controller) {
//               return Stack(
//                 children: [
//                   Image.asset(
//                     ImageAssets.maps,
//                     height: Get.height,
//                     width: Get.width,
//                     fit: BoxFit.cover,
//                   ),
//                   const CustomContainerOpacity(),
//                   Column(
//                     children: [
//                       AppBar(
//                         backgroundColor: Colors.transparent,
//                         title: const Text("Search bus"),
//                       ),
//                       const SearchBarSearchBusByNumber(),
//                     ],
//                   )
//                 ],
//               );
//             }),
//           ),
//         ));
//   }
// }
