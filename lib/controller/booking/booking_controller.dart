import 'dart:developer';
import 'package:get/state_manager.dart';

class BookingController extends GetxController {
  List<String> bookedList = [];
  RxInt totalFair = 0.obs;
  chipClicked(String timesList, int amount) {
    if (bookedList.contains(timesList)) {
      bookedList.remove(timesList);
      totalFair.value = totalFair.value - amount;
    } else {
      bookedList.add(timesList);
      totalFair.value = totalFair.value + amount;
    }
    log(totalFair.toString());
    update();
  }
}
