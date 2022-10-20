import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../constants/colors.dart';
import '../../../controller/Home/home_controller.dart';

class ImageSlider extends StatelessWidget {
  const ImageSlider({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: controller.imgUrls.length,
      options: CarouselOptions(
        autoPlayInterval: const Duration(seconds: 5),
        height: 180,
        enableInfiniteScroll: false,
        // autoPlay: true,
        enlargeCenterPage: true,
        onPageChanged: (index, reason) => controller.carousleChange(index),
      ),
      itemBuilder: (context, index, realIndex) {
        final urlImg = controller.imgUrls[index];
        final urlTitle = controller.carosleTittle[index];
        return GestureDetector(
          onTap: () => controller.homeFetch(),
          child: Container(
            width: 400,
            height: 200,
            margin: const EdgeInsets.symmetric(horizontal: 7),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(urlImg),
              ),
            ),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 10, bottom: 20),
                child: Text(
                  urlTitle,
                  style: const TextStyle(color: wColor, fontSize: 40),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
