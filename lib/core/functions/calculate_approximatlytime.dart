import 'package:bustrackr/core/functions/decode_polyline.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

String calculateAndFormatApproximateTime(double distanceInMeters) {
  double timeInMinutes = calculateApproximateTime(distanceInMeters);
  return formatTime(timeInMinutes);
}

double calculateApproximateTime(double distanceInMeters) {
  // Convert distance to kilometers (1 km = 1000 m)
  double distanceInKm = distanceInMeters / 1000.0;

  // Calculate time = distance / speed
  double speedKmPerHr = 60.0; // Speed in km/h
  double timeInHours = distanceInKm / speedKmPerHr;

  // Convert time to minutes and round down
  double timeInMinutes = (timeInHours * 60);
  return timeInMinutes;
}

String formatTime(double numberMinutes) {
  if (numberMinutes >= 60) {
    int hours = numberMinutes ~/ 60;
    int remainingMinutes = (numberMinutes % 60).toInt();
    return '$hours ${AppLocalizations.of(Get.context!)!.hr} $remainingMinutes ${AppLocalizations.of(Get.context!)!.min}';
  } else if (numberMinutes >= 1) {
    return '${numberMinutes.toInt()} ${AppLocalizations.of(Get.context!)!.min}';
  } else if (numberMinutes > .1) {
    return '< 1 ${AppLocalizations.of(Get.context!)!.min}';
  } else {
    return AppLocalizations.of(Get.context!)!.arrived;
  }
}

Future<double> calculeDistanceBetweenTwoPoints({
  required double originLat,
  required double originLng,
  required double destLat,
  required double destLng,
}) async {
  Set<Polyline> polylines = await getPolyline(
    originLat: originLat,
    originLng: originLng,
    destLat: destLat,
    destLng: destLng,
  );
  List<LatLng> polylineCoordinates = [];
  for (Polyline polyline in polylines) {
    polylineCoordinates = polyline.points;
  }

  double toTalDistance = 0;
  for (int i = 0; i < polylineCoordinates.length - 1; i++) {
    LatLng origin = LatLng(
      polylineCoordinates[i].latitude,
      polylineCoordinates[i].longitude,
    );

    int nextIndex = i + 1;

    if (nextIndex >= polylineCoordinates.length) {
      break; // Prevent index out of bounds error
    }

    LatLng destination = LatLng(
      polylineCoordinates[nextIndex].latitude,
      polylineCoordinates[nextIndex].longitude,
    );

    double distanceInMeters = Geolocator.distanceBetween(
      origin.latitude,
      origin.longitude,
      destination.latitude,
      destination.longitude,
    );

    toTalDistance += distanceInMeters;
  }
  return toTalDistance;
}
