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
  GoogleMapController? gmc;
  late TextEditingController searchController;

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
  StreamSubscription<QuerySnapshot<Map<String, dynamic>>>?
      streamSubscriptionAllBus;

  BusModel? bus;

  // ========
  LatLng? busLatLang;
  bool notification = false;

  List<BusModel> searchList = [];

  onChangeSearch(String? v) {
    if (v == null) {
      searchList = [];
      update();
      return;
    }
    if (v.isEmpty) {
      searchList = [];
      update();
      return;
    }

    searchList =
        listBus.where((element) => element.busNumber!.contains(v)).toList();
    // sort
    searchList
        .sort((a, b) => a.distanceInMeters!.compareTo(b.distanceInMeters!));

    update();
  }

  // TODO! For test only
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
    if (bus != null && busId == bus!.busId) {
      return; // rien a faire on a deja en trein de tracking ce bus
    }
    if (streamSubscription != null) {
      streamSubscription!.cancel(); // to track another bus
    }

    try {
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
          if (gmc != null) {
            gmc!.animateCamera(
              CameraUpdate.newCameraPosition(cameraPosition!),
            );
          }
        }
      });
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  trackingAllBus() {
    try {
      streamSubscriptionAllBus =
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
          markers.removeWhere(
              (element) => element.markerId.value == data["busId"]);
          markers.add(Marker(
            markerId: MarkerId(data["busId"]),
            position: LatLng(data["lat"], data["lng"]),
            onTap: () {
              trackingSingleBus(data["busId"]);
            },
            icon: busIcons[int.parse(data["busNumber"]) - 1],
          ));
        }
        // sort by minutes
        allBuses
            .sort((a, b) => a.distanceInMeters!.compareTo(b.distanceInMeters!));
        listBus = allBuses;
        update();
      });
      // numberBuss =  all number of buses wi
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  setCutomMarkerIcon() async {
    final Uint8List markerIconUser =
        await getBytesFromAsset(ImageAssets.user, 150);
    for (var i = 1; i <= 20; i++) {
      final Uint8List markerIconBus =
          await getBytesFromAsset("${ImageAssets.rootImages}/bus_$i.png", 200);
      busIcons[i - 1] = BitmapDescriptor.fromBytes(markerIconBus);
    }
    currentIcon = BitmapDescriptor.fromBytes(markerIconUser);
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
      try {
        Geolocator.getCurrentPosition().then((Position position) {
          currentLatLang = LatLng(position.latitude, position.longitude);
          markers.add(Marker(
            markerId: const MarkerId("current"),
            position: currentLatLang!,
            icon: currentIcon,
          ));
          cameraPosition = CameraPosition(
            target: currentLatLang!,
            zoom: 14.4746,
          );
          update();
          // after get the location , track the buss
          trackingAllBus();
        });
      } catch (e) {
        Get.snackbar("Error", e.toString());
      }
    } else {
      Get.snackbar("Error", "Please enable location permission");
    }
  }

  @override
  void onInit() async {
    searchController = TextEditingController();
    await setCutomMarkerIcon();
    getCurrentLocation();

    super.onInit();
  }

  @override
  void onClose() {
    streamSubscription?.cancel();
    streamSubscriptionAllBus?.cancel();
    searchController.dispose();

    super.onClose();
  }
}
