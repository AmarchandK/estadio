import 'package:estadio/controller/Home/location_fetch_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';

class CurrentLocation extends GetView<LocationController> {
  const CurrentLocation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(CupertinoIcons.location_solid),
        Obx(
          () => Text(
            controller.currentAddress.value,
            overflow: TextOverflow.fade,
            softWrap: true,
          ),
        )
      ],
    );
  }
}
