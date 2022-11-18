import 'package:estadio/constants/core_refactering/global_refactoring.dart';
import 'package:estadio/controller/fav_button_controller.dart/fav_button_controller.dart';
import 'package:estadio/view/home/widgets/ground_cards.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Favourites extends GetView<FavButtonController> {
  const Favourites({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: mainHeadingText('Favourites'),
        backgroundColor: Colors.transparent,
      ),
      body: ListView.builder(
          itemCount: controller.favTurfs.length,
          itemBuilder: (context, index) =>
              GroundCards(turfList: controller.favTurfs[index])),
    );
  }
}
