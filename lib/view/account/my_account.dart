import 'package:estadio/constants/colors.dart';
import 'package:estadio/constants/core_refactering/global_refactoring.dart';
import 'package:estadio/constants/sizes.dart';
import 'package:estadio/view/authentication/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25.0, bottom: 20),
            child: mainHeadingText('Settings'),
          ),
          Container(
            width: widthSize(context) - 50,
            height: 130,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: lightGreen,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 110,
                  height: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: darkGreen,
                    boxShadow: [
                      BoxShadow(blurRadius: 30.0, color: Colors.green[100]!),
                    ],
                  ),
                ),
                const Text('Name')
              ],
            ),
          ),
          ListTile(
            leading: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: lightGreen)),
          ),
          IconButton(
            onPressed: () async {
              const storage = FlutterSecureStorage();
              await storage.deleteAll();
              Get.offAll(() => const LoginPage());
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
    );
  }
}
