import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  RxBool isSearchClicked = false.obs;
  final searchController = TextEditingController();
}
