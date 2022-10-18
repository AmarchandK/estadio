import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';
import '../../constants/global_refactoring.dart';
import '../../constants/sizes.dart';
import '../../controller/Authentication/login_controller.dart';
import 'widgets/button.dart';
import 'widgets/text_span.dart';
import 'widgets/textfield.dart';

class CreateAccount extends GetView<Authentication> {
  const CreateAccount({Key? key}) : super(key: key);
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
                "Create an Account",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              h10,
              const Text(
                "We need to register your details without getting started!",
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              h10,
              Form(
                key: controller.createKey,
                child: Column(
                  children: [
                    Fields(
                        cntrlr: controller.emailController,
                        keybord: TextInputType.emailAddress,
                        hint: 'Email',
                        validator: 'Enter an Email',
                        icon: Icons.mail_outline),
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
                              )),
                          icon: Icons.security),
                    ),
                    Fields(
                      cntrlr: controller.confirmController,
                      keybord: TextInputType.number,
                      obscure: true,
                      hint: 'Confirm Password',
                      validator: 'Confirm',
                      icon: Icons.content_paste_off,
                      length: 6,
                    ),
                  ],
                ),
              ),
              h20,
              OnTapButton(
                  onTap: () async {
                    controller.passwordController.text !=
                            controller.confirmController.text
                        ? showDialogue('Password Missmatch')
                        : await controller.onCreatebtnTap();
                  },
                  text: 'Validate'),
              h10,
              Textspan(() {
                controller.confirmController.clear();
                controller.passwordController.clear();
                controller.emailController.clear();
                Get.back();
              }, firstText: 'Have an account? ', secondText: 'LogIn'),
            ],
          ),
        ),
      ),
    );
  }
}
