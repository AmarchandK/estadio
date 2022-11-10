import 'package:estadio/constants/core_refactering/global_refactoring.dart';
import 'package:estadio/constants/sizes.dart';
import 'package:estadio/controller/booking/booking_controller.dart';
import 'package:estadio/controller/booking/payment_controller.dart';
import 'package:estadio/controller/discription/description_controller.dart';
import 'package:estadio/view/discription/widgets/booking_chip.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horizontal_calendar/horizontal_calendar.dart';
import 'package:slider_button/slider_button.dart';
import '../../../constants/colors.dart';
import '../../../model/home/home_response.dart';

class Booking extends GetView<DescriptionController> {
  Booking({
    Key? key,
    required this.datum,
  }) : super(key: key);
  final Datum datum;
  final BookingController _bookingController = Get.find();
  final PaymentController _paymentController = Get.put(PaymentController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
      onTap: () {
        _bookingController.bookNowOnTap(datum.id!);
        controller.timeConversion(datum.turfTime!);
        Get.bottomSheet(
            Container(
              color: darkGreen,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      alignment: Alignment.center,
                      width: widthSize(context) - 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: wColor, width: 2),
                      ),
                      child: Obx(
                        () => RichText(
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                text: 'Total : ₹ ',
                                style: TextStyle(fontSize: 20),
                              ),
                              TextSpan(
                                text: _bookingController.totalFair.value
                                    .toString(),
                                style: const TextStyle(
                                    color: lightGreen, fontSize: 25),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _IconText(
                            iconColor: Colors.green.withOpacity(0.4),
                            text: 'Available'),
                        const _IconText(iconColor: greyColor, text: 'Expired'),
                        _IconText(
                            iconColor: Colors.redAccent[100]!, text: 'Booked'),
                        _IconText(
                            iconColor: Colors.amber[300]!, text: 'Selected'),
                      ],
                    ),
                    HorizontalCalendar(
                      date: DateTime.now(),
                      textColor: Colors.white,
                      backgroundColor: Colors.transparent,
                      selectedColor: lightGreen,
                      onDateSelected: (date) {
                        _bookingController.onDateChangeTap(date);
                      },
                    ),
                    BookingChip(
                      amount: datum.turfPrice!.morningPrice!,
                      data: datum,
                      heading: 'Morning',
                      headingIcon: Icons.sunny_snowing,
                      timesList: controller.morningList,
                    ),
                    BookingChip(
                      amount: datum.turfPrice!.afternoonPrice!,
                      data: datum,
                      heading: 'Afternoon',
                      headingIcon: Icons.sunny,
                      timesList: controller.afternoonList,
                    ),
                    BookingChip(
                      amount: datum.turfPrice!.eveningPrice!,
                      data: datum,
                      heading: 'Evening',
                      headingIcon: Icons.nights_stay_outlined,
                      timesList: controller.evengingList,
                    ),
                    h20,
                    SliderButton(
                      // dismissible: false,
                      label: const Text(
                        'BOOK NOW',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w900),
                      ),
                      alignLabel: Alignment.center,
                      vibrationFlag: true,
                      buttonSize: 50,
                      backgroundColor: lightGreen,
                      buttonColor: darkGreen,
                      height: 60,
                      width: widthSize(context) - 30,
                      action: () {
                        _bookingController.newBookedList.isNotEmpty
                            ? Get.defaultDialog(
                                onCancel: () => Get.back(),
                                onConfirm: () {
                                  _paymentController.pay(
                                      _bookingController.totalFair.value,
                                      datum.id!);
                                },
                                textConfirm: 'Pay',
                                titleStyle: const TextStyle(color: darkGreen),
                                title:
                                    'Total : ₹ ${_bookingController.totalFair.value}',
                                backgroundColor: wColor)
                            : showDialogue('Please select atleast one');
                      },
                    ),
                    h20,
                  ],
                ),
              ),
            ),
            enterBottomSheetDuration: const Duration(seconds: 1));
      },
    );
  }
}

class _IconText extends StatelessWidget {
  const _IconText({Key? key, required this.iconColor, required this.text})
      : super(key: key);
  final Color iconColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: null,
      icon: Icon(
        Icons.circle,
        size: 20.0,
        color: iconColor,
      ),
      label: Text(
        text,
        style: const TextStyle(color: wColor, fontSize: 10),
      ),
    );
  }
}
