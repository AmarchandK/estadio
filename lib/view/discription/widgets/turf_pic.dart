import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:estadio/constants/colors.dart';
import 'package:estadio/constants/shimmer/shimmer.dart';
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
        return CachedNetworkImage(
          imageUrl: img[index],
          imageBuilder: (context, imageProvider) => Container(
            width: widthSize(context) - 50,
            height: 180,
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: wColor,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: imageProvider,
              ),
            ),
          ),
          placeholder: (context, url) => ShimmerWidget.borderRectangle(
              width: widthSize(context) - 50, height: 180),
          errorWidget: (context, url, error) => const Icon(
            Icons.error,
            color: lightGreen,
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
