import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:estadio/constants/global_refactoring.dart';
import 'package:estadio/model/Home/home_response.dart';
import '../constants/url.dart';

class NearByService {
  static final Dio dio = Dio(BaseOptions(baseUrl: Config.baseUrl));
  static Future<AllResponse?> nearByFetch(
      {required String place, required String token}) async {
    try {
      final Response response = await dio.get(Config.nearbyGrounds + place,
          options: Options(headers: {"Authorization": "Bearer $token"}));
      return AllResponse.fromJson(response.data);
    } catch (e) {
      errorHandler(e);
      return AllResponse(status: false);
    }
  }
}
