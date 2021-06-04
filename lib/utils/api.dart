import 'package:dio/dio.dart';
import 'package:wally/models/curated_feed.dart';

class Api {
  Dio dio = Dio();
  static String baseURL = 'https://api.pexels.com/v1/';
  static String curated = '$baseURL/curated?per_page=20';
  static String categorized = '$baseURL/curated?per_page=20';
  static String photo = '$baseURL/curated?per_page=20';
  static String apiKey =
      '563492ad6f917000010000016f217aea785c4286b080e3c552adc379';

  Future<CuratedFeed> getCurated(String url) async {
    var res = await dio
        .get(url,
            options: Options(headers: {'authorization': 'Bearer $apiKey'}))
        .catchError((e) {
      throw (e);
    });
    CuratedFeed feed;
    if (res.statusCode == 200) {
      var json = res.data;
      feed = CuratedFeed.fromJson(json);
    } else {
      throw ('Error ${res.statusCode}');
    }
    return feed;
  }
}
