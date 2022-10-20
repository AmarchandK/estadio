import 'package:flutter/material.dart';

const h20 = SizedBox(height: 20);
const h10 = SizedBox(height: 10);
const h30 = SizedBox(height: 30);
const w10 = SizedBox(width: 10);
const w20 = SizedBox(width: 20);

widthSize(context) {
  return MediaQuery.of(context).size.width;
}

heightSize(context) {
  return MediaQuery.of(context).size.height;
}
