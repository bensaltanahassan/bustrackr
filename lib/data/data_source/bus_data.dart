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

  Future<List<QueryDocumentSnapshot>> getAllBuss() async {
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

  // getBusById
  getBusById({required String busId}) async {
    DocumentSnapshot<Map<String, dynamic>> data = await buss.doc(busId).get();

    return BusModel.fromJson(data.data() as Map<String, dynamic>);
  }

  addRouteToBus({required String busId, required RoutesModel route}) async {
    try {
      await updateBus(busId, {"routes": route.toJson()});
    } catch (_) {}
  }
}
