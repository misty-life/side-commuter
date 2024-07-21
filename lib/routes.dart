// ignore_for_file: constant_identifier_names

import 'package:commuter/views/home_view.dart';
import 'package:commuter/views/music_recommendation_view.dart';
import 'package:commuter/views/news_view.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String HOME_VIEW = "home_view";
  static const String NEWS_VIEW = "news_view";
  static const String MUSIC_RECOMMENDATION_VIEW = "music_recommendation_view";
}

Map<String, WidgetBuilder> routingMap = {
  AppRoutes.HOME_VIEW: (context) => const HomeView(),
  AppRoutes.NEWS_VIEW: (context) => const NewsView(),
  AppRoutes.MUSIC_RECOMMENDATION_VIEW: (context) => const MusicRecommendationView(),
};