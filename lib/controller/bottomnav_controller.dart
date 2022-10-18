import 'package:estadio/view/Navigation/botttom_nav.dart';
import 'package:estadio/view/Account/my_account.dart';
import 'package:estadio/view/Favorites/favourites.dart';
import 'package:estadio/view/Home/home_screen.dart';
import 'package:estadio/view/Orders/orders.dart';
import 'package:flutter/widgets.dart';
import 'package:get/state_manager.dart';

class BottomNavController extends GetxController {
  RxInt pageIndex = 0.obs;
  final RxList<Widget> screens = [
    const HomePage(),
    const Favourites(),
    const MyOrders(),
    const MyAccount()
  ].obs;
}