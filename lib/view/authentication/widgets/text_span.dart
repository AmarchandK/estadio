import 'package:estadio/controller/authentication/login_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../constants/colors.dart';

class TextspanAuth extends GetView<Authentication> {
  const TextspanAuth(
    this.onTap, {
    Key? key,
    required this.firstText,
    required this.secondText,
  }) : super(key: key);
  final String firstText;
  final String secondText;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: firstText,
        style: GoogleFonts.akayaKanadaka(
          fontSize: 20,
          color: wColor,
        ),
        children: [
          TextSpan(
            text: secondText,
            style: GoogleFonts.akayaKanadaka(
              fontSize: 20,
              color: lightGreen,
            ),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
