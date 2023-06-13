import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/models/NewsResponse.dart';
import 'package:news/models/SourceResponse.dart';
import 'package:news/shared/components/constant.dart';

class ApiManager {
  static Future<SourceResponse> getSources({String category="",String languageCode=""}) async {
    Uri URL = Uri.https(BASE_URL, "/v2/top-headlines/sources",
        {"apiKey": API_KEY, "category": category,"language":languageCode});
    var response = await http.get(URL);
    var jsonResponse = jsonDecode(response.body);
    SourceResponse sourceResponse = SourceResponse.fromJson(jsonResponse);
    return sourceResponse;
  }

  static Future<NewsResponse> getNewsData({String sourceId="",String searchArticle="",String languageCode=""}) async {
    Uri URL = Uri.https(BASE_URL, "/v2/everything", {
      "apiKey": API_KEY,
      "sources": sourceId,
      "q":searchArticle,
      "language":languageCode,
    });
    var response = await http.get(URL);
    var jsonResponse = jsonDecode(response.body);
    NewsResponse newsResponse = NewsResponse.fromJson(jsonResponse);
    return newsResponse;
  }

}
