import 'package:flutter/cupertino.dart';

import '../../../constants/sizes.dart';

class Search extends StatelessWidget {
  const Search({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      placeholder: 'Ground Name',
      decoration: BoxDecoration(
        color: CupertinoColors.extraLightBackgroundGray,
        border:
            Border.all(color: CupertinoColors.lightBackgroundGray, width: 5),
        borderRadius: BorderRadius.circular(10),
      ),
      cursorColor: greenColor,
      onChanged: (value) {},
      prefix: const Icon(CupertinoIcons.search),
      suffix: const Icon(CupertinoIcons.xmark_circle),
    );
  }
}
