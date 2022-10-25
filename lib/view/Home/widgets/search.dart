import 'package:estadio/constants/sizes.dart';
import 'package:estadio/controller/Home/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/colors.dart';

class Search extends GetView<SearchController> {
  const Search({
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
