  import 'package:estadio/constants/sizes.dart';
import 'package:estadio/view/Discription/discriptiom.dart';
import 'package:estadio/view/Home/widgets/current_location.dart';
import 'package:estadio/view/Home/widgets/dot_slide.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../constants/colors.dart';
import '../../controller/Home/home_controller.dart';
import 'widgets/imge_slide.dart';
import 'widgets/near_grounds.dart';
import 'widgets/search.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller =
        Provider.of<HomeController>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.homeFetch();
    });
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
              ImageSlider(controller: controller,datum: controller.nearGrounds),
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
              Consumer<HomeController>(builder: (context, controller, _) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.nearGrounds.length,
                  itemBuilder: (BuildContext context, int index) {
                    final turfsList = controller.nearGrounds[index];

                    return GroundCards(
                      img: turfsList.turfLogo!,
                      turfName: turfsList.turfName!,
                      rating: turfsList.turfInfo!.turfRating!,
                      place: turfsList.turfPlace!,
                      toFucn: () => Get.to(() => DescriptionPage(
                            datum: turfsList,
                          )),
                    );
                  },
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
