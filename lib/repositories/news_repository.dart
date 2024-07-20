// ignore_for_file: prefer_final_fields

import 'package:commuter/data_sources/remote_data_source.dart';
import 'package:commuter/models.dart/news_model.dart';

class NewsRepository {
  RemoteDataSource _remoteDataSource = RemoteDataSource();

  Future<List<News>> getTopHeadLines({required String country}) async {
    List<News> headLines = await _remoteDataSource.getTopHeadLineNews(country: country);
    return headLines;
  }
}