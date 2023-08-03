import 'package:bustrackr/controllers/auth/signup_controller.dart';
import 'package:bustrackr/core/constants/assets.dart';
import 'package:bustrackr/core/functions/validinput.dart';
import 'package:bustrackr/core/shared/custombottomnavbutton.dart';
import 'package:bustrackr/core/shared/handling_data_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpController controller = Get.put(SignUpController());
    return Scaffold(
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Already have an account ?"),
          TextButton(
            style: ButtonStyle(
                padding:
                    MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero)),
            onPressed: controller.goToLoginPage,
            child: const Text("Login"),
          ),
        ],
      ),
      body: WillPopScope(
        onWillPop: () async {
          controller.goToLoginPage();
          return false;
        },
        child: SafeArea(
          child: GetBuilder<SignUpController>(builder: (controller) {
            return HandlingDataView(
              isLoading: controller.isLoading,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: SingleChildScrollView(
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Lottie.asset(
                          ImageAssets.bus,
                          height: 140,
                          width: 140,
                        ),
                        Text(
                          "Welcome to",
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                color: Colors.black.withOpacity(0.6),
                                fontWeight: FontWeight.w500,
                                fontSize: 22,
                              ),
                        ),
                        Text(
                          "Bustrackr",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 28,
                              ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 20),
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                color: Colors.grey.withOpacity(0.7), width: 1),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextFormField(
                                controller: controller.completNameController,
                                validator: (v) =>
                                    ValidationInput.validInput(val: v, min: 5),
                                decoration: const InputDecoration(
                                  prefixIcon:
                                      Icon(Icons.person, color: Colors.green),
                                  labelText: "Full Name",
                                  hintText: "Enter your name",
                                  // disable all border
                                  border: InputBorder.none,
                                ),
                              ),
                              const Divider(
                                color: Colors.grey,
                                height: 1,
                              ),
                              TextFormField(
                                controller: controller.emailController,
                                validator: (v) => ValidationInput.validInput(
                                    val: v, type: "email"),
                                keyboardType: TextInputType.emailAddress,
                                decoration: const InputDecoration(
                                  prefixIcon:
                                      Icon(Icons.email, color: Colors.green),
                                  labelText: "Email",
                                  hintText: "Enter your email",
                                  // disable all border
                                  border: InputBorder.none,
                                ),
                              ),
                              const Divider(
                                color: Colors.grey,
                                height: 1,
                              ),
                              TextFormField(
                                controller: controller.phoneController,
                                validator: (v) => ValidationInput.validInput(
                                    val: v, type: "phone"),
                                keyboardType: TextInputType.phone,
                                decoration: const InputDecoration(
                                  prefixIcon:
                                      Icon(Icons.phone, color: Colors.blue),
                                  labelText: "Phone",
                                  hintText: "Enter your phone",
                                  // disable all border
                                  border: InputBorder.none,
                                ),
                              ),
                              const Divider(
                                color: Colors.grey,
                                height: 1,
                              ),
                              TextFormField(
                                controller: controller.passwordController,
                                validator: (v) => ValidationInput.validInput(
                                  val: v,
                                  type: "password",
                                  min: 8,
                                ),
                                obscureText: true,
                                decoration: const InputDecoration(
                                  prefixIcon:
                                      Icon(Icons.lock, color: Colors.lightBlue),
                                  labelText: "Password",
                                  hintText: "Create password",
                                  border: InputBorder.none,
                                ),
                              ),
                              const Divider(
                                color: Colors.grey,
                                height: 1,
                              ),
                              TextFormField(
                                controller:
                                    controller.confirmPassowrdController,
                                validator: (v) {
                                  if (v != controller.passwordController.text) {
                                    return "Password not match";
                                  } else {
                                    return null;
                                  }
                                },
                                obscureText: true,
                                decoration: const InputDecoration(
                                  prefixIcon:
                                      Icon(Icons.lock, color: Colors.lightBlue),
                                  labelText: "Confirm Password",
                                  hintText: "Confirm your password",
                                  border: InputBorder.none,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          child: CustomBottomNavButton(
                            text: "Sign up",
                            onTap: controller.signUp,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
