import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/models/NewsResponse.dart';
import 'package:news/models/SourceResponse.dart';
import 'package:news/shared/components/constant.dart';

class ApiManager {
  static Future<SourceResponse> getSources(String category) async {
    Uri URL = Uri.https(BASE_URL, "/v2/top-headlines/sources",
        {"apiKey": API_KEY, "category": category});
    var response = await http.get(URL);
    var jsonResponse = jsonDecode(response.body);
    SourceResponse sourceResponse = SourceResponse.fromJson(jsonResponse);
    return sourceResponse;
  }

  static Future<NewsResponse> getNewsData(String sourceId) async {
    Uri URL = Uri.https(BASE_URL, "/v2/everything", {
      "apiKey": API_KEY,
      "sources": sourceId,
    });
    var response = await http.get(URL);
    var jsonResponse = jsonDecode(response.body);
    NewsResponse newsResponse = NewsResponse.fromJson(jsonResponse);
    return newsResponse;
  }

}
