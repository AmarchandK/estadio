import 'dart:async';
import 'dart:core';
import 'package:estadio/controller/authentication/login_controller.dart';
import 'package:estadio/controller/bottomNav/bottomnav_controller.dart';
import 'package:estadio/controller/home/location_fetch_controller.dart';
import 'package:estadio/controller/home/search_controller.dart';
import 'package:estadio/controller/splash/splash_controller.dart';
import 'package:get/get.dart';

Future controllerInit() async {
  Get.put(SplashController());
  Get.put(Authentication());
  Get.put(BottomNavController());
  Get.put(LocationController());
  Get.put(SearchController());
}


