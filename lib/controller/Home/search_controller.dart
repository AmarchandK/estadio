import 'dart:developer';
import 'package:estadio/controller/Home/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../constants/debounce/debounce.dart';
import '../../model/Home/home_response.dart';

class SearchController extends GetxController {
  RxBool isSearchClicked = false.obs;
  RxBool isSearched = false.obs;
  final searchController = TextEditingController();
  List<Datum> allSerach = [];
  late List<Datum> foundTurfs = [];
  final Debouncer debouncer = Debouncer(milliseconds: 1 * 1000);

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
    late List<Datum> searchResults = [];
    log('Item $serachItem');
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
    foundTurfs = searchResults;
    log(searchResults.toString());
    update();
  }

  @override
  void onClose() {
    foundTurfs.clear();
    searchController.clear();
    super.onClose();
  }
}
