import 'dart:developer';

import 'package:estadio/controller/booking/booking_controller.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentController extends GetxController {
  final Razorpay _razorpay = Razorpay();
  late String turfId;
  final BookingController _bookingController = Get.find();
  @override
  void onInit() {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.onInit();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    log(response.paymentId.toString());
    log(' Payment Successfull');
    log(turfId);
    await _bookingController.newTurfBook(turfId: turfId);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    log('_handlePaymentError');
    // Do something when payment fails
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    log('_handleExternalWallet');
  }

  Future<void> pay(amount, id) async {
    turfId = id;
    Map<String, dynamic> options = {
      'key': 'rzp_test_0rVXPTdOuP9c4q',
      'amount': amount * 100, //in the smallest currency sub-unit.
      'name': 'Acme Corp.',
      // 'order_id': 'order_EMBFqjDHEEn80l', // Generate order_id using Orders API
      'description': 'Fine T-Shirt',
      'timeout': 60, // in seconds
      'prefill': {'contact': '9645686644', 'email': 'gaurav.kumar@example.com'}
    };
    _razorpay.open(options);
    Get.back();
    Get.back();
  }

  @override
  void dispose() {
    _razorpay.clear(); // Removes all listeners
    log('Payment controller disposed');
    super.dispose();
  }
}
