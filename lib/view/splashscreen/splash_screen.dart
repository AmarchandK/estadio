import 'package:estadio/constants/sizes.dart';
import 'package:estadio/controller/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../constants/colors.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  final SplashController controller = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: heightSize(context),
          width: widthSize(context),
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/splash.png'), fit: BoxFit.cover),
          ),
          child: Text(
            'ESTADIO',
            style: GoogleFonts.baumans(
              color: lightGreen,
              fontSize: 60,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: Lottie.asset('assets/splashLoading.json')),
      ],
    ));
  }
}
