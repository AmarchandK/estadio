import 'package:dio/dio.dart';
import 'package:estadio/constants/core_refactering/global_refactoring.dart';
import 'package:estadio/constants/url/url.dart';
import 'package:estadio/model/booking/allready_booked_turf_response.dart';

import '../model/booking/booking.dart';

class BookTurfService {
  static final Dio dio = Dio(BaseOptions(baseUrl: Config.baseUrl));

  static Future<AlreadyBookedResponse?> getBookedTurfs(
      {required String id}) async {
    try {
      final Response response = await dio.get(Config.getBookedTurf + id);
      if (response.statusCode == 200) {
        return AlreadyBookedResponse.fromJson(response.data);
      }
    } catch (e) {
      errorHandler(e);
    }
    return null;
  }

  static Future<BookedResponse?> bookTurf(
      {required BookedRequest model}) async {
    try {
      final Response response =
          await dio.post(Config.bookTurf, data: model.toJson());
      if (response.statusCode == 200) {
        BookedResponse.fromJson(response.data);
      }
    } catch (e) {
      errorHandler(e);
    }
    return null;
  }
}
