import 'package:estadio/constants/controler_initalize/controller_int.dart';
import 'package:estadio/view/splashscreen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'constants/colors.dart';
import 'controller/home/home_controller.dart';
import 'controller/home/location_fetch_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocationController.instance.getCurrentPosition();
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
        onInit: () => controllerInit(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.firaSansTextTheme(
              Theme.of(context).textTheme.apply(bodyColor: wColor)),
          iconTheme: const IconThemeData(color: wColor),
          primarySwatch: Colors.green,
          scaffoldBackgroundColor: bColor,
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: Colors.transparent),
        ),
        home: SplashScreen(),
      ),
    );
  }
}
