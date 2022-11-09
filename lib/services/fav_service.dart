

import 'package:dio/dio.dart';
import 'package:estadio/constants/core_refactering/global_refactoring.dart';
import 'package:estadio/constants/url/url.dart';
import 'package:estadio/model/home/home_response.dart';

class FavService {
  static final Dio dio = Dio(BaseOptions(baseUrl: Config.baseUrl));

  ///////////////////// Add to Fav ////////////////////////////////////
  static Future addToFav(AllResponse favResponse) async {
    try {

      final Response response =
          await dio.post(Config.addWishList, data: favResponse.toJson());

      return AllResponse.fromJson(response.data);
    } catch (e) {
      if (e is DioError) {

      }
      errorHandler(e);
      return null;
    }
  }

  ////////////////////// Get  Fav /////////////////////////////
  static Future<AllResponse?> getFav(String id) async {

    try {
      final Response response = await dio.get(Config.getWhishlist + id);

      return AllResponse.fromJson(response.data);
    } catch (e) {
      errorHandler(e);
    }
    return null;
  }
}
