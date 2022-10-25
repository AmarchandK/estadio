import 'dart:async';
import 'dart:core';
import 'package:estadio/controller/Home/search_controller.dart';
import 'package:estadio/controller/BottomNav/bottomnav_controller.dart';
import 'package:estadio/controller/Home/location_fetch_controller.dart';
import 'package:estadio/controller/Splash/splash_controller.dart';
import 'package:get/get.dart';

import '../controller/Authentication/login_controller.dart';

Future controllerInit() async {
  Get.put(SplashController());
  Get.put(Authentication());
  Get.put(BottomNavController());
  Get.put(LocationController());
  Get.put(SearchController());
}


