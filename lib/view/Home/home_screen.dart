import 'package:estadio/constants/global_refactoring.dart';
import 'package:estadio/constants/sizes.dart';
import 'package:estadio/controller/Home/location_fetch_controller.dart';
import 'package:estadio/controller/Home/search_controller.dart';
import 'package:estadio/view/Discription/discriptiom.dart';
import 'package:estadio/view/Home/widgets/current_location.dart';
import 'package:estadio/view/Home/widgets/dot_slide.dart';
import 'package:estadio/view/Home/widgets/search_idel.dart';
import 'package:estadio/view/shimmer/home_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../constants/colors.dart';
import '../../controller/Home/home_controller.dart';
import 'widgets/imge_slide.dart';
import 'widgets/near_grounds.dart';
import 'widgets/search.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final LocationController _locationController = Get.put(LocationController());
  final SearchController _searchController = Get.put(SearchController());
  @override
  Widget build(BuildContext context) {
    final HomeController controller =
        Provider.of<HomeController>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.onInit();
    });
    return Scaffold(
      backgroundColor: bColor,
      body: Consumer<HomeController>(
        builder: (context, controller, _) {
          return controller.homeIsLoading
              ? SingleChildScrollView(
                  physics: const ScrollPhysics(),
                  child: Column(
                    children: [
                      h20,
                      Obx(
                        () => CurrentLocation(
                          place: _locationController.currentAddress.value,
                          size: 25,
                        ),
                      ),
                      Obx(
                        () => AnimatedContainer(
                          color: _searchController.isSearchClicked.value
                              ? wColor
                              : Colors.transparent,
                          duration: const Duration(seconds: 1),
                          height: _searchController.isSearchClicked.value
                              ? heightSize(context) - 150
                              : 60,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 60,
                                  child: Stack(
                                    children: [
                                      Align(
                                        child: AnimatedOpacity(
                                          opacity: _searchController
                                                  .isSearchClicked.value
                                              ? 0
                                              : 1,
                                          duration: const Duration(seconds: 1),
                                          child: Text(
                                            'Good Morning',
                                            style: GoogleFonts.lato(
                                                fontStyle: FontStyle.italic,
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      const Search(),
                                    ],
                                  ),
                                ),
                                _searchController.isSearchClicked.value
                                    ? const SearchIdle()
                                    : const SizedBox()
                              ],
                            ),
                          ),
                        ),
                      ),
                      h10,
                      const ImageSlider(),
                      h10,
                      const DotSlider(),
                      h10,
                      Align(
                          alignment: Alignment.centerLeft,
                          child: headingText('Near by Grounds')),
                      ListView.builder(
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
                      )
                    ],
                  ),
                )
              : const HomeShimmer();
        },
      ),
    );
  }
}
