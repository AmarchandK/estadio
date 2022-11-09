import 'package:estadio/view/authentication/login_page.dart';
import 'package:estadio/view/navigation/botttom_nav.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

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
      const Duration(seconds: 1),
    );
    if (token == null || token.isEmpty) {
      Get.off(() => const LoginPage());
    } else {
      Get.off(() => const BottomNav());
    }
  }
}
