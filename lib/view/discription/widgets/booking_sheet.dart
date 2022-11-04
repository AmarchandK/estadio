import 'dart:developer';
import 'package:estadio/constants/core_refactering/global_refactoring.dart';
import 'package:estadio/constants/sizes.dart';
import 'package:estadio/controller/discription/description_controller.dart';
import 'package:estadio/view/discription/widgets/booking_chip.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horizontal_calendar/horizontal_calendar.dart';
import 'package:slider_button/slider_button.dart';
import '../../../constants/colors.dart';
import '../../../model/home/home_response.dart';

class Booking extends GetView<DescriptionController> {
  const Booking({
    Key? key,
    required this.datum,
  }) : super(key: key);

  final Datum datum;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.timeConversion(datum.turfTime!);
        controller.timesListAdd();
        Get.bottomSheet(
            Container(
              color: darkGreen,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    HorizontalCalendar(
                      date: DateTime.now(),
                      textColor: Colors.white,
                      backgroundColor: Colors.transparent,
                      selectedColor: lightGreen,
                      onDateSelected: (date) => log(
                        date.toString(),
                      ),
                    ),
                    BookingChip(
                      data: datum,
                      heading: 'Morning',
                      headingIcon: Icons.sunny_snowing,
                      price: controller.morning,
                    ),
                    BookingChip(
                      data: datum,
                      heading: 'Afternoon',
                      headingIcon: Icons.sunny,
                      price: controller.afternoon,
                    ),
                    BookingChip(
                      data: datum,
                      heading: 'Evening',
                      headingIcon: Icons.nights_stay_outlined,
                      price: controller.evenging,
                    ),
                    h20,
                    SliderButton(
                        action: () => Get.defaultDialog(),
                        label: const Text('Book Now',
                            style: TextStyle(fontSize: 25)),
                        alignLabel: Alignment.center,
                        vibrationFlag: true,
                        buttonSize: 50,
                        backgroundColor: lightGreen,
                        buttonColor: darkGreen,
                        height: 60,
                        width: widthSize(context) - 30),
                    h20,
                  ],
                ),
              ),
            ),
            enterBottomSheetDuration: const Duration(seconds: 1));
      },
      child: Container(
        height: 60,
        width: widthSize(context) - 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: darkGreen,
          borderRadius: BorderRadius.circular(15),
        ),
        child: subTittle(
          'Book',
        ),
      ),
    );
  }
}
