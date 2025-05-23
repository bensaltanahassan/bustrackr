import 'dart:io';

import 'package:bustrackr/controllers/home/home_controller.dart';
import 'package:bustrackr/core/services/services.dart';
import 'package:bustrackr/core/shared/notifications/showsnackbar.dart';
import 'package:bustrackr/data/data_models/users_model.dart';
import 'package:bustrackr/data/data_source/firestore_data.dart';
import 'package:bustrackr/data/data_source/user_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  UserModel? user;

  bool? isLoading;

  HomeController homeController = Get.find();

  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;

  File? image;

  updateInformation() async {
    // check if there is updates

    isLoading = true;
    update();

    UserData userData = UserData();

    // update image
    if (image != null) {
      FireStoreData fireStoreData = FireStoreData();
      if (user!.photoUrl == null) {
        user!.photoUrl = await fireStoreData.uploadImage(image);
      } else {
        // updated it
        user!.photoUrl =
            await fireStoreData.updateImage(image, user!.photoUrl!);
      }
    }

    UserModel updatedUser = UserModel(
      nomComplet: nameController.text,
      email: emailController.text.trim().toLowerCase(),
      telephone: phoneController.text,
      photoUrl: user?.photoUrl,
      token: user?.token,
      uid: user?.uid,
      dateCreated: user?.dateCreated,
    );

    await userData.updateUserInfo(
      email: user!.email!,
      data: updatedUser.toJson(),
    );

    user = updatedUser;

    // change in boxHive
    await Get.find<MyServices>().boxHive.put("user", updatedUser.toJson());
    homeController.initData();
    homeController.update();

    isLoading = false;
    update();
  }

  pickImage(ImageSource source) async {
    try {
      final pickedFile = await ImagePicker().pickImage(source: source);
      if (pickedFile != null) {
        image = File(pickedFile.path);
        update();
      } else {
        MySnackBar.showCustomSnackBar(
          title: AppLocalizations.of(Get.context!)!.error,
          message: AppLocalizations.of(Get.context!)!.noImageSelected,
        );
      }
    } catch (_) {
      MySnackBar.showCustomSnackBar(
        title: AppLocalizations.of(Get.context!)!.error,
        message: AppLocalizations.of(Get.context!)!.errorWhilePickingImage,
      );
    }
  }

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
              Text(
                AppLocalizations.of(Get.context!)!.changePhoto,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.camera_alt_outlined, size: 32),
                title: Text(AppLocalizations.of(Get.context!)!.takeAPhoto),
                onTap: () {
                  pickImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo, size: 32),
                title:
                    Text(AppLocalizations.of(Get.context!)!.chooseFromGallery),
                onTap: () {
                  pickImage(ImageSource.gallery);
                },
              ),
              if (user!.photoUrl != null)
                ListTile(
                  leading: const Icon(Icons.delete, size: 32),
                  title: Text(AppLocalizations.of(Get.context!)!.removePhoto),
                  onTap: () async {
                    FireStoreData fireStoreData = FireStoreData();
                    await fireStoreData.deleteImage(user!.photoUrl!);
                    image = null;
                    user!.photoUrl = null;
                    update();
                  },
                ),
            ],
          ),
        );
      },
    );
  }

  iniData() {
    user = homeController.user;
    nameController.text = user!.nomComplet!;
    emailController.text = user!.email!;
    phoneController.text = user!.telephone!;
  }

  @override
  void onInit() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    iniData();

    super.onInit();
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();

    super.onClose();
  }
}
