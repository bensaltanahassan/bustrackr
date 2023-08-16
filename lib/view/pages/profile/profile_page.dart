import 'package:bustrackr/controllers/profile/profile_controller.dart';
import 'package:bustrackr/core/shared/custom_text_field.dart';
import 'package:bustrackr/core/shared/custombottomnavbutton.dart';
import 'package:bustrackr/core/shared/handling_data_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController controller = Get.put(ProfileController());
    return Scaffold(
        bottomNavigationBar: CustomBottomNavButton(
          text: AppLocalizations.of(context)!.saveChanges,
          onTap: controller.updateInformation,
        ),
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.myProfile,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  )),
        ),
        body: GetBuilder<ProfileController>(builder: (controller) {
          return HandlingDataView(
            isLoading: controller.isLoading,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      if (controller.image == null &&
                          controller.user!.photoUrl == null)
                        const CircleAvatar(
                          radius: 60,
                          child: Icon(
                            Icons.person,
                            size: 60,
                          ),
                        ),
                      if (controller.image != null)
                        Image.file(
                          controller.image!,
                          height: 120,
                          width: 120,
                          fit: BoxFit.cover,
                        ),
                      if (controller.image == null &&
                          controller.user!.photoUrl != null)
                        CachedNetworkImage(
                          imageUrl: controller.user!.photoUrl!,
                          height: 120,
                          width: 120,
                          fit: BoxFit.cover,
                          cacheKey: controller.user!.photoUrl!,
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) => Center(
                            child: CircularProgressIndicator(
                                value: downloadProgress.progress),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: SizedBox(
                          height: 120,
                          width: 120,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(controller.user!.nomComplet!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      )),
                              TextButton.icon(
                                style: ButtonStyle(
                                  padding: MaterialStateProperty.all<
                                      EdgeInsetsGeometry>(
                                    const EdgeInsets.symmetric(
                                        horizontal: 0, vertical: 0),
                                  ),
                                ),
                                onPressed: () =>
                                    controller.changePhoto(context),
                                icon: const Icon(
                                  Icons.camera_alt_outlined,
                                  color: Colors.blue,
                                  size: 20,
                                ),
                                label: Text(
                                    AppLocalizations.of(context)!
                                        .changeProfilePic,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                          color: Colors.grey[700],
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        )),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  const Divider(),
                  const SizedBox(height: 20),
                  CustomTextFormFieldAuth(
                    labelText: AppLocalizations.of(context)!.completName,
                    prefixIcon: const Icon(Icons.person),
                    controller: controller.nameController,
                  ),
                  // email
                  const SizedBox(height: 15),
                  CustomTextFormFieldAuth(
                    labelText: AppLocalizations.of(context)!.email,
                    prefixIcon: const Icon(Icons.email_outlined),
                    controller: controller.emailController,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 15),
                  //phone
                  CustomTextFormFieldAuth(
                    labelText: AppLocalizations.of(context)!.phone,
                    prefixIcon: const Icon(Icons.phone),
                    controller: controller.phoneController,
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                  ),
                ],
              ),
            ),
          );
        }));
  }
}
