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
    return Center(
      child: Obx(
        () => SizedBox(
          width: 352,
          height: 60,
          child: Stack(
            children: [
              AnimatedPositioned(
                top: 5,
                bottom: 5,
                duration: const Duration(seconds: 2),
                left: controller.isSearchClicked.value ? 0 : 290,
                child: AnimatedOpacity(
                  duration: const Duration(seconds: 1),
                  opacity: controller.isSearchClicked.value ? 0.3 : 1,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 50),
                    height: 50,
                    width: controller.isSearchClicked.value ? 100 : 50,
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
                left: controller.isSearchClicked.value ? 0 : 290,
                child: IconButton(
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    controller.searchController.clear();
                    controller.isSearchClicked.value =
                        !controller.isSearchClicked.value;
                  },
                  icon: const Icon(
                    Icons.search,
                  ),
                ),
              ),
              AnimatedPositioned(
                top: 5,
                bottom: 5,
                duration: const Duration(seconds: 1),
                right: controller.isSearchClicked.value ? 0 : 300,
                width: controller.isSearchClicked.value ? 300 : 0,
                child: AnimatedOpacity(
                  opacity: controller.isSearchClicked.value ? 1 : 0,
                  duration: const Duration(seconds: 1),
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    decoration: BoxDecoration(
                      color: wColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      controller: controller.searchController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        hintText: 'Enter the Search',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
