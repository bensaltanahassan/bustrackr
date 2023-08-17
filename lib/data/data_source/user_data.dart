import 'package:bustrackr/data/data_models/users_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  final users = FirebaseFirestore.instance.collection("users");

  Future<void> addUser(UserModel user) async {
    try {
      await users.doc(user.uid).set(user.toJson());
    } catch (_) {}
  }

  Future<UserModel?> getUserByEmail(String email) async {
    try {
      var resp = await users.where("email", isEqualTo: email).get();
      if (resp.docs.isNotEmpty) {
        return UserModel.fromJson(resp.docs.first.data());
      } else {
        return null;
      }
    } catch (_) {}
    return null;
  }

  updateUserInfo({required String email, Map<String, dynamic>? data}) async {
    var resp = await users.where("email", isEqualTo: email).get();
    if (resp.docs.isNotEmpty) {
      String docId = resp.docs.first.id;
      await users.doc(docId).update(data!);
    }
  }
}
