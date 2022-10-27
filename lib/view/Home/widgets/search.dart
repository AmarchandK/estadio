import 'package:estadio/constants/core_refactering/global_refactoring.dart';
import 'package:estadio/constants/sizes.dart';
import 'package:estadio/controller/Home/search_controller.dart';
import 'package:estadio/view/Discription/discriptiom.dart';
import 'package:estadio/view/Home/widgets/ground_cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
    return Column(
      children: [
        SizedBox(
          height: 60,
          child: Stack(
            children: [
              Align(
                child: AnimatedOpacity(
                  opacity: _searchController.isSearchClicked.value ? 0 : 1,
                  duration: const Duration(seconds: 1),
                  child: Text(
                    greeting(),
                    style: GoogleFonts.lato(
                      fontStyle: FontStyle.italic,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: wColor,
                    ),
                  ),
                ),
              ),
              const _TextField(),
            ],
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
                : 0,
            child: SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: Column(
                children: [
                  _searchController.isSearchClicked.value
                      ? const _IdleWidgets()
                      : const SizedBox()
                ],
              ),
            ),
          ),
        )
      ],
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
                  controller.searchController.clear();
                  controller.runFilter(controller.searchController.text.trim());
                  controller.isSearched.value = true;
                  FocusScope.of(context).unfocus();

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
                    onChanged: (value) {
                      if (value.isEmpty) {
                        controller.isSearched.value = true;
                      } else {
                        controller.isSearched.value = false;
                      }
                      controller.debouncer.run(() {
                        controller.runFilter(value.trim());
                      });
                    },
                    controller: controller.searchController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
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
      builder: (controller) => controller.foundTurfs.isNotEmpty
          ? (controller.isSearched.value
              ? MasonryGridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
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
                        child: Image.network(
                            controller.allSerach[index].turfLogo!),
                      ),
                    );
                  },
                )
              : ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => GroundCards(
                        toFucn: () => Get.to(
                          () => DescriptionPage(
                            datum: controller.foundTurfs[index],
                          ),
                        ),
                        turfList: controller.foundTurfs[index],
                      ),
                  itemCount: controller.foundTurfs.length))
          : const Text(
              'No data',
              style: TextStyle(color: Colors.black),
            ),
    );
  }
}
