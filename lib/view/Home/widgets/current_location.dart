import 'package:flutter/cupertino.dart';

class CurrentLocation extends StatelessWidget {
  const CurrentLocation({
    required this.place,
    Key? key,
    required this.size,
  }) : super(key: key);
  final String place;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Row(
        children: [
          Icon(
            CupertinoIcons.location_solid,
            size: size,
          ),
          Text(
            place,
            overflow: TextOverflow.fade,
            softWrap: true,
          ),
        ],
      ),
    );
  }
}
