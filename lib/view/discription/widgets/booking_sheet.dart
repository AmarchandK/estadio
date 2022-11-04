import 'package:estadio/constants/core_refactering/global_refactoring.dart';
import 'package:estadio/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horizontal_calendar/horizontal_calendar.dart';
import 'package:slider_button/slider_button.dart';

import '../../../constants/colors.dart';
import '../../../model/home/home_response.dart';

class Booking extends StatelessWidget {
  const Booking({
    Key? key,
    required this.datum,
  }) : super(key: key);

  final Datum datum;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.bottomSheet(
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
                    onDateSelected: (date) => print(
                      date.toString(),
                    ),
                  ),
                  _GetBottom(
                    data: datum,
                    heading: 'Morning',
                    headingIcon: Icons.nights_stay_outlined,
                    iconColor: lightGreen,
                  ),
                  _GetBottom(
                    data: datum,
                    heading: 'Afternoon',
                    headingIcon: Icons.nights_stay_outlined,
                    iconColor: lightGreen,
                  ),
                  _GetBottom(
                    data: datum,
                    heading: 'Night',
                    headingIcon: Icons.nights_stay_outlined,
                    iconColor: lightGreen,
                  ),
                  SliderButton(
                      action: () => Get.defaultDialog(),
                      label: const Text('Book Now'),
                      alignLabel: Alignment.center,
                      vibrationFlag: true,
                      buttonSize: 50,
                      backgroundColor: greyColor,
                      highlightedColor: darkGreen,
                      buttonColor: lightGreen,
                      height: 60,
                      width: widthSize(context) - 30)
                ],
              ),
            ),
          ),
          enterBottomSheetDuration: const Duration(seconds: 1)),
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

class _GetBottom extends StatelessWidget {
  const _GetBottom({
    Key? key,
    required this.data,
    required this.heading,
    required this.headingIcon,
    required this.iconColor,
  }) : super(key: key);
  final Datum data;
  final String heading;
  final IconData headingIcon;
  final Color iconColor;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(
            headingIcon,
            color: iconColor,
          ),
          title: Text(
            heading,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: Text(
            heading == 'Morning'
                ? '₹${data.turfPrice!.morningPrice!}'
                : (heading == 'Afternoon'
                    ? '₹${data.turfPrice!.afternoonPrice!}'
                    : '₹${data.turfPrice!.eveningPrice!}'),
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Wrap(
          children: List.generate(
            5,
            (index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.green),
                  color: Colors.green.withOpacity(0.4),
                ),
                height: 30,
                width: 100,
                child: const Center(
                  child: Text(
                    '1:30 pm',
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
