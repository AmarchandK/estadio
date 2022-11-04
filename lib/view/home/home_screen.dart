import 'package:estadio/constants/core_refactering/global_refactoring.dart';
import 'package:estadio/constants/sizes.dart';
import 'package:estadio/controller/home/home_controller.dart';
import 'package:estadio/controller/home/location_fetch_controller.dart';
import 'package:estadio/view/home/widgets/current_location.dart';
import 'package:estadio/view/home/widgets/dot_slide.dart';
import 'package:estadio/view/home/widgets/search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'widgets/imge_slide.dart';
import 'widgets/ground_cards.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final LocationController _locationController = Get.put(LocationController());

  @override
  Widget build(BuildContext context) {
    final HomeController controller =
        Provider.of<HomeController>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.onInit();
    });
    return Scaffold(
      body: Consumer<HomeController>(
        builder: (context, controller, _) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                h20,
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: AnimatedSearch(),
                ),
                h10,
                Obx(
                  () => CurrentLocation(
                    place: _locationController.currentAddress.value,
                    size: 25,
                  ),
                ),
                h20,
                const ImageSlider(),
                h10,
                const DotSlider(),
                h10,
                Align(
                    alignment: Alignment.centerLeft,
                    child: mainHeadingText('Near by Grounds')),
                Consumer<HomeController>(builder: (context, controller, _) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.nearGrounds.length,
                    itemBuilder: (BuildContext context, int index) {
                      final turfsList = controller.nearGrounds[index];
                      return GroundCards(
                      
                        turfList: turfsList,
                      );
                    },
                  );
                })
              ],
            ),
          );
        },
      ),
    );
  }
}
