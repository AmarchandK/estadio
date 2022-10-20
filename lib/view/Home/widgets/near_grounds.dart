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
        color: grassColor,
        childPadding: 8,
        borderRadius: 10,
        child: Row(
          children: [
            Container(
              height: 110,
              width: 110,
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                        ),
                        child: FittedBox(
                          child: Text(
                            turfName,
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () => onFav,
                          icon: const Icon(
                            CupertinoIcons.bookmark_fill,
                            color: greenColor,
                            size: 20,
                          ))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(place),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Icon(
                            CupertinoIcons.star,
                            size: 20,
                            color: Color.fromARGB(255, 255, 129, 0),
                          ),
                          Text(
                            rating.toString(),
                          )
                        ],
                      )
                    ],
                  ),
                  ElevatedButton(
                    onPressed: toFucn,
                    style: ElevatedButton.styleFrom(
                      elevation: 10,
                      backgroundColor: greenColor,
                      minimumSize: const Size(300, 30),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: Text('BOOK'),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
