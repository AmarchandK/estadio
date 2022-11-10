import 'package:estadio/constants/core_refactering/global_refactoring.dart';
import 'package:flutter/material.dart';

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
                selectedColor: Colors.lightGreen[800],
                padding: const EdgeInsets.all(2),
                label: contentsText(text: item, size: 16),
                avatar: Icon(icon),
                selected: true),
          )
        : const SizedBox();
  }
}
