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
    return IconButton(
        onPressed: () async {
          _favButtonController.isFav(datum.turfName!)
              ? await _favButtonController.deleteFav(datum.turfName!)
              : await _favButtonController.addFavToDb(datum);
        },
        icon: GetBuilder<FavButtonController>(
          builder: (controller) => Icon(
            _favButtonController.isFav(datum.turfName!)
                ? Icons.bookmark_outlined
                : Icons.bookmark_border_outlined,
            color: lightGreen,
          ),
        ));
  }
}
