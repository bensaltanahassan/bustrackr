import 'package:bustrackr/controllers/auth/login_controller.dart';
import 'package:bustrackr/core/constants/assets.dart';
import 'package:bustrackr/core/functions/validinput.dart';
import 'package:bustrackr/core/shared/custombottomnavbutton.dart';
import 'package:bustrackr/core/shared/handling_data_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginController());
    return Scaffold(
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("New user?"),
          TextButton(
            style: ButtonStyle(
                padding:
                    MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero)),
            onPressed: controller.goToSignUp,
            child: const Text("Register"),
          ),
        ],
      ),
      body: SafeArea(
        child: GetBuilder<LoginController>(builder: (controller) {
          return HandlingDataView(
            isLoading: controller.isloading,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 80, 20, 0),
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
                        style:
                            Theme.of(context).textTheme.headlineLarge!.copyWith(
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
                              controller: controller.emailController,
                              validator: (value) => ValidationInput.validInput(
                                  val: value, type: "email"),
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
                              controller: controller.passwordController,
                              validator: (value) => ValidationInput.validInput(
                                  val: value, type: "password"),
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: true,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.lock,
                                    color: Colors.lightBlue),
                                labelText: "Password",
                                hintText: "Enter your password",
                                border: InputBorder.none,
                                suffixIcon: TextButton(
                                  onPressed: controller.goToForgetPassword,
                                  child: const Text(
                                    "Forget ?",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: CustomBottomNavButton(
                          text: "Login",
                          onTap: controller.login,
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
    );
  }
}
