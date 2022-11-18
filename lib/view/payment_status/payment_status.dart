import 'dart:math';
import 'package:confetti/confetti.dart';
import 'package:estadio/controller/booking/booking_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';

class PaymentStatus extends StatelessWidget {
  PaymentStatus({super.key});
  final BookingController _bookingController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<BookingController>(
        builder: (controller) {
          _bookingController.isSuccess.value
              ? _bookingController.afterPayment()
              : null;
          return _bookingController.isPaymentLoading.value
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Payment Processing...',
                        style: TextStyle(
                          color: wColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ],
                  ),
                )
              : ColoredBox(
                  color: darkGreen,
                  child: Stack(
                    children: [
                      ConfettiWidget(
                        shouldLoop: false,
                        confettiController:
                            _bookingController.confettiController,
                        blastDirection: pi / 3,
                        numberOfParticles: 60,
                        blastDirectionality: BlastDirectionality.explosive,
                        maxBlastForce: 20, // set a lower max blast force
                        minBlastForce: 5, // set a lower min blast force
                        emissionFrequency: 0.02,
                        gravity: 0.02,
                        colors: const [
                          Colors.green,
                          Colors.blue,
                          Colors.pink,
                          Colors.orange,
                          Colors.purple,
                          wColor,
                        ],
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Payment Successful".toUpperCase(),
                              style: const TextStyle(
                                color: wColor,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                                decoration: TextDecoration.none,
                              ),
                            ),
                            w10,
                          ],
                        ),
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
