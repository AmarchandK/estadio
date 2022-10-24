
  import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

Container timings
({amount, time, timetype}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
          border: Border.all(color: darkGreen, width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      width: 110,
      child: Column(
        children: [
          Text(timetype),
          const Divider(
            color: greyColor,
            endIndent: 1,
            indent: 1,
          ),
          Text(time),
          Text('₹ $amount'),
        ],
      ),
    );
  }