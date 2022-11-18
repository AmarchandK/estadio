import 'package:estadio/constants/core_refactering/global_refactoring.dart';
import 'package:estadio/services/all_turf_service.dart';
import 'package:estadio/services/nearby_serevice.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import '../../model/home/home_response.dart';

class HomeController extends ChangeNotifier {
  static final HomeController _singleton = HomeController.instance();
  factory HomeController() {
    return _singleton;
  }
  HomeController.instance();

  onInit() async {
    await nearTurfFech();
    await allTurfFetch();
    listAdd();
    categoryAllAdd();
  }

  static late RxString turfLocality;

  //////// turf lists////////////////
  final List<Datum> nearGrounds = [];
  final List<Datum> allTurf = [];
  ///////////////////////////////////

///////category turfs //////////////////
  final List<Datum> cricketList = [];
  final List<Datum> footballList = [];
  final List<Datum> badmintonList = [];
  final List<Datum> yoga = [];
  List<List<Datum>> categoryAllList = [];
  ////////////////////////////////////////////

///////////// carolse ists ////////////////////////
  final List<String> imgUrls = [
    'assets/football.jpg',
    'assets/badminton.jpg',
    'assets/cricket.webp',
    'assets/yoga.jpg',
  ];
  final List<String> carosleTittle = [
    'Football',
    'Badminton',
    'Cricket',
    'Yoga',
  ];
  int activeIndex = 0;
  //////////////////////////

  bool homeIsLoading = true;
  void onLoding() {
    homeIsLoading = !homeIsLoading;
    notifyListeners();
  }
  ///////////////////////////////////////////////////

///////////////// carousle image change//////////////
  void carousleChange(index) {
    activeIndex = index;
    notifyListeners();
  }
/////////////////////////////////////////////////////

/////////////////// turf cateogory add ///////////////
  void listAdd() {
    cricketList.clear();
    footballList.clear();
    badmintonList.clear();
    yoga.clear();

    for (Datum element in allTurf) {
      if (element.turfCategory!.turfCricket!) {
        cricketList.add(element);
      }
      if (element.turfCategory!.turfFootball!) {
        footballList.add(element);
      }
      if (element.turfCategory!.turfBadminton!) {
        badmintonList.add(element);
      }
      if (element.turfCategory!.turfYoga!) {
        yoga.add(element);
      }
    }
  }

  void categoryAllAdd() {
    categoryAllList.clear();
    List<Datum> categories(int i) {
      switch (i) {
        case 1:
          return footballList;
        case 2:
          return badmintonList;
        case 3:
          return cricketList;
        default:
          return yoga;
      }
    }

    for (int i = 1; i <= 4; i++) {
      categoryAllList.add(categories(i));
    }
  }

  ////////////////////////////////////////////////////////

/////////////// Near bu turf fetch //////////////////////////
  Future<void> nearTurfFech() async {
    onLoding();
    final String? token = await UserSecureStorage.getToken();

    final AllResponse? homeResponse =
        await NearByService.nearByTurf(place: "Malappuram", token: token!);
    if (homeResponse != null && homeResponse.status == true) {
      nearGrounds.clear();
      nearGrounds.addAll(homeResponse.data!);
    }
    onLoding();
    notifyListeners();
  }
//////////////////////////////////////////////////////////

///////////////All turf fetch //////////////////////////////
  Future<void> allTurfFetch() async {
    onLoding();
    final String? token = await UserSecureStorage.getToken();
    final AllResponse? homeResponse =
        await AllTurfService.allTurf(token: token!);
    if (homeResponse != null && homeResponse.status == true) {
      allTurf.clear();
      allTurf.addAll(homeResponse.data!);
    }
    onLoding();
    notifyListeners();
  }

  Future<List<Datum>> searchAsign() async {
    await allTurfFetch();
    notifyListeners();
    return allTurf;
  }
}
/////////////////////////////////////////////////////////////////
