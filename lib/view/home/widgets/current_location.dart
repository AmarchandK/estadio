import 'package:estadio/constants/core_refactering/global_refactoring.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';

class CurrentLocation extends StatelessWidget {
  const CurrentLocation({
    required this.place,
    Key? key,
    required this.size,
  }) : super(key: key);
  final RxString place;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 5),
      child: Row(
        children: [
          Icon(
            CupertinoIcons.location_solid,
            size: size,
          ),
          Obx(
            () => FittedBox(child: contentsText(text: place.value, size: 17)),
          )
        ],
      ),
    );
  }
}
