import 'package:dio/dio.dart';
import 'package:estadio/constants/global_refactoring.dart';
import 'package:estadio/constants/url.dart';
import 'package:estadio/model/Home/home_response.dart';

class AllTurfService {
  static final Dio dio = Dio(BaseOptions(baseUrl: Config.baseUrl));
  static Future<AllResponse?> allTurf({required String token}) async {
    try {
      final Response response = await dio.get(
        Config.allTurf,
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
