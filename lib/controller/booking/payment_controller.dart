import 'package:estadio/constants/core_refactering/global_refactoring.dart';
import 'package:estadio/controller/booking/booking_controller.dart';
import 'package:estadio/view/payment_status/payment_status.dart';
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
    _bookingController.isPaymentLoading.value = true;
    Get.offAll(() => PaymentStatus());
    await _bookingController.newTurfBook(turfId: turfId);
    _bookingController.isPaymentLoading.value = false;
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    showDialogue(response.message.toString());
    // Do something when payment fails
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    showDialogue(response.walletName);
  }

  Future<void> pay(amount, id) async {
    turfId = id;
    Map<String, dynamic> options = {
      'key': 'rzp_test_0rVXPTdOuP9c4q',
      'amount': amount * 100, //in the smallest currency sub-unit.
      'name': 'Estadio',
      // 'order_id': 'order_EMBFqjDHEEn80l', // Generate order_id using Orders API
      'description': 'For Demo',
      'timeout': 60, // in seconds
      'prefill': {'contact': '9645686644', 'email': 'unofficial00345@gmail.com'}
    };
    try {
      _razorpay.open(options);
    } catch (e) {
      showDialogue(e);
    }
    Get.back();
    Get.back();
  }

  @override
  void dispose() {
    _razorpay.clear(); // Removes all listeners
    super.dispose();
  }
}
