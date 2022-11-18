import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:estadio/constants/core_refactering/global_refactoring.dart';
import 'package:estadio/constants/url/url.dart';
import 'package:estadio/model/home/home_response.dart';

class FavService {
  static final Dio dio = Dio(BaseOptions(baseUrl: Config.baseUrl));

  ///////////////////// Add to Fav ////////////////////////////////////
  static Future<AllResponse?> addToFav(AllResponse favResponse) async {
    try {
      final Response response =
          await dio.post(Config.addWishList, data: favResponse.toJson());

      return AllResponse.fromJson(response.data);
    } catch (e) {
      errorHandler(e);
      return null;
    }
  }

  ////////////////////// Get  Fav /////////////////////////////
  static Future<AllResponse?> getFav(String id) async {
    try {
      final Response response = await dio.get(Config.getWhishlist + id);
      log(' Fav Response ${response.data}');

      return AllResponse.fromJson(response.data);
    } catch (e) {
      errorHandler(e);
    }
    return null;
  }
}
