import 'package:flutter/foundation.dart';

class HomeController extends ChangeNotifier {
  int activeIndex = 0;

  final List<String> imgUrls = [
    'assets/football.jpg',
    'assets/badminton.jpg',
    'assets/cricket.webp',
    'assets/yoga.jpg',
    'assets/volleyball.jpg'
  ];
  final List<String> carosleTittle = [
    'Football',
    'Badminton',
    'Cricket',
    'Yoga',
    'Coming Soon'
  ];
  void carousleChange(index) {
    activeIndex = index;
    notifyListeners();
  }
}
