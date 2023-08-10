int calculateApproximateTime(double distanceInMeters) {
  // Convert distance to kilometers (1 km = 1000 m)
  double distanceInKm = distanceInMeters / 1000.0;

  // Calculate time = distance / speed
  double speedKmPerHr = 60.0; // Speed in km/h
  double timeInHours = distanceInKm / speedKmPerHr;

  // Convert time to minutes and round down
  int timeInMinutes = timeInHours.floor() * 60;
  return timeInMinutes;
}
