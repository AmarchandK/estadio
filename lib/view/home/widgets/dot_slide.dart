import 'package:estadio/controller/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../constants/colors.dart';

class DotSlider extends StatelessWidget {
  const DotSlider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
      builder: (context, data, _) => AnimatedSmoothIndicator(
        activeIndex: data.activeIndex,
        count: data.imgUrls.length,
        effect: const JumpingDotEffect(
            radius: 9,
            dotColor: greyColor,
            activeDotColor: lightGreen,
            dotHeight: 10,
            dotWidth: 10),
      ),
    );
  }
}
