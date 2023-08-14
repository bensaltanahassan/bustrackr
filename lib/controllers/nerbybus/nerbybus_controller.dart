import 'dart:async';

import 'package:bustrackr/core/constants/assets.dart';
import 'package:bustrackr/core/functions/calculate_approximatlytime.dart';
import 'package:bustrackr/core/functions/decode_polyline.dart';
import 'package:bustrackr/core/functions/markers.dart';
import 'package:bustrackr/data/data_models/bus_model.dart';
import 'package:bustrackr/data/data_source/bus_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class NerbyBusController extends GetxController {
  StreamSubscription<Position>? positionStream;
  int? busChoised;

  GoogleMapController? gmc;

  List<LatLng> polylinePoints = [];

  List<Marker> markers = [];
  CameraPosition? cameraPosition;

  List<BusModel> listBus = [];
  List<BitmapDescriptor> busIcons =
      List.generate(20, (index) => BitmapDescriptor.defaultMarker);
  BitmapDescriptor currentIcon = BitmapDescriptor.defaultMarker;
  LatLng? currentLatLang;

  StreamSubscription<DocumentSnapshot<Map<String, dynamic>>>?
      streamSubscription;

  BusModel? bus;

  // ========
  LatLng? busLatLang;
  bool notification = false;

  addPolyline() async {
    List<String> points = [];

    polylinePoints = await decodePolyline(points);

    // RoutesModel route = converPolylinePointsToRoute(polylinePoints);

    // await BusData().addRouteToBus(busId: "1PbtN5mdDK5ytA32IduB", route: route);

    update();
  }

  drawPolylines() {
    polylinePoints.clear();
    List<LatLng> points = [];
    if (bus != null && bus!.routes != null) {
      for (var point in bus!.routes!.points!) {
        LatLng newPoint = LatLng(point.lat!, point.lng!);
        points.add(newPoint);
      }
    }
    polylinePoints = points;
    update();
  }

  trackingSingleBus(String busId) async {
    if (streamSubscription != null) {
      streamSubscription!.cancel(); // to track another bus
    }
    streamSubscription =
        BusData().buss.doc(busId).snapshots().listen((event) async {
      if (event.exists) {
        bus = BusModel.fromJson(event.data()!);
        drawPolylines();

        double distanceInMeters = await calculeDistanceBetweenTwoPoints(
          originLat: currentLatLang!.latitude,
          originLng: currentLatLang!.longitude,
          destLat: bus!.lat!,
          destLng: bus!.lng!,
        );

        if (distanceInMeters < 50 && !notification) {
          Get.snackbar(
            "Bus ${bus!.busNumber}",
            "Bus ${bus!.busNumber} is near you",
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.green,
            colorText: Colors.white,
            duration: const Duration(seconds: 5),
            animationDuration: const Duration(milliseconds: 500),
          );
          notification = true;
        } else if (notification && distanceInMeters >= 30) {
          notification = false;
        }

        busLatLang = LatLng(bus!.lat!, bus!.lng!);
        cameraPosition = CameraPosition(
          target: busLatLang!,
          zoom: 16,
        );
        markers.removeWhere(
            (element) => element.markerId.value == "${bus!.busId}");
        markers.add(Marker(
            markerId: MarkerId("${bus!.busId}"),
            position: busLatLang!,
            icon: busIcons[int.parse(bus!.busNumber!) - 1]));
        if (gmc != null) {
          gmc!.animateCamera(
            CameraUpdate.newCameraPosition(cameraPosition!),
          );
        }
        update();
      }
    });
  }

  trackingAllBus() {
    BusData().buss.snapshots().listen((event) async {
      List<BusModel> allBuses = [];

      List<QueryDocumentSnapshot> documentsBus = event.docs;
      // use for loop
      for (var e in documentsBus) {
        Map<String, dynamic> data = e.data() as Map<String, dynamic>;
        double distanceInMeters = await calculeDistanceBetweenTwoPoints(
          originLat: currentLatLang!.latitude,
          originLng: currentLatLang!.longitude,
          destLat: data["lat"],
          destLng: data["lng"],
        );

        allBuses.add(
          BusModel(
            busId: e.id,
            busNumber: data["busNumber"],
            lat: data["lat"],
            lng: data["lng"],
            distanceInMeters: distanceInMeters,
          ),
        );
        markers
            .removeWhere((element) => element.markerId.value == data["busId"]);
        markers.add(Marker(
          markerId: MarkerId(data["busId"]),
          position: LatLng(data["lat"], data["lng"]),
          icon: busIcons[int.parse(data["busNumber"]) - 1],
        ));
      }
      // sort by minutes
      allBuses
          .sort((a, b) => a.distanceInMeters!.compareTo(b.distanceInMeters!));
      listBus = allBuses;
      update();
    });
  }

  // ========

  setCutomMarkerIcon() async {
    final Uint8List markerIconUser =
        await getBytesFromAsset(ImageAssets.user, 150);
    for (var i = 1; i <= 11; i++) {
      final Uint8List markerIconBus =
          await getBytesFromAsset("${ImageAssets.rootImages}/bus_$i.png", 200);
      busIcons[i - 1] = BitmapDescriptor.fromBytes(markerIconBus);
    }
    // 32.29913446821303, -9.243446643489513
    await BusData().addBus("04", "9", 32.29913446821303, -9.243446643489513);
    // 17 10 32.296453778992515, -9.241906227146684
    await BusData().addBus("17", "10", 32.296453778992515, -9.241906227146684);
    // 01 11 32.2961979732593, -9.241945275229241
    await BusData().addBus("01", "11", 32.2961979732593, -9.241945275229241);
    // 02 12 32.29602468509438, -9.241979442301478
    await BusData().addBus("02", "12", 32.29602468509438, -9.241979442301478);
    // 04 13 32.29657342981318, -9.241510865310373
    await BusData().addBus("04", "13", 32.29657342981318, -9.241510865310373);
    // 08 14 32.299725161258884, -9.221081475155946
    await BusData().addBus("08", "14", 32.299725161258884, -9.221081475155946);
    // 18 15 32.30156705458769, -9.221120667659239
    await BusData().addBus("18", "15", 32.30156705458769, -9.221120667659239);
    currentIcon = BitmapDescriptor.fromBytes(markerIconUser);
  }

  goToBusDetailsPage() {
    // Get.toNamed(AppRoutes.busDetails);
    // trackingSingleBus();
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
        // after get the location , track the buss
        trackingAllBus();
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
    streamSubscription?.cancel();
    super.onClose();
  }
}
