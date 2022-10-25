import 'package:estadio/controller/Home/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/state_manager.dart';

import '../../../model/Home/home_response.dart';

class SearchIdle extends GetView<SearchController> {
  const SearchIdle({super.key});

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.builder(
      shrinkWrap: true,
      crossAxisSpacing: 5,
      mainAxisSpacing: 5,
      itemCount: 12,
      gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3),
      itemBuilder: (context, index) => ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network('http://source.unsplash.com/random?sig=$index'),
      ),
    );
  }
}
