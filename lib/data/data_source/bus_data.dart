import 'package:cloud_firestore/cloud_firestore.dart';

class BusData {
  final buss = FirebaseFirestore.instance.collection("bus");
}
