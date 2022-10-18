import 'package:estadio/constants/sizes.dart';
import 'package:estadio/view/Home/widgets/current_location.dart';
import 'package:estadio/view/Home/widgets/dot_slide.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controller/home_controller.dart';
import 'widgets/imge_slide.dart';
import 'widgets/near_grounds.dart';
import 'widgets/search.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller =
        Provider.of<HomeController>(context, listen: true);
    return Scaffold(
      backgroundColor: bColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            children: [
              h20,
              const CurrentLocation(),
              h10,
              const Search(),
              h10,
              ImageSlider(controller: controller),
              h10,
              const DotSlider(),
              h10,
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Near by Grounds',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) =>
                    const GroundCards(),
              )
            ],
          ),
        ),
      ),
    );
  }
}