import 'package:estadio/controller/Home/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../model/Home/home_response.dart';

class SearchController extends GetxController {
  RxBool isSearchClicked = false.obs;
  final searchController = TextEditingController();
  List<Datum> allSerach = [];
  late List<Datum> foundTurfs = [];
  late List<Datum> searchResults = [];

  @override
  void onInit() async {
    await allListAsign();
    foundTurfs = allSerach;
    super.onInit();
  }

  allListAsign() async {
    allSerach = await HomeController.instance().searchAsign();
  }

  void runFilter(String serachItem) {
    if (serachItem.isEmpty) {
      searchResults = allSerach;
    } else {
      searchResults = allSerach
          .where(
            (element) => element.turfName!.toLowerCase().contains(
                  serachItem.toLowerCase(),
                ),
          )
          .toList();
    }
    update();
  }
}
