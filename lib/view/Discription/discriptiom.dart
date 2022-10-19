import 'package:carousel_slider/carousel_slider.dart';
import 'package:estadio/constants/colors.dart';
import 'package:estadio/constants/global_refactoring.dart';
import 'package:estadio/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DescriptionPage extends StatelessWidget {
  const DescriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              CupertinoIcons.back,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [headingText('Ground Name'), const Text('Location Name')],
          ),
          h20,
          CarouselSlider.builder(
            itemCount: 3,
            itemBuilder: (context, index, realIndex) => Container(
              width: 400,
              height: 200,
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: wColor,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(''),
                ),
              ),
            ),
            options: CarouselOptions(
              height: 180,
              enableInfiniteScroll: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50, top: 15),
            child: headingText('Facilities'),
          )
        ]),
      ),
    );
  }
}
