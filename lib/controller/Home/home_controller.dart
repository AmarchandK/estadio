import 'dart:developer';

import 'package:estadio/model/Home/home_response.dart';
import 'package:estadio/services/home_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class HomeController extends ChangeNotifier {
  int activeIndex = 0;
  final List<Datum> nearGrounds = [];
  static late String turfLocality;

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

  Future homeFetch() async {
    const storage = FlutterSecureStorage();
    final String? token = await storage.read(key: 'tokenKey');
    final HomeResponse? homeResponse =
        await NearByService.nearByFetch(place: "Malappuram", token: token!);
    if (homeResponse != null && homeResponse.status == true) {
      nearGrounds.clear();
      nearGrounds.addAll(homeResponse.data!);
    }
    log(nearGrounds[0].turfName.toString());
  }
}
