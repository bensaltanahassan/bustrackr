import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;

class FireStoreData {
  final firebaseStorage = FirebaseStorage.instance;

  Future<String?> uploadImage(File? image) async {
    if (image == null) return null;
    var imageName = path.basenameWithoutExtension(image.path) +
        DateTime.now().millisecondsSinceEpoch.toString();
    var ref = firebaseStorage.ref().child("images/$imageName");
    var uploadTask = ref.putFile(image);
    var url = await (await uploadTask).ref.getDownloadURL();
    return url;
  }

  Future<void> deleteImage(String url) async {
    var ref = firebaseStorage.refFromURL(url);
    await ref.delete();
  }

  // update image
  Future<String?> updateImage(File? image, String oldUrl) async {
    if (image == null) return null;
    await deleteImage(oldUrl);
    return await uploadImage(image);
  }
}
