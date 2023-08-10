import 'dart:async';

import 'package:bustrackr/core/constants/assets.dart';
import 'package:bustrackr/core/functions/calculate_approximatlytime.dart';
import 'package:bustrackr/data/data_source/bus_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Future<Uint8List> getBytesFromAsset(String path, int width) async {
  ByteData data = await rootBundle.load(path);
  ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
      targetWidth: width);
  ui.FrameInfo fi = await codec.getNextFrame();
  return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
      .buffer
      .asUint8List();
}

class NerbyBusController extends GetxController {
  StreamSubscription<Position>? positionStream;

  GoogleMapController? gmc;

  List<Marker> markers = [];
  CameraPosition? cameraPosition;
  BitmapDescriptor busIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor currentIcon = BitmapDescriptor.defaultMarker;
  LatLng? currentLatLang;

  // ========
  LatLng? busLatLang;
  trackingBus() {
    bool notification = false;
    BusData().buss.doc("1PbtN5mdDK5ytA32IduB").snapshots().listen((event) {
      if (event.exists) {
        double distanceInMeters = Geolocator.distanceBetween(
          currentLatLang!.latitude,
          currentLatLang!.longitude,
          event.data()!["lat"],
          event.data()!["lng"],
        );
        print('==============================');
        print(distanceInMeters);

        print(calculateApproximateTime(distanceInMeters));
        if (distanceInMeters < 30 && !notification) {
          Get.snackbar(
            "Bus 18",
            "Bus 18 is near you",
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.green,
            colorText: Colors.white,
            duration: const Duration(seconds: 5),
          );
          notification = true;
        } else {
          notification = false;
        }

        busLatLang = LatLng(event.data()!["lat"], event.data()!["lng"]);
        cameraPosition = CameraPosition(
          target: busLatLang!,
          zoom: 16,
        );
        markers.removeWhere((element) => element.markerId.value == "bus");
        markers.add(Marker(
          markerId: const MarkerId("bus"),
          position: busLatLang!,
          icon: busIcon,
        ));
        if (gmc != null) {
          gmc!.animateCamera(
            CameraUpdate.newCameraPosition(cameraPosition!),
          );
        }
        update();
      }
    });
  }

  // ========

  setCutomMarkerIcon() async {
    final Uint8List markerIconUser =
        await getBytesFromAsset(ImageAssets.user, 150);
    final Uint8List markerIconBus =
        await getBytesFromAsset(ImageAssets.busIcon, 150);
    currentIcon = BitmapDescriptor.fromBytes(markerIconUser);
    busIcon = BitmapDescriptor.fromBytes(markerIconBus);
  }

  goToBusDetailsPage() {
    // Get.toNamed(AppRoutes.busDetails);
    trackingBus();
  }

  checkPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return true;
  }

  getCurrentLocation() async {
    var permission = await checkPermission();
    if (permission == true) {
      Geolocator.getCurrentPosition().then((Position position) {
        currentLatLang = LatLng(position.latitude, position.longitude);
        cameraPosition = CameraPosition(
          target: currentLatLang!,
          zoom: 14.4746,
        );
        markers.add(Marker(
          markerId: const MarkerId("current"),
          position: currentLatLang!,
          icon: currentIcon,
        ));
        update();
      });
    } else {
      Get.snackbar("Error", "Please enable location permission");
    }
  }

  @override
  void onInit() async {
    await setCutomMarkerIcon();
    getCurrentLocation();
    super.onInit();
  }

  @override
  void onClose() {
    positionStream?.cancel();

    super.onClose();
  }
}
