import 'dart:ui';
import 'package:estadio/constants/core_refactering/global_refactoring.dart';
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
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/baground.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        height: heightSize(context),
        child: Align(
          alignment: Alignment.center,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                height: heightSize(context) / 1.5,
                width: widthSize(context) / 1.05,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.white10, Colors.white12],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Form(
                      key: controller.logKey,
                      child: Column(
                        children: [
                          mainHeadingText('Log-In'),
                          h10,
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
                        onTap: () => controller.onLoginBtnTap(),
                        text: 'Validate'),
                    h20,
                    Textspan(() {
                      controller.confirmController.clear();
                      controller.passwordController.clear();
                      controller.emailController.clear();
                      Get.to(() => const CreateAccount());
                    },
                        firstText: "Don't have an account? ",
                        secondText: 'Sign Up'),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
