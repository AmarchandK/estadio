import 'package:dio/dio.dart';
import 'package:estadio/constants/core_refactering/global_refactoring.dart';
import 'package:estadio/constants/url/url.dart';
import 'package:estadio/model/booking/booked_turf_response.dart';

class GetBookedTurfService {
  static final Dio dio = Dio(BaseOptions(baseUrl: Config.baseUrl));
  static Future<BookedResponse?> getBookedTurfs({required String id}) async {
    try {
      final Response response = await dio.get(Config.getBookedTurf + id);
      if (response.statusCode == 200) {
        return BookedResponse.fromJson(response.data);
      }
    } catch (e) {
      errorHandler(e);
    }
    return null;
  }
}
