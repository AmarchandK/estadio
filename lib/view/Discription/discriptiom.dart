import 'package:estadio/constants/colors.dart';
import 'package:estadio/constants/global_refactoring.dart';
import 'package:estadio/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/turf_pic.dart';

class DescriptionPage extends StatelessWidget {
  const DescriptionPage({super.key, required this.turfDetails});
  final List turfDetails;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              CupertinoIcons.back,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              headingText('Ground Name'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [subTittle('5s'), w20, subTittle('6s')],
              )
            ],
          ),
          h20,
          const TurfPics(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              headingText('Facilities'),
              subTittle('Location'),
            ],
          ),
          GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate(5, (index) {
                return const _Facility();
              }))
        ]),
      ),
    );
  }

  Text subTittle(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 20),
    );
  }
}

class _Facility extends StatelessWidget {
  const _Facility({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(
          Icons.done_outline_sharp,
          color: grassColor,
        ),
        Text('First Aid')
      ],
    );
  }
}
