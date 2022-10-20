import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:estadio/constants/global_refactoring.dart';
import 'package:estadio/model/Home/home_response.dart';
import '../constants/url.dart';

class NearByService {
  static final Dio dio = Dio(BaseOptions(baseUrl: Config.baseUrl));
  static Future<HomeResponse?> nearByFetch(
      {required String place, required String token}) async {
    log('Function Called');
    log(Config.baseUrl + Config.nearbyGrounds + place);
    log(token.toString());
    try {
      final Response response = await dio.get(Config.nearbyGrounds + place,
          options: Options(headers: {"Authorization": "Bearer $token"}));
      log("before if ${response.statusCode}");
      return HomeResponse.fromJson(response.data);
    } catch (e) {
      log("exeption");
      errorHandler(e);
      return HomeResponse(status: false);
    }
  }
}
