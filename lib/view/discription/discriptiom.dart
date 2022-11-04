import 'package:estadio/constants/colors.dart';
import 'package:estadio/constants/core_refactering/global_refactoring.dart';
import 'package:estadio/constants/sizes.dart';
import 'package:estadio/model/home/home_response.dart';
import 'package:estadio/view/discription/widgets/booking_sheet.dart';
import 'package:estadio/view/discription/widgets/discription_chip.dart';
import 'package:estadio/view/home/widgets/current_location.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:url_launcher/link.dart';
import 'widgets/amout_category.dart';
import 'widgets/turf_pic.dart';

class DescriptionPage extends StatelessWidget {
  DescriptionPage({
    super.key,
    required this.datum,
  });
  final Datum datum;
  late final List<int> price = [
    datum.turfPrice!.morningPrice!,
    datum.turfPrice!.afternoonPrice!,
    datum.turfPrice!.eveningPrice!,
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(children: [
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  CupertinoIcons.back,
                ),
              ),
            ),
            mainHeadingText(datum.turfName),
            h20,
            TurfPics(
              img: [
                datum.turfImages!.turfImages1!,
                datum.turfImages!.turfImages2!,
                datum.turfImages!.turfImages3!
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                w10,
                RatingBarIndicator(
                  rating: datum.turfInfo!.turfRating!,
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemSize: 15,
                  unratedColor: greyColor,
                ),
                const Spacer(),
                CurrentLocation(
                    place: '${datum.turfPlace}, ${datum.turfDistrict}',
                    size: 17),
                Link(
                  uri: Uri.parse(datum.turfInfo!.turfMap!),
                  builder: (context, followLink) => IconButton(
                    color: darkGreen,
                    onPressed: () => followLink,
                    icon: const Icon(Icons.map_rounded),
                  ),
                )
              ],
            ),
            subTittle('Facilities'),
            Wrap(
              children: [
                DiscriptionChipWidget(
                    value: datum.turfAmenities!.turfCafeteria!,
                    icon: Icons.local_cafe_outlined,
                    item: 'Cafteria'),
                DiscriptionChipWidget(
                    value: datum.turfAmenities!.turfDressing!,
                    icon: Icons.spa,
                    item: 'Dressing'),
                DiscriptionChipWidget(
                    value: datum.turfAmenities!.turfGallery!,
                    icon: Icons.stadium_outlined,
                    item: 'Gallery'),
                DiscriptionChipWidget(
                    value: datum.turfAmenities!.turfParking!,
                    icon: Icons.local_parking_rounded,
                    item: 'Parking'),
                DiscriptionChipWidget(
                    value: datum.turfAmenities!.turfWashroom!,
                    icon: Icons.wash,
                    item: '   Wash  '),
                DiscriptionChipWidget(
                    value: datum.turfAmenities!.turfWater!,
                    icon: Icons.water,
                    item: '  Water '),
              ],
            ),
            subTittle('Available For'),
            Wrap(
              alignment: WrapAlignment.center,
              children: [
                DiscriptionChipWidget(
                    value: datum.turfCategory!.turfBadminton!,
                    item: 'Badminton',
                    icon: Icons.sports_football_rounded),
                DiscriptionChipWidget(
                    value: datum.turfCategory!.turfCricket!,
                    item: 'Cricket',
                    icon: Icons.sports_football_rounded),
                DiscriptionChipWidget(
                    value: datum.turfCategory!.turfFootball!,
                    item: 'Football',
                    icon: Icons.sports_football_rounded),
                DiscriptionChipWidget(
                    value: datum.turfCategory!.turfYoga!,
                    item: 'Yoga',
                    icon: Icons.sports_football_rounded),
              ],
            ),
            subTittle('Rates'),
            h10,
            SizedBox(
              height: 80,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => timings(
                      amount: price[index],
                      timetype: index == 0
                          ? 'Morning'
                          : index == 1
                              ? 'Afternoon'
                              : 'Evening'),
                  separatorBuilder: (context, index) => w10,
                  itemCount: 3),
            ),
            const SizedBox(height: 100)
          ]),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Booking(datum: datum),
      ),
    );
  }
}
