import 'package:estadio/view/account/my_account.dart';
import 'package:estadio/view/favorites/favourites.dart';
import 'package:estadio/view/home/home_screen.dart';
import 'package:estadio/view/orders/orders.dart';
import 'package:flutter/widgets.dart';
import 'package:get/state_manager.dart';
class BottomNavController extends GetxController {
  RxInt pageIndex = 0.obs;
  final RxList<Widget> screens =
      [HomePage(), const Favourites(), const MyOrders(), const MyAccount()].obs;
}
