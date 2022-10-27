import 'package:estadio/constants/core_refactering/global_refactoring.dart';
import 'package:estadio/constants/sizes.dart';
import 'package:estadio/controller/Home/location_fetch_controller.dart';
import 'package:estadio/view/Discription/discriptiom.dart';
import 'package:estadio/view/Home/widgets/current_location.dart';
import 'package:estadio/view/Home/widgets/dot_slide.dart';
import 'package:estadio/view/Home/widgets/search.dart';
import 'package:estadio/view/shimmer/home_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../controller/Home/home_controller.dart';
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
          return controller.homeIsLoading
              ? SingleChildScrollView(
                  physics: const ScrollPhysics(),
                  child: Column(
                    children: [
                      h20,
                      Obx(
                        () => Padding(
                          padding: const EdgeInsets.only(top: 12, left: 15),
                          child: CurrentLocation(
                            place: _locationController.currentAddress.value,
                            size: 25,
                          ),
                        ),
                      ),
                      AnimatedSearch(),
                      h10,
                      const ImageSlider(),
                      h10,
                      const DotSlider(),
                      h10,
                      Align(
                          alignment: Alignment.centerLeft,
                          child: mainHeadingText('Near by Grounds')),
                      Consumer<HomeController>(
                          builder: (context, controller, _) {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.nearGrounds.length,
                          itemBuilder: (BuildContext context, int index) {
                            final turfsList = controller.nearGrounds[index];
                            return GroundCards(
                              toFucn: () => Get.to(
                                () => DescriptionPage(
                                  datum: turfsList,
                                ),
                              ),
                              turfList: turfsList,
                            );
                          },
                        );
                      })
                    ],
                  ),
                )
              : const HomeShimmer();
        },
      ),
    );
  }
}
