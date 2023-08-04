import 'dart:io';

import 'package:bustrackr/data/data_models/users_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  UserModel? userModel;

  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;

  File? image;

  updateInformation() {}

  @override
  void onInit() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();

    super.onInit();
  }

  chooseImageFromGallery() async {
    // try {
    //   final pickedFile =
    //       await ImagePicker().getImage(source: ImageSource.gallery);
    //   if (pickedFile != null) {
    //     image = File(pickedFile.path);
    //     update();
    //   }
    // } catch (_) {}
  }

  takePhoto() {}

  changePhoto(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (c) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Change Photo",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.camera_alt_outlined, size: 32),
                title: const Text("Take a photo"),
                onTap: () {
                  // Implement the logic for taking a photo
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo, size: 32),
                title: const Text("Choose from gallery"),
                onTap: () {
                  // Implement the logic for choosing from the gallery
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();

    super.onClose();
  }
}
