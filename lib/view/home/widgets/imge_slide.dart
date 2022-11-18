import 'package:carousel_slider/carousel_slider.dart';
import 'package:estadio/controller/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../groundCategory/list_of_grounds.dart';

class ImageSlider extends StatelessWidget {
  const ImageSlider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController controller =
        Provider.of<HomeController>(context, listen: false);
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
          onTap: () => Get.to(() => GroundCategory(
                img: urlImg,
                tittle: urlTitle,
                turfList: controller.categoryAllList[index],
              )),
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
                  style: GoogleFonts.arimo(
                      fontSize: 40, fontWeight: FontWeight.w900),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
