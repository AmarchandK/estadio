import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:estadio/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../authentication/login_page.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        body: ListView(
          children: [
            BigUserCard(
              cardColor: lightGreen,
              userName: 'Amar',
              userProfilePic: const AssetImage(''),
              cardActionWidget: SettingsItem(
                icons: Icons.edit,
                iconStyle: IconStyle(
                  withBackground: true,
                  borderRadius: 50,
                  backgroundColor: Colors.yellow[600],
                ),
                title: "Modify",
                titleStyle: const TextStyle(color: bColor),
                subtitle: "Tap to change your data",
                onTap: () {
                  if (kDebugMode) {
                    print("OK");
                  }
                },
              ),
            ),
            SettingsGroup(
              settingsGroupTitle: "Account",
              items: [
                SettingsItem(
                  onTap: () async {
                    const FlutterSecureStorage storage = FlutterSecureStorage();
                    await storage.deleteAll();
                    Get.offAll(() => const LoginPage());
                  },
                  icons: Icons.exit_to_app_rounded,
                  titleStyle: const TextStyle(color: bColor),
                  title: "Sign Out",
                  subtitle: 'See You Later',
                  iconStyle: IconStyle(backgroundColor: redColor),
                ),
              ],
            ),
            SettingsGroup(
              items: [
                SettingsItem(
                    onTap: () {},
                    icons: CupertinoIcons.pencil_outline,
                    iconStyle: IconStyle(),
                    title: 'Privacy Policy',
                    subtitle: "© 2022 All Rights Reserved",
                    titleStyle: const TextStyle(color: bColor)),
              ],
            ),
            SettingsGroup(
              items: [
                SettingsItem(
                  onTap: () {},
                  icons: Icons.info_rounded,
                  iconStyle: IconStyle(
                    backgroundColor: Colors.purple,
                  ),
                  title: 'About',
                  titleStyle: const TextStyle(color: bColor),
                  subtitle: "Learn more about Estadio App",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
