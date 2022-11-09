import 'dart:developer';
import 'package:estadio/constants/colors.dart';
import 'package:estadio/services/booking_service.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import '../../model/booking/booked_turf_response.dart';

class BookingController extends GetxController {
  List<String> bookedList = [];
  final List alreadyBookedList = [];
  late int selectedDate;
  RxInt totalFair = 0.obs;
  RxBool isLoading = false.obs;
  ////////////////Book now Button OnTap //////////////////////////////////
  onTap(String id) async {
    selectedDate = DateTime.now().day;
    bookedList.clear();
    totalFair.value = 0;
    log(id);
    isLoading.value = true;

    await bookedTurfFetch(id);
    isLoading.value = false;
  }
  /////////////////////////////////////////

  ///////////////// On date changes////////////////////////////////////
  void onDateChangeTap(date) {
    selectedDate = int.parse(date.toString().split("-").last);
    bookedList.clear();
    totalFair.value = 0;
    update();
  }
  /////////////////////////////////////////

  ////////////////////////// Selectable Chip functions////////////////
  chipClicked(String value, int amount, String heading) {
    final color = chipColorSelection(
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

  Color chipColorSelection({required String value, required String heading}) {
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
  //////////////////////////////////////////

  //////////////////// Services ////////////////////////////////////////
  Future bookedTurfFetch(String id) async {
    final BookedResponse? bookedResponse =
        await GetBookedTurfService.getBookedTurfs(id: id);
    if (bookedResponse != null) {
      alreadyBookedList.clear();
      for (var element in bookedResponse.data) {
        alreadyBookedList.addAll(element.timeSlot);
      }
      log(alreadyBookedList.toString());
    }
  }
}
