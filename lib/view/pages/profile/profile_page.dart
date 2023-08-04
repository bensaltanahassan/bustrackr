import 'package:bustrackr/controllers/profile/profile_controller.dart';
import 'package:bustrackr/core/constants/assets.dart';
import 'package:bustrackr/core/shared/custom_text_field.dart';
import 'package:bustrackr/core/shared/custombottomnavbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController controller = Get.put(ProfileController());
    return Scaffold(
        bottomNavigationBar: CustomBottomNavButton(
          text: "Save",
          onTap: () {},
        ),
        appBar: AppBar(
          title: Text("My Profile",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  )),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    ImageAssets.hassan,
                    height: 120,
                    width: 120,
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
                          Text("Hassan Bensaltana",
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
                              padding:
                                  MaterialStateProperty.all<EdgeInsetsGeometry>(
                                const EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 0),
                              ),
                            ),
                            onPressed: () => controller.changePhoto(context),
                            icon: const Icon(
                              Icons.camera_alt_outlined,
                              color: Colors.blue,
                              size: 20,
                            ),
                            label: Text("Changer profile pic",
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
              const CustomTextFormFieldAuth(
                labelText: "Hassan bensaltana",
                prefixIcon: Icon(Icons.person),
              ),
              // email
              const SizedBox(height: 15),
              const CustomTextFormFieldAuth(
                labelText: "bensaltanahassan@gmail.com",
                prefixIcon: Icon(Icons.email_outlined),
              ),
              const SizedBox(height: 15),
              //phone
              const CustomTextFormFieldAuth(
                labelText: "+212 6 66 66 66 66",
                prefixIcon: Icon(Icons.phone),
              ),
            ],
          ),
        ));
  }
}
