import 'package:bustrackr/data/data_models/stop_modal.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StopData {
  final stops = FirebaseFirestore.instance.collection("stops");

  // add stop
  addStop({required StopModel stop}) async {
    await stops.add(stop.toJson()).then((value) async {
      await value.update({"stopId": value.id});
    });
  }

  // get Stop By Id
  getStopById({required String stopId}) async {
    var data = await stops.doc(stopId).get();
    return StopModel.fromJson(data.data() as Map<String, dynamic>);
  }
}
