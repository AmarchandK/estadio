import 'package:estadio/view/authentication/login_page.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import '../../view/bottom_nav/botttom_nav.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    checkUserLoggedIn();
    super.onInit();
  }

  void checkUserLoggedIn() async {
    const FlutterSecureStorage storage = FlutterSecureStorage();
    final token = await storage.read(key: 'tokenKey');
    await Future.delayed(
      const Duration(seconds: 3),
    );
    if (token == null || token.isEmpty) {
      Get.off(() => const LoginPage());
    } else {
      Get.off(() => const BottomNav());
    }
  }
}
