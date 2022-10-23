import 'package:estadio/constants/colors.dart';
import 'package:estadio/constants/global_refactoring.dart';
import 'package:estadio/constants/sizes.dart';
import 'package:estadio/model/Home/home_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/turf_pic.dart';

class DescriptionPage extends StatelessWidget {
  const DescriptionPage({
    super.key,
    required this.datum,
  });
  final Datum datum;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  CupertinoIcons.back,
                ),
              ),
              subTittle(datum.turfPlace!),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              headingText(datum.turfName),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                subTittle(datum.turfType!.turfFives == true ? "5s" : ""),
                w20,
                subTittle(datum.turfType!.turfSevens == true ? "7s" : "")
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
          headingText('Rates'),
          rates('Morning', datum.turfPrice!.morningPrice),
          rates('Afternoon', datum.turfPrice!.afternoonPrice),
          rates('Evening', datum.turfPrice!.eveningPrice),
          headingText('Facilities'),
          Center(
            child: GridView.count(
                crossAxisCount: 3,
                padding: const EdgeInsets.only(left: 40),
                childAspectRatio: 3,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: List.generate(6, (index) {
                  return _Facility(
                    datum: datum,
                  );
                })),
          ),
        ]),
      ),
    );
  }

  Widget rates(text, rate) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          subTittle(text),
          const SizedBox(width: 70),
          subTittle(rate.toString())
        ],
      ),
    );
  }

  Padding subTittle(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        text,
        style: const TextStyle(fontSize: 20),
      ),
    );
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
