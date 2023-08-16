import 'package:bustrackr/data/data_models/bus_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BusData {
  final buss = FirebaseFirestore.instance.collection("bus");

  addBus(String busNumber, double lat, double lng) async {
    await buss.add({
      "busNumber": busNumber,
      "lat": lat,
      "lng": lng,
    }).then((value) async {
      await buss.doc(value.id).update({"busId": value.id});
    });
  }

  Future<List<QueryDocumentSnapshot>> getBusData() async {
    QuerySnapshot querySnapshot = await buss.get();
    return querySnapshot.docs;
  }

  // update Bus

  updateBus(String busId, Map<String, dynamic> data) async {
    var res = await buss.doc(busId).get();
    if (res.exists) {
      await buss.doc(busId).update(data);
    }
  }

  addRouteToBus({required String busId, required RoutesModel route}) async {
    try {
      await updateBus(busId, {"routes": route.toJson()});
    } catch (_) {}
  }
}
