import 'package:carousel_slider/carousel_slider.dart';
import 'package:estadio/constants/colors.dart';
import 'package:estadio/constants/sizes.dart';
import 'package:flutter/material.dart';

class TurfPics extends StatelessWidget {
  const TurfPics({
    Key? key,
    required this.img,
  }) : super(key: key);
  final List<String> img;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: 3,
      itemBuilder: (context, index, realIndex) {
        return Container(
          width: widthSize(context) - 50,
          height: 180,
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: wColor,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(img[index]),
            ),
          ),
        );
      },
      options: CarouselOptions(
        height: 180,
        enableInfiniteScroll: true,
      ),
    );
  }
}
