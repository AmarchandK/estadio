import 'package:dio/dio.dart';
import 'package:estadio/controller/authentication/login_controller.dart';
import 'package:estadio/model/authentication/log_in/login_request.dart';
import 'package:estadio/model/authentication/log_in/login_response.dart';
import 'package:estadio/model/authentication/otp/otp_request.dart';
import 'package:estadio/model/authentication/otp/otp_response.dart';
import 'package:estadio/model/authentication/sign_in/create_request.dart';
import 'package:estadio/model/authentication/sign_in/create_response.dart';
import 'package:get/get.dart';
import '../constants/core_refactering/global_refactoring.dart';
import '../constants/url/url.dart';
import '../view/authentication/otp_veryfy.dart';
import '../view/bottom_nav/botttom_nav.dart';

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
        otoResponse.token,
        otoResponse.refreshToken,
        otoResponse.id,
      );
      showToast(otoResponse.message);
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
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

      final LoginResponse loginResponse = LoginResponse.fromJson(response.data);
      await UserSecureStorage.setTokens(
          loginResponse.token, loginResponse.refreshToken, loginResponse.id);
      showToast(loginResponse.message);
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        Get.offAll(() => const BottomNav());
      }
    } catch (e) {
      errorHandler(e);
    }
  }
}
