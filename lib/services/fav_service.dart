import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:estadio/constants/core_refactering/global_refactoring.dart';
import 'package:estadio/constants/url/url.dart';
import 'package:estadio/model/home/home_response.dart';

class FavService {
  static final Dio dio = Dio(BaseOptions(baseUrl: Config.baseUrl));

  ///////////////////// Add to Fav ////////////////////////////////////
  static Future addToFav(AllResponse favResponse) async {
    log('1');
    try {
      log(favResponse.toJson().toString());
      final Response response =
          await dio.post(Config.addWishList, data: favResponse.toJson());
      log('2');
      log(response.statusMessage!.toString());
      return AllResponse.fromJson(response.data);
    } catch (e) {
      if (e is DioError) {
        log(e.message.toString());
      }
      errorHandler(e);
      return null;
    }
  }

  ////////////////////// Get  Fav /////////////////////////////
  static Future<AllResponse?> getFav(String id) async {
    log(Config.getWhishlist + id);
    try {
      final Response response = await dio.get(Config.getWhishlist + id);
      log(response.data);
      return AllResponse.fromJson(response.data);
    } catch (e) {
      log('exeption during fav fetch $e');
      errorHandler(e);
    }
    return null;
  }
}
