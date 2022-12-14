import 'package:estadio/controller/bottomNav/bottomnav_controller.dart';
import 'package:estadio/model/authentication/log_in/login_request.dart';
import 'package:estadio/model/authentication/otp/otp_request.dart';
import 'package:estadio/model/authentication/sign_in/create_request.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../services/auth_services.dart';

class Authentication extends GetxController {
  ////////////////////////TEXT EDITING CONTROLLERS////////////////////////
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final BottomNavController _bottomNavController =
      Get.put(BottomNavController());
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
  Future<void> onLoginBtnTap() async {
    if (logKey.currentState!.validate()) {
      onTapLoading.value = false;
      final model = LoginRequest(
          userMail: emailController.text.trim(),
          userPassword: passwordController.text.trim());
      await ApiService.loginUser(model);
      _bottomNavController.pageIndex.value = 0;
      onTapLoading.value = true;
    }
  }

  void onCreatebtnTap() async {
    if (createKey.currentState!.validate()) {
      onTapLoading.value = false;
      final model = CreateRequest(
          userMail: emailController.text.trim(),
          userPassword: passwordController.text.trim());
      await ApiService.createUser(model);
      onTapLoading.value = true;
    }
  }

  void onOtpEnter(pin) async {
    onTapLoading.value = false;
    final model = OtpRequest(userOtp: pin, id: registerId);
    await ApiService.otpVerify(model);
    onTapLoading.value = true;
  }

  @override
  void onClose() {
    confirmController.clear();
    passwordController.clear();
    emailController.clear();
    super.onClose();
  }

  @override
  InternalFinalCallback<void> get onDelete {
    confirmController.clear();
    passwordController.clear();
    emailController.clear();
    return super.onDelete;
  }
}
