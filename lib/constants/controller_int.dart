import 'package:estadio/controller/bottomnav_controller.dart';
import 'package:estadio/controller/home_controller.dart';
import 'package:get/get.dart';

import '../controller/login_controller.dart';

onInit() {
  Get.put(Authentication());
  Get.put(BottomNavController());
}
