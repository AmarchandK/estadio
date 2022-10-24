import 'package:estadio/view/Home/widgets/current_location.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_cards/flutter_custom_cards.dart';
import '../../../constants/colors.dart';
import '../../../constants/sizes.dart';

class GroundCards extends StatelessWidget {
  const GroundCards({
    Key? key,
    required this.img,
    required this.turfName,
    this.onFav,
    required this.rating,
    required this.place,
    required this.toFucn,
    required this.isAvailable,
    required this.sevens,
    required this.fives,
  }) : super(key: key);
  final String img;
  final String turfName;
  final void Function()? onFav;
  final double rating;
  final String place;
  final void Function() toFucn;
  final bool isAvailable;
  final bool sevens;
  final bool fives;

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
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                      img,
                    ),
                    fit: BoxFit.fill),
                borderRadius: const BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
            ),
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
                        turfName,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                    CurrentLocation(
                      place: place,
                      size: 15,
                    ),
                    isAvailable
                        ? const Text('Available',
                            style: TextStyle(color: Colors.green))
                        : const Text('Not Available',
                            style: TextStyle(color: Colors.red)),
                    Row(
                      children: [
                        Text(fives ? "5s" : ""),
                        w20,
                        Text(sevens ? "7s" : "")
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
                      ' $rating',
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
