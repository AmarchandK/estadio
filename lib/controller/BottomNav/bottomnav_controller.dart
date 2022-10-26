import 'package:estadio/view/Account/my_account.dart';
import 'package:estadio/view/Favorites/favourites.dart';
import 'package:estadio/view/Home/home_screen.dart';
import 'package:estadio/view/Orders/orders.dart';
import 'package:flutter/widgets.dart';
import 'package:get/state_manager.dart';

import '../Home/home_controller.dart';

class BottomNavController extends GetxController {
  @override
  void onInit() async {
    await HomeController.instance().onInit();

    super.onInit();
  }

  RxInt pageIndex = 0.obs;
  final RxList<Widget> screens =
      [HomePage(), const Favourites(), const MyOrders(), const MyAccount()].obs;
}
