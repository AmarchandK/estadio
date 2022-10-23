import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../constants/colors.dart';
import '../../../controller/Authentication/login_controller.dart';

class Textspan extends GetView<Authentication> {
  const Textspan(
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
          color: Colors.black,
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
