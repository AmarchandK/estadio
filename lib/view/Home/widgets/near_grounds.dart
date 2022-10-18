import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_cards/flutter_custom_cards.dart';

import '../../../constants/sizes.dart';
import 'current_location.dart';

class GroundCards extends StatelessWidget {
  const GroundCards({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      color: grassColor,
      childPadding: 10,
      borderRadius: 10,
      child: Row(
        children: [
          Container(
            height: 110,
            width: 110,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/ground.jpg',
                  ),
                  fit: BoxFit.fill),
              borderRadius: BorderRadius.all(
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
                    const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        'Golazo',
                        style: TextStyle(fontSize: 21),
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
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
                    const CurrentLocation(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Icon(
                          CupertinoIcons.star,
                          size: 20,
                          color: Color.fromARGB(255, 255, 129, 0),
                        ),
                        Text(
                          '4.5',
                        )
                      ],
                    )
                  ],
                ),
                ElevatedButton(
                  onPressed: () {},
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
      ),
    );
  }
}
