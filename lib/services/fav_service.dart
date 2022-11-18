import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:estadio/constants/core_refactering/global_refactoring.dart';
import 'package:estadio/constants/url/url.dart';
import 'package:estadio/model/home/home_response.dart';

class FavService {
  static final Dio dio = Dio(BaseOptions(baseUrl: Config.baseUrl));

  ///////////////////// Add to Fav ////////////////////////////////////
  static Future<String?> addToFav(AllResponse favResponse) async {
    try {
      final Response response =
          await dio.post(Config.addWishList, data: favResponse.toJson());
      if (response.statusCode == 200) {
        final String message = response.data['message'];
        return message;
      }
    } catch (e) {
      errorHandler(e);
    }
    return null;
  }

  ////////////////////// Get  Fav /////////////////////////////
  static Future<AllResponse?> getFav(String id) async {
    try {
      final Response response = await dio.get(Config.getWhishlist + id);
      if (response.statusCode == 200) {
        return AllResponse.fromJson(response.data);
      }
    } catch (e) {
      errorHandler(e);
    }
    return null;
  }
  /////////////////////////////////////

  /////////////////////// Delete Fav ////////////////////////
  static Future<bool?> deleteFav(String id) async {
    try {
      final Response response = await dio.delete(Config.deleteFav + id);
      log(response.data.toString());
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      errorHandler(e);
    }
    return null;
  }
}
