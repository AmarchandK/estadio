import 'package:estadio/view/splashscreen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IconButton(
          onPressed: () async {
            const storage = FlutterSecureStorage();
            await storage.deleteAll();
            Get.offAll(() => SplashScreen());
          },
          icon: const Icon(Icons.logout),
        ),
      ),
    );
  }
}
