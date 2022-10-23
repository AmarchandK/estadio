import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:estadio/model/Authentication/sign_in/create_response.dart';
import 'package:estadio/view/Navigation/botttom_nav.dart';
import 'package:get/get.dart';
import '../constants/global_refactoring.dart';
import '../constants/url.dart';
import '../controller/Authentication/login_controller.dart';
import '../model/Authentication/log_in/login_request.dart';
import '../model/Authentication/log_in/login_response.dart';
import '../model/Authentication/otp/otp_request.dart';
import '../model/Authentication/otp/otp_response.dart';
import '../model/Authentication/sign_in/create_request.dart';
import '../view/authentication/otp_veryfy.dart';

class ApiService {
  static final Dio dio = Dio(BaseOptions(baseUrl: Config.baseUrl));

  /*-------------------Create User------------------------*/
  static Future createUser(CreateRequest model) async {
    try {
      final response = await dio.post(Config.signupEmail, data: model.toJson());
      showToast(response.data["message"]);
      final data = CreateResponse.fromJson(response.data);
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        Authentication.registerId = data.id;
        Get.off(() => OTPscreen());
      }
    } catch (e) {
      errorHandler(e);
    }
  }

  /*-------------------OTP Verify------------------------*/
  static Future otpVerify(OtpRequest model) async {
    try {
      final response =
          await dio.post(Config.emailOtpVerify, data: model.toJson());
      final OtpResponse otoResponse = OtpResponse.fromJson(response.data);
      await UserSecureStorage.setTokens(
          otoResponse.token, otoResponse.refreshToken);
      showToast(otoResponse.message);
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        log("OTP SuccessFull${response.data}");
        Get.to(() => const BottomNav());
      }
    } catch (e) {
      errorHandler(e);
    }
  }

  /*-------------------Login User------------------------*/
  static Future loginUser(LoginRequest model) async {
    try {
      final response = await dio.post(Config.loginEmail, data: model.toJson());
      log('message');
      final LoginResponse loginResponse = LoginResponse.fromJson(response.data);
      await UserSecureStorage.setTokens(
          loginResponse.token, loginResponse.refreshToken);
      showToast(loginResponse.message);
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        log("Login Success${response.data}");
        Get.offAll(() => const BottomNav());
      }
    } catch (e) {
      errorHandler(e);
    }
  }
}
