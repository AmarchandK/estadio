import 'package:estadio/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class BookingController extends GetxController {
  List<String> bookedList = [];
  int selectedDate = DateTime.now().day;
  RxInt totalFair = 0.obs;
  chipClicked(String value, int amount, String heading) {
    final color = colorSelection(
      value: value,
      heading: heading,
    );
    if (color == greyColor) {
      null;
    } else if (color == Colors.green.withOpacity(0.4)) {
      bookedList.add(value);
      totalFair.value += amount;
    } else {
      bookedList.remove(value);
      totalFair.value -= amount;
    }
    update();
  }

  Color colorSelection({required String value, required String heading}) {
    final int time;
    if (heading == "Morning") {
      time = int.parse(value.trim().split(":").first);
    } else {
      time = int.parse(value.trim().split(":").first) + 12;
    }

    if (time <= DateTime.now().hour && selectedDate == DateTime.now().day) {
      return greyColor;
    } else if (bookedList.contains(value)) {
      return Colors.red.withOpacity(0.4);
    } else {
      return Colors.green.withOpacity(0.4);
    }
  }

  void onDateChaneFunction(date) {
    selectedDate = int.parse(date.toString().split("-").last);
    bookedList.clear();
    totalFair.value = 0;
    update();
  }
}
