import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:estadio/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../../constants/colors.dart';
import '../../controller/bottomNav/bottomnav_controller.dart';

class BottomNav extends GetView<BottomNavController> {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.transparent,
      body: Obx(
        () => controller.screens[controller.pageIndex.value],
      ),
      bottomNavigationBar: BlurryContainer(
        height: 70,
        color: const Color.fromARGB(59, 0, 0, 0),
        width: widthSize(context),
        borderRadius: BorderRadius.circular(10),
        padding: const EdgeInsets.all(3),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GNav(
              gap: 5,
              onTabChange: (value) => controller.pageIndex.value = value,
              selectedIndex: 0,
              tabBorderRadius: 10,
              rippleColor: Colors.white,
              tabBackgroundColor: bColor,
              padding: const EdgeInsets.all(10),
              hoverColor: darkGreen,
              style: GnavStyle.google,
              curve: Curves.easeIn,
              activeColor: lightGreen,
              tabs: const [
                GButton(icon: CupertinoIcons.home, text: ' Home'),
                GButton(icon: CupertinoIcons.bookmark_fill, text: ' Saved'),
                GButton(
                    icon: CupertinoIcons.list_bullet_indent, text: ' Orders'),
                GButton(
                    icon: CupertinoIcons.person_alt_circle, text: ' Account'),
              ]),
        ),
      ),
    );
  }
}
