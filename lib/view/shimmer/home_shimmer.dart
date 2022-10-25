import 'package:estadio/constants/shimmer/shimmer.dart';
import 'package:estadio/constants/sizes.dart';
import 'package:flutter/material.dart';

class HomeShimmer extends StatelessWidget {
  const HomeShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ShimmerWidget.rectangular(
                height: 30,
                width: 200,
              ),
              ShimmerWidget.rectangular(
                width: widthSize(context) - 100,
                height: 30,
              ),
              h20,
              const Center(
                  child:
                      ShimmerWidget.borderRectangle(width: 300, height: 180)),
              const ShimmerWidget.rectangular(
                height: 30,
                width: 200,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => ShimmerWidget.borderRectangle(
                    width: widthSize(context) - 50, height: 100),
                itemCount: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
