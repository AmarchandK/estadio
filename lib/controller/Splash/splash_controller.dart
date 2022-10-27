import 'package:estadio/controller/Home/home_controller.dart';
import 'package:estadio/view/Navigation/botttom_nav.dart';
import 'package:estadio/view/authentication/login_page.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    checkUserLoggedIn();
    await HomeController.instance().onInit();
    super.onInit();
  }

  checkUserLoggedIn() async {
    const FlutterSecureStorage storage = FlutterSecureStorage();
    final token = await storage.read(key: 'tokenKey');
    await Future.delayed(
      const Duration(seconds: 1),
    );
    if (token == null || token.isEmpty) {
      Get.off(() => const LoginPage());
    } else {
      Get.off(() => const BottomNav());
    }
  }
}
