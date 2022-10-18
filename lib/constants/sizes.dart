import 'package:flutter/material.dart';

const h20 = SizedBox(height: 20);
const h10 = SizedBox(height: 10);
const h30 = SizedBox(height: 30);
const w10 = SizedBox(width: 10);

const greenColor = Color.fromARGB(255, 156, 231, 15);
const redColor = Color.fromARGB(255, 250, 108, 108);
const wColor = Color.fromARGB(255, 255, 255, 255);
const bColor = Colors.black;
const greyColor = Color.fromARGB(255, 99, 96, 96);
const grassColor =  Color.fromARGB(141, 76, 175, 79);
widthSize(context) {
  return MediaQuery.of(context).size.width;
}

heightSize(context) {
  return MediaQuery.of(context).size.height;
}
