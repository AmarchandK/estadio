import 'package:dio/dio.dart';
import 'package:estadio/constants/core_refactering/global_refactoring.dart';
import 'package:estadio/model/home/home_response.dart';
import '../constants/url/url.dart';

class NearByService {
  static final Dio dio = Dio(BaseOptions(baseUrl: Config.baseUrl));
  static Future<AllResponse?> nearByTurf(
      {required String place, required String token}) async {
    try {
      final Response response = await dio.get(
        Config.nearbyGrounds + place,
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );
      return AllResponse.fromJson(response.data);
    } catch (e) {
      errorHandler(e);
      return AllResponse(status: false);
    }
  }
}
