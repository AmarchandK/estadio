
import 'package:carousel_slider/carousel_slider.dart';
import 'package:estadio/constants/colors.dart';
import 'package:flutter/material.dart';

class TurfPics extends StatelessWidget {
  const TurfPics({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: 3,
      itemBuilder: (context, index, realIndex) => Container(
        width: 400,
        height: 200,
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: wColor,
          image: const DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(''),
          ),
        ),
      ),
      options: CarouselOptions(
        height: 180,
        enableInfiniteScroll: true,
      ),
    );
  }
}
