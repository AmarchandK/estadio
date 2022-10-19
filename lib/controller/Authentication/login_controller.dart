import 'dart:developer';

import 'package:estadio/model/Authentication/log_in/login_request.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import '../../model/Authentication/otp/otp_request.dart';
import '../../model/Authentication/sign_in/create_request.dart';
import '../../services/auth_services.dart';

class Authentication extends GetxController {
  ////////////////////////TEXT EDITING CONTROLLERS////////////////////////
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobController = TextEditingController();
  ///////////////////////////RXBOOL ///////////////////////
  static RxBool onTapLoading = true.obs;
  final RxBool isObscure = true.obs;
  //////////////////////FORM KEYS/////////////////////////
  final GlobalKey<FormState> logKey = GlobalKey<FormState>();
  final GlobalKey<FormState> pinKey = GlobalKey<FormState>();
  final GlobalKey<FormState> createKey = GlobalKey<FormState>();
  /////////TOKENS////////////////////////
  static late String registerId;

  /////////////////////////ON TAP////////////////////////////
  onLoginBtnTap() async {
    if (logKey.currentState!.validate()) {
      onTapLoading.value = false;

      final model = LoginRequest(
          userMail: emailController.text.trim(),
          userPassword: passwordController.text.trim());
      await ApiService.loginUser(model);
      onTapLoading.value = true;
      emailController.clear();
      passwordController.clear();
    }
  }

  onCreatebtnTap() async {
    if (createKey.currentState!.validate()) {
      onTapLoading.value = false;
      final model = CreateRequest(
          userMail: emailController.text.trim(),
          userPassword: passwordController.text.trim());
      await ApiService.createUser(model);
      onTapLoading.value = true;
      emailController.clear();
      passwordController.clear();
      confirmController.clear();
    }
  }

  onOtpEnter(pin) async {
    onTapLoading.value = false;
    final model = OtpRequest(userOtp: pin, id: registerId);
    await ApiService.otpVerify(model);
    onTapLoading.value = true;
    log(model.id.toString());
    log(model.userOtp.toString());
  }
}
