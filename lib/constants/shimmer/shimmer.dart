import 'package:estadio/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

loadingShimmer() {
  return const ListTile(
    leading: SimmerWidget.circular(width: 100, height: 100),
    title: SimmerWidget.rectangular(height: 70),
  );
}

class SimmerWidget extends StatelessWidget {
  const SimmerWidget.rectangular(
      {super.key,
      this.width = double.infinity,
      required this.height,
      this.shapeBorder = const RoundedRectangleBorder()});
  const SimmerWidget(
      {super.key, required this.width, required this.height, this.shapeBorder});
  const SimmerWidget.circular({
    super.key,
    required this.width,
    required this.height,
    this.shapeBorder = const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(12),
      ),
    ),
  });

  final double width;
  final double height;
  final ShapeBorder? shapeBorder;

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
        baseColor: Colors.grey[400]!,
        highlightColor: Colors.grey[300]!,
        child: Container(
          width: width,
          height: height,
          decoration: ShapeDecoration(
            shape: shapeBorder!,
            color: greyColor,
          ),
        ),
      );
}
