import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';
import '../../controller/Authentication/login_controller.dart';

class OTPscreen extends GetView<Authentication> {
  OTPscreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
        ),
        elevation: 0,
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage(
                  'assets/img1.png',
                ),
                width: 150,
                height: 150,
              ),
              h20,
              const Text(
                "Email Verification",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "We need to register your email without getting started!",
                style: TextStyle(fontSize: 16, color: Colors.black),
                textAlign: TextAlign.center,
              ),
              h20,
              Obx(
                () => Authentication.onTapLoading.value
                    ? Form(
                        key: controller.pinKey,
                        child: Pinput(
                          cursor: const Text('#'),
                          androidSmsAutofillMethod:
                              AndroidSmsAutofillMethod.smsUserConsentApi,
                          pinAnimationType: PinAnimationType.rotation,
                          hapticFeedbackType: HapticFeedbackType.heavyImpact,
                          listenForMultipleSmsOnAndroid: true,
                          autofocus: true,
                          animationCurve: Curves.elasticInOut,
                          animationDuration: const Duration(seconds: 1),
                          focusNode: FocusNode(),
                          // validator: (value) {
                          //   return '';
                          // },
                          errorPinTheme: _defaultPinTheme.copyBorderWith(
                            border: Border.all(color: Colors.redAccent),
                          ),
                          onCompleted: (pin) => controller.onOtpEnter(pin),
                          defaultPinTheme: _defaultPinTheme,
                          focusedPinTheme: _focusedPinTheme,
                          submittedPinTheme: _submittedPinTheme,
                          length: 4,
                          showCursor: true,
                        ),
                      )
                    : const CupertinoActivityIndicator(
                        color: greenColor,
                        radius: 20,
                      ),
              ),
              const SizedBox(
                height: 20,
              ),
              // OnTapButton(
              //   text: "Verify Phone Number",
              //   onTap: () {},
              // ),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text(
                      "Resend",
                      style: TextStyle(color: Colors.black),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  final PinTheme _defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(
      fontSize: 22,
      color: bColor,
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(7),
      border: Border.all(color: bColor),
    ),
  );
  final PinTheme _focusedPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: greenColor,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: greenColor),
        borderRadius: BorderRadius.circular(8),
      ));
  final PinTheme _submittedPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(
      fontSize: 22,
      color: bColor,
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(7),
      border: Border.all(color: Colors.amber),
    ),
  );
}
