import 'dart:developer';

import 'package:estadio/constants/colors.dart';
import 'package:estadio/constants/global_refactoring.dart';
import 'package:estadio/constants/sizes.dart';
import 'package:estadio/model/Home/home_response.dart';
import 'package:estadio/view/Home/widgets/current_location.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/link.dart';
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
  late final List<String> facilites = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                headingText(datum.turfName),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(datum.turfType!.turfFives == true ? "5s" : ""),
                      w10,
                      Text(datum.turfType!.turfSevens == true ? "7s" : "")
                    ])
              ],
            ),
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
                CurrentLocation(
                    place: '${datum.turfPlace} , ${datum.turfDistrict}',
                    size: 20),
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
                AmentiesWidget(
                    value: datum.turfAmenities!.turfCafeteria!,
                    icon: Icons.local_cafe_outlined,
                    item: 'Cafteria'),
                AmentiesWidget(
                    value: datum.turfAmenities!.turfDressing!,
                    icon: Icons.spa,
                    item: 'Dressing'),
                AmentiesWidget(
                    value: datum.turfAmenities!.turfGallery!,
                    icon: Icons.stadium_outlined,
                    item: 'Gallery'),
                AmentiesWidget(
                    value: datum.turfAmenities!.turfParking!,
                    icon: Icons.local_parking_rounded,
                    item: 'Parking'),
                AmentiesWidget(
                    value: datum.turfAmenities!.turfWashroom!,
                    icon: Icons.wash,
                    item: '   Wash  '),
                AmentiesWidget(
                    value: datum.turfAmenities!.turfWater!,
                    icon: Icons.water,
                    item: '  Water '),
              ],
            ),
            subTittle('Available For'),
            Wrap(
              alignment: WrapAlignment.center,
              children: [
                AmentiesWidget(
                    value: datum.turfCategory!.turfBadminton!,
                    item: 'Badminton',
                    icon: Icons.sports_football_rounded),
                AmentiesWidget(
                    value: datum.turfCategory!.turfCricket!,
                    item: 'Cricket',
                    icon: Icons.sports_football_rounded),
                AmentiesWidget(
                    value: datum.turfCategory!.turfFootball!,
                    item: 'Football',
                    icon: Icons.sports_football_rounded),
                AmentiesWidget(
                    value: datum.turfCategory!.turfYoga!,
                    item: 'Yoga',
                    icon: Icons.sports_football_rounded),
              ],
            ),
            subTittle('Rates'),
            SizedBox(
              height: 80,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => _times(
                      amount: price[index],
                      time: '10 am-12 pm',
                      timetype: 'Morning'),
                  separatorBuilder: (context, index) => w10,
                  itemCount: 3),
            ),
          ]),
        ),
      ),
    );
  }

  Container _times({amount, time, timetype}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
          border: Border.all(color: darkGreen, width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      width: 110,
      child: Column(
        children: [
          Text(timetype),
          const Divider(
            color: greyColor,
            endIndent: 1,
            indent: 1,
          ),
          Text(time),
          Text('₹ $amount'),
        ],
      ),
    );
  }

  Widget subTittle(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(7),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 22,
          ),
        ),
      ),
    );
  }
}

class AmentiesWidget extends StatelessWidget {
  const AmentiesWidget({
    Key? key,
    required this.value,
    required this.item,
    required this.icon,
  }) : super(key: key);
  final bool value;
  final String item;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return value
        ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: ChoiceChip(
                clipBehavior: Clip.hardEdge,
                selectedColor: darkGreen,
                padding: const EdgeInsets.all(2),
                label: Text(item),
                avatar: Icon(icon),
                selected: true),
          )
        : const SizedBox();
  }
}

class _Facility extends StatelessWidget {
  const _Facility({
    Key? key,
    required this.datum,
  }) : super(key: key);
  final Datum datum;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(
          Icons.done_outline_sharp,
          color: darkGreen,
        ),
        w20,
        Text('First Aid')
      ],
    );
  }
}
