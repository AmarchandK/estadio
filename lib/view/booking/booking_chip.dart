import 'package:estadio/constants/colors.dart';
import 'package:estadio/controller/booking/booking_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import '../../model/home/home_response.dart';

class BookingChip extends GetView<BookingController> {
  const BookingChip({
    super.key,
    required this.data,
    required this.amount,
    required this.heading,
    required this.headingIcon,
    required this.timesList,
  });
  final Datum data;
  final String heading;
  final IconData headingIcon;
  final List<String> timesList;
  final int amount;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(
            headingIcon,
          ),
          title: Text(
            heading,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w900,
            ),
          ),
          trailing: Text(
            '₹ $amount',
            style: TextStyle(
              fontSize: 20,
              color: Colors.amber[300],
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Obx(
          () => controller.isLoading.value
              ? const SizedBox(
                  height: 130,
                  child: CupertinoActivityIndicator(
                    color: wColor,
                    radius: 20,
                  ))
              : Wrap(
                  children: List.generate(
                    timesList.length,
                    (index) => GetBuilder<BookingController>(
                      builder: (_) {
                        return GestureDetector(
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.white),
                              color: controller.chipColor(
                                timeValue: timesList[index],
                                heading: heading,
                              ),
                            ),
                            height: 50,
                            width: 100,
                            child: Center(
                              child: Text(
                                timesList[index].trim(),
                              ),
                            ),
                          ),
                          onTap: () {
                            controller.chipClicked(
                                times: timesList[index],
                                amount: amount,
                                heading: heading);
                          },
                        );
                      },
                    ),
                  ),
                ),
        )
      ],
    );
  }
}
