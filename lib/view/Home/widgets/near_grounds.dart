import 'package:cached_network_image/cached_network_image.dart';
import 'package:estadio/constants/shimmer/shimmer.dart';
import 'package:estadio/view/Home/widgets/current_location.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_cards/flutter_custom_cards.dart';
import '../../../constants/colors.dart';
import '../../../constants/sizes.dart';
import '../../../model/Home/home_response.dart';

class GroundCards extends StatelessWidget {
  const GroundCards({
    Key? key,
    this.onFav,
    required this.toFucn,
    required this.turfList,
  }) : super(key: key);

  final void Function()? onFav;

  final void Function() toFucn;

  final Datum turfList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: CustomCard(
        color: darkGreen,
        onTap: toFucn,
        childPadding: 5,
        borderRadius: 10,
        child: Row(
          children: [
            CachedNetworkImage(
                imageUrl: turfList.turfLogo!,
                imageBuilder: (context, imageProvider) => Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.fill,
                            colorFilter: const ColorFilter.mode(
                                Colors.transparent, BlendMode.colorBurn)),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                    ),
                placeholder: (context, url) =>
                    const ShimmerWidget.borderRectangle(
                        width: 100, height: 100),
                errorWidget: (context, url, error) => const SizedBox(
                      width: 100,
                      height: 100,
                      child: Center(child: CupertinoActivityIndicator()),
                    )),
            w10,
            Expanded(
              child: SizedBox(
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      child: Text(
                        turfList.turfName!,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                    CurrentLocation(
                      place: turfList.turfPlace!,
                      size: 15,
                    ),
                    turfList.turfInfo!.turfIsAvailable!
                        ? const Text(
                            'Available',
                            style: TextStyle(color: Colors.green),
                          )
                        : const Text('Not Available',
                            style: TextStyle(color: Colors.red)),
                    Row(
                      children: [
                        Text(turfList.turfType!.turfFives! ? "5s" : ""),
                        w20,
                        Text(turfList.turfType!.turfSevens! ? "7s" : "")
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      CupertinoIcons.star,
                      size: 15,
                      color: Color.fromARGB(255, 255, 129, 0),
                    ),
                    Text(
                      ' ${turfList.turfInfo!.turfRating!}',
                    ),
                  ],
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.bookmark_border,
                      color: lightGreen,
                    )),
                w20
              ],
            )
          ],
        ),
      ),
    );
  }
}
