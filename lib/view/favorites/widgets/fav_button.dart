import 'dart:developer';
import 'package:estadio/constants/colors.dart';
import 'package:estadio/controller/fav_button_controller.dart/fav_button_controller.dart';
import 'package:estadio/model/home/home_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavButton extends StatelessWidget {
  FavButton({super.key, required this.datum});
  final FavButtonController _favButtonController =
      Get.put(FavButtonController());
  final Datum datum;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavButtonController>(
      builder: (controller) => IconButton(
        onPressed: () async {
          log(datum.turfName.toString());

          await _favButtonController.addFavToDb(datum);
          log(datum.turfName.toString());
        },
        icon: Icon(
          _favButtonController.isFav(datum).value
              ? Icons.bookmark_outlined
              : Icons.bookmark_border_outlined,
          color: lightGreen,
        ),
      ),
    );
  }
}
