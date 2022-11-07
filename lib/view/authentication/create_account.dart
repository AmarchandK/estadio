import 'dart:ui';
import 'package:estadio/controller/authentication/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';
import '../../constants/core_refactering/global_refactoring.dart';
import '../../constants/sizes.dart';
import 'widgets/button.dart';
import 'widgets/text_span.dart';
import 'widgets/textfield.dart';

class CreateAccount extends GetView<Authentication> {
  const CreateAccount({Key? key}) : super(key: key);
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
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                height: heightSize(context) / 1.3,
                width: widthSize(context) / 1.05,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.black12, Colors.black12],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    h10,
                    Form(
                      key: controller.createKey,
                      child: Column(
                        children: [
                          mainHeadingText('Create Account'),
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
                    TextspanAuth(() {
                      controller.confirmController.clear();
                      controller.passwordController.clear();
                      controller.emailController.clear();
                      Get.back();
                    }, firstText: 'Have an account? ', secondText: 'LogIn'),
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
