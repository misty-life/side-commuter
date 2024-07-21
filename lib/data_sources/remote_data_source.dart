import 'dart:convert';
import 'dart:io';

import 'package:commuter/keys.dart';
import 'package:commuter/models.dart/news_model.dart';
import 'package:commuter/models.dart/weather_model.dart';

class RemoteDataSource {

  static const String newsApiKey = NEWS_API_KEY;
  static const String weatherApiKey = WEATHER_API_KEY;
  static HttpClient client = HttpClient();

  bool isResponseSuccess(dynamic statusCode) {
    if (statusCode is String && statusCode == "ok") return true;
    if (statusCode is int && statusCode == 200) return true;

    return false;
  }

  Future<List<News>> getTopHeadLineNews({required String country}) async {
    Uri url = Uri.parse("https://newsapi.org/v2/top-headlines?country=$country&apiKey=$newsApiKey");
    HttpClientRequest request =  await client.getUrl(url);
    HttpClientResponse response = await request.close();
    String rawData = await response.transform(utf8.decoder).join();
    Map<String, dynamic> jsonData = jsonDecode(rawData);
    assert(isResponseSuccess(jsonData["status"]));

    List<News> newsList = [];
    for (var news in jsonData["articles"]) {
      newsList.add(News.fromJson(news));
    }
    return newsList;
  }

  Future<Weather> getCurrentWeatherByCoord({required double lat, required double lon}) async {
    Uri url = Uri.parse("https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$WEATHER_API_KEY");
    HttpClientRequest request =  await client.getUrl(url);
    HttpClientResponse response = await request.close();
    String rawData = await response.transform(utf8.decoder).join();
    Map<String, dynamic> jsonData = jsonDecode(rawData);
    assert(isResponseSuccess(jsonData["cod"]));

    Weather weather = Weather.fromJson(jsonData);
    return weather;
  }
}
