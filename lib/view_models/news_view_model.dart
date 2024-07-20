
// ignore_for_file: prefer_final_fields

import 'package:commuter/models.dart/news_model.dart';
import 'package:commuter/repositories/news_repository.dart';
import 'package:flutter/material.dart';

class NewsViewModel extends ChangeNotifier {
  NewsRepository _newsRepository = NewsRepository();

  int _currentCountryIndex = 0;
  int get currentCountryIndex => _currentCountryIndex;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void setLoading(bool state) {
    _isLoading = state;
    notifyListeners();
  }

  List<String> countries = ["kr", "us"];
  List<News> newsList = [];

  Future<void> getTopHeadLinesByCountry(String country) async {
    setLoading(true);
    _currentCountryIndex = countries.indexOf(country);
    var result = await _newsRepository.getTopHeadLines(country: country);
    result.removeWhere((news) => news.title == "[Removed]");
    result.removeWhere((news) => news.urlToImage == null);
    newsList.clear();
    newsList.addAll(result);
    setLoading(false);
  }
}
