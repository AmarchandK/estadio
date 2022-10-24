
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class DiscriptionChipWidget extends StatelessWidget {
  const DiscriptionChipWidget({
    Key? key,
    required this.value,
    required this.item,
    required this.icon,
  }) : super(key: key);
  final bool value;
  final String item;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return value
        ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: ChoiceChip(
                clipBehavior: Clip.hardEdge,
                selectedColor: darkGreen,
                padding: const EdgeInsets.all(2),
                label: Text(item),
                avatar: Icon(icon),
                selected: true),
          )
        : const SizedBox();
  }
}