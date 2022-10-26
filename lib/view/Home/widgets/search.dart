import 'package:estadio/constants/sizes.dart';
import 'package:estadio/controller/Home/search_controller.dart';
import 'package:estadio/view/Discription/discriptiom.dart';
import 'package:estadio/view/Home/widgets/near_grounds.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../constants/colors.dart';

class AnimatedSearch extends StatelessWidget {
  AnimatedSearch({
    Key? key,
  }) : super(key: key);
  final SearchController _searchController = Get.put(SearchController());
  @override
  Widget build(BuildContext context) {
    return Obx(
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
                        opacity:
                            _searchController.isSearchClicked.value ? 0 : 1,
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
                    const _TextField(),
                  ],
                ),
              ),
              _searchController.isSearchClicked.value
                  ? const _IdleWidgets()
                  : const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}

////////////////////  TextFields /////////////////////////////
/////////////////////////////////////////////////////////////
class _TextField extends GetView<SearchController> {
  const _TextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        width: widthSize(context) / 1.05,
        height: 60,
        child: Stack(
          children: [
            AnimatedPositioned(
              top: 5,
              bottom: 5,
              duration: const Duration(seconds: 2),
              left: controller.isSearchClicked.value
                  ? 0
                  : widthSize(context) / 1.23,
              child: AnimatedOpacity(
                duration: const Duration(seconds: 1),
                opacity: controller.isSearchClicked.value ? 0.3 : 1,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 50),
                  height: 50,
                  width: controller.isSearchClicked.value ? 70 : 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: controller.isSearchClicked.value
                        ? darkGreen
                        : lightGreen,
                  ),
                ),
              ),
            ),
            AnimatedPositioned(
              top: 5,
              bottom: 5,
              duration: const Duration(seconds: 1),
              left: controller.isSearchClicked.value
                  ? 0
                  : widthSize(context) / 1.23,
              child: IconButton(
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  controller.searchController.clear();
                  controller.isSearchClicked.value =
                      !controller.isSearchClicked.value;
                },
                icon: Icon(controller.isSearchClicked.value
                    ? Icons.close_outlined
                    : Icons.search),
              ),
            ),
            AnimatedPositioned(
              top: 5,
              bottom: 5,
              duration: const Duration(seconds: 1),
              right: controller.isSearchClicked.value
                  ? 0
                  : widthSize(context) / 1.23,
              width: controller.isSearchClicked.value
                  ? widthSize(context) / 1.23
                  : 0,
              child: AnimatedOpacity(
                opacity: controller.isSearchClicked.value ? 1 : 0,
                duration: const Duration(seconds: 1),
                child: AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  decoration: BoxDecoration(
                    color: Colors.green[50],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.black),
                    onChanged: (value) => controller.debouncer.run(() {
                      controller.runFilter(value.trim());
                    }),
                    controller: controller.searchController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      hintText: 'Search here',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

///////////////////// Idle Widget ////////////////////////////////
//////////////////////////////////////////////////////////////////
class _IdleWidgets extends GetView<SearchController> {
  const _IdleWidgets();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchController>(
      builder: (controller) => controller.foundTurfs.isEmpty
          ? MasonryGridView.builder(
              shrinkWrap: true,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              itemCount: controller.allSerach.length,
              gridDelegate:
                  const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: lightGreen, width: 4)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(controller.allSerach[index].turfLogo!),
                  ),
                );
              },
            )
          : ListView.builder(
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (context, index) => GroundCards(
                    toFucn: () => Get.to(
                      () => DescriptionPage(
                        datum: controller.foundTurfs[index],
                      ),
                    ),
                    turfList: controller.foundTurfs[index],
                  ),
              itemCount: controller.foundTurfs.length),
    );
  }
}
