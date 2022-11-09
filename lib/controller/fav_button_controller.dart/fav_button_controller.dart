import 'package:estadio/constants/core_refactering/global_refactoring.dart';
import 'package:estadio/model/home/home_response.dart';
import 'package:estadio/services/fav_service.dart';
import 'package:get/state_manager.dart';

class FavButtonController extends GetxController {
  List<Datum> favTurfs = [];
  RxBool isFav(Datum datum) {
    return favTurfs.contains(datum).obs;
  }

  Future<void> getFav() async {
    String userId = await UserSecureStorage.getid();
    AllResponse? favResponse = await FavService.getFav(userId);

    if (favResponse != null) {
      favTurfs.clear();
      favTurfs.addAll(favResponse.data!);
    }
  }

  addFavToDb(Datum datum) async {
    String userId = await UserSecureStorage.getid();
    AllResponse favModel = AllResponse(
      userId: userId,
      data: [
        Datum(
          id: datum.id,
          turfName: datum.turfName,
          turfPlace: datum.turfPlace,
          turfMunicipality: datum.turfMunicipality,
          turfDistrict: datum.turfDistrict,
          turfLogo: datum.turfLogo,
          v: datum.v,
          turfCategory: TurfCategory(
              turfBadminton: datum.turfCategory!.turfBadminton,
              turfYoga: datum.turfCategory!.turfYoga,
              turfFootball: datum.turfCategory!.turfFootball,
              turfCricket: datum.turfCategory!.turfCricket),
          turfType: TurfType(
              turfFives: datum.turfType!.turfFives,
              turfSevens: datum.turfType!.turfSevens),
          turfAmenities: TurfAmenities(
            turfCafeteria: datum.turfAmenities!.turfCafeteria,
            turfDressing: datum.turfAmenities!.turfDressing,
            turfWashroom: datum.turfAmenities!.turfWashroom,
            turfWater: datum.turfAmenities!.turfWater,
            turfGallery: datum.turfAmenities!.turfGallery,
            turfParking: datum.turfAmenities!.turfParking,
          ),
          turfImages: TurfImages(
            turfImages1: datum.turfImages!.turfImages1,
            turfImages2: datum.turfImages!.turfImages2,
            turfImages3: datum.turfImages!.turfImages3,
          ),
          turfInfo: TurfInfo(
              turfIsAvailable: datum.turfInfo!.turfIsAvailable,
              turfMap: datum.turfInfo!.turfMap,
              turfRating: datum.turfInfo!.turfRating),
          turfPrice: TurfPrice(
            afternoonPrice: datum.turfPrice!.afternoonPrice,
            eveningPrice: datum.turfPrice!.eveningPrice,
            morningPrice: datum.turfPrice!.morningPrice,
          ),
          turfTime: TurfTime(
              timeAfternoonEnd: datum.turfTime!.timeAfternoonEnd,
              timeAfternoonStart: datum.turfTime!.timeAfternoonStart,
              timeEveningEnd: datum.turfTime!.timeEveningEnd,
              timeEveningStart: datum.turfTime!.timeEveningStart,
              timeMorningEnd: datum.turfTime!.timeMorningEnd,
              timeMorningStart: datum.turfTime!.timeMorningStart),
        )
      ],
    );
    await FavService.addToFav(favModel);
  }
}
