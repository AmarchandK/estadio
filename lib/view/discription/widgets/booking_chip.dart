import 'package:flutter/material.dart';

import '../../../model/home/home_response.dart';

class BookingChip extends StatelessWidget {
  const BookingChip({
    Key? key,
    required this.data,
    required this.heading,
    required this.headingIcon,
    required this.price,
  }) : super(key: key);
  final Datum data;
  final String heading;
  final IconData headingIcon;
  final List price;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(
            headingIcon,
          ),
          title: Text(
            heading,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w900,
            ),
          ),
          trailing: Text(
            heading == 'Morning'
                ? '₹${data.turfPrice!.morningPrice!}'
                : (heading == 'Afternoon'
                    ? '₹${data.turfPrice!.afternoonPrice!}'
                    : '₹${data.turfPrice!.eveningPrice!}'),
            style: TextStyle(
              fontSize: 20,
              color: Colors.amber[300],
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Wrap(
          children: List.generate(
            price.length,
            (index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.green),
                  color: Colors.green.withOpacity(0.4),
                ),
                height: 50,
                width: 100,
                child: Center(
                  child: Text(
                    price[index],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
