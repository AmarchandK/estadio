import 'package:cached_network_image/cached_network_image.dart';
import 'package:estadio/constants/core_refactering/global_refactoring.dart';
import 'package:estadio/constants/shimmer/shimmer.dart';
import 'package:estadio/view/Home/widgets/current_location.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_cards/flutter_custom_cards.dart';
import 'package:google_fonts/google_fonts.dart';
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
                            fit: BoxFit.cover,
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
            w20,
            Expanded(
              child: SizedBox(
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      child: Text(
                        turfList.turfName!,
                        style: GoogleFonts.baumans(
                            fontSize: 21, fontWeight: FontWeight.bold),
                      ),
                    ),
                    CurrentLocation(
                      place: turfList.turfPlace!,
                      size: 15,
                    ),
                    turfList.turfInfo!.turfIsAvailable!
                        ? Text('Available',
                            style: GoogleFonts.baumans(
                                fontStyle: FontStyle.italic,
                                color: Colors.green,
                                fontSize: 18))
                        : Text(
                            'Not Available',
                            style: GoogleFonts.baumans(
                                fontStyle: FontStyle.italic,
                                color: Colors.red,
                                fontSize: 18),
                          ),
                    Row(
                      children: [
                        contentsText(
                          text: turfList.turfType!.turfFives! ? "5s" : "",
                        ),
                        w20,
                        contentsText(
                          text: turfList.turfType!.turfSevens! ? "7s" : "",
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                h30,
                Row(
                  children: [
                    const Icon(
                      CupertinoIcons.star_fill,
                      size: 17,
                      color: Color.fromARGB(255, 255, 129, 0),
                    ),
                    contentsText(
                      text: ' ${turfList.turfInfo!.turfRating!}',
                    ),
                  ],
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.bookmark_border,
                      color: lightGreen,
                      size: 30,
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
