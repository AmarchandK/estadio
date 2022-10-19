import 'package:estadio/view/Discription/discriptiom.dart';
import 'package:estadio/view/Grounds/list_of_grounds.dart';
import 'package:estadio/view/Navigation/botttom_nav.dart';
import 'package:estadio/constants/controller_int.dart';
import 'package:estadio/controller/Home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'constants/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeController(),
        )
      ],
      child: GetMaterialApp(
          onInit: () => onInit(),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              textTheme: GoogleFonts.concertOneTextTheme(
                  Theme.of(context).textTheme.apply(bodyColor: wColor)),
              iconTheme: const IconThemeData(color: wColor),
              primarySwatch: Colors.green,
              scaffoldBackgroundColor: bColor,
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  backgroundColor: Colors.transparent)),
          home: const BottomNav()),
    );
  }
}
