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
  }) : super(key: key);
  final String img;
  final String turfName;
  final void Function()? onFav;
  final double rating;
  final String place;
  final void Function() toFucn;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
        color: darkGreen,
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  FittedBox(
                    child: Text(
                      turfName,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  Row(
                    children: [
                      const Text('Rating'),
                      w10,
                      const Icon(
                        CupertinoIcons.star,
                        size: 15,
                        color: Color.fromARGB(255, 255, 129, 0),
                      ),
                      w10,
                      Text(
                        rating.toString(),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(place),
                      const Spacer(),
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
                onPressed: () => onFav,
                icon: const Icon(
                  CupertinoIcons.bookmark_fill,
                  color: lightGreen,
                  size: 20,
                ))
          ],
        ));
  }
}
