import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';
import '../../controller/Authentication/login_controller.dart';
import 'create_account.dart';
import 'widgets/button.dart';
import 'widgets/text_span.dart';
import 'widgets/textfield.dart';

class LoginPage extends GetView<Authentication> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/img1.png',
                width: 150,
                height: 150,
              ),
              h10,
              const Text(
                "LogIn Your Account",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              h10,
              const Text(
                "We need to Login with your details for getting started!",
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              h20,
              Form(
                key: controller.logKey,
                child: Column(
                  children: [
                    Fields(
                        cntrlr: controller.emailController,
                        keybord: TextInputType.emailAddress,
                        hint: 'Email',
                        validator: 'Enter an Email',
                        icon: Icons.mail),
                    Obx(
                      () => Fields(
                          cntrlr: controller.passwordController,
                          keybord: TextInputType.number,
                          length: 6,
                          hint: 'Password',
                          validator: 'Enter your Password',
                          suffix: IconButton(
                            onPressed: () {
                              controller.isObscure.value =
                                  !controller.isObscure.value;
                            },
                            icon: Icon(
                              controller.isObscure.value
                                  ? Icons.visibility_off_rounded
                                  : Icons.visibility,
                              color: bColor,
                            ),
                          ),
                          icon: Icons.security),
                    ),
                  ],
                ),
              ),
              h20,
              OnTapButton(
                  onTap: () => controller.onLoginBtnTap(), text: 'Validate'),
              h20,
              Textspan(() {
                controller.confirmController.clear();
                controller.passwordController.clear();
                controller.emailController.clear();
                Get.to(() => const CreateAccount());
              }, firstText: "Don't have an account? ", secondText: 'Sign Up'),
            ],
          ),
        ),
      ),
    );
  }
}
