import 'package:estadio/constants/colors.dart';
import 'package:estadio/constants/core_refactering/global_refactoring.dart';
import 'package:estadio/services/booking_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../model/booking/allready_booked_turf_response.dart';
import '../../model/booking/booking.dart';

class BookingController extends GetxController {
  final List<int> newBookedList = [];
  final List alreadyBookedList = [];
  late String selectedDate;
  final Map<String, List<int>> alredyBookedTurfMap = {};
  RxInt totalFair = 0.obs;
  RxBool isLoading = false.obs;

  //////////////// Book now Button OnTap //////////////////////////////////
  void bookNowOnTap(String id) async {
    selectedDate = DateFormat.yMd().format(DateTime.now());
    newBookedList.clear();
    totalFair.value = 0;
    isLoading.value = true;
    await bookedTurfFetch(id);
    bookListChecking(selectedDate);
    isLoading.value = false;
  }
  /////////////////////////////////////////

  ///////////////// On date changes///////////////////////////////////////
  void onDateChangeTap(date) {
    final parseDate = DateTime.parse(date.toString());
    selectedDate = DateFormat.yMd().format(parseDate);
    newBookedList.clear();
    totalFair.value = 0;
    bookListChecking(selectedDate);
    update();
  }
  /////////////////////////////////////////

  ////////////////////////// Selectable Chip functions///////////////////
  int toDBtimeConversion(String value, String heading) {
    final int time;
    if (heading == "Morning") {
      time = int.parse(value.trim().split(":").first);
      return time;
    } else {
      time = int.parse(value.trim().split(":").first) + 12;
      return time;
    }
  }

  void chipClicked(
      {required String times, required int amount, required String heading}) {
    final color = chipColor(timeValue: times, heading: heading);
    final time = toDBtimeConversion(times, heading);
    if (color == Colors.green.withOpacity(0.4)) {
      newBookedList.add(time);
      totalFair.value += amount;
    } else if (color == Colors.amber[300]!) {
      newBookedList.remove(time);
      totalFair.value -= amount;
    }
    update();
  }

  Color chipColor({required String timeValue, required String heading}) {
    final time = toDBtimeConversion(timeValue, heading);
    if (alreadyBookedList.contains(time)) {
      return Colors.redAccent[100]!;
    } else if (time <= DateTime.now().hour &&
        selectedDate == DateFormat.yMd().format(DateTime.now())) {
      return greyColor;
    } else if (newBookedList.contains(time)) {
      return Colors.amber[300]!;
    } else {
      return Colors.green.withOpacity(0.4);
    }
  }
  //////////////////////////////////////////

//////////// Already booked Checking //////////////////////////////////////
  void bookListChecking(String selectedDate) {
    alreadyBookedList.clear();
    if (alredyBookedTurfMap.containsKey(selectedDate)) {
      alreadyBookedList.addAll(alredyBookedTurfMap[selectedDate]!);
    }
  }
  ////////////////////////////////////////////

  //////////////////// Service Connect //////////////////////////////////////
  Future<void> bookedTurfFetch(String id) async {
    final AlreadyBookedResponse? bookedResponse =
        await BookTurfService.getBookedTurfs(id: id);
    if (bookedResponse != null) {
      alredyBookedTurfMap.clear();
      for (var element in bookedResponse.data) {
        alredyBookedTurfMap[element.bookingDate] = element.timeSlot;
      }
    }
  }

  Future<void> newTurfBook({required String turfId}) async {
    BookedRequest model = BookedRequest(
        bookingDate: selectedDate, turfId: turfId, timeSlot: newBookedList);
    Get.back();
    BookedResponse? bookedResponse =
        await BookTurfService.bookTurf(model: model);
    if (bookedResponse != null) {
      showToast(bookedResponse.message);
    }
  }
  ////////////////////////////////////////////
}
