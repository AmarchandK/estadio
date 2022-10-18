
import 'package:flutter/cupertino.dart';

class CurrentLocation extends StatelessWidget {
  const CurrentLocation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(CupertinoIcons.location_solid),
        Text('Calicut,Kerala')
      ],
    );
  }
}
