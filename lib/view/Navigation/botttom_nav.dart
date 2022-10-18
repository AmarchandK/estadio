import 'package:estadio/constants/sizes.dart';
import 'package:estadio/controller/bottomnav_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

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
      bottomNavigationBar: Container(
        width: widthSize(context),
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.5),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: grassColor)),
        child: GNav(
            onTabChange: (value) => controller.pageIndex.value = value,
            selectedIndex: 0,
            tabBorderRadius: 10,
            rippleColor: Colors.white,
            tabBackgroundColor: grassColor,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            hoverColor: Colors.grey,
            style: GnavStyle.google,
            curve: Curves.easeOutExpo,
            activeColor: greenColor,
            tabs: const [
              GButton(icon: CupertinoIcons.home, text: ' Home'),
              GButton(icon: CupertinoIcons.bookmark_fill, text: ' Saved'),
              GButton(icon: CupertinoIcons.list_bullet_indent, text: ' Orders'),
              GButton(icon: CupertinoIcons.person_alt_circle, text: ' Account'),
            ]),
      ),
    );
  }
}
