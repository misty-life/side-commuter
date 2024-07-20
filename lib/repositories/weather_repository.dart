// ignore_for_file: prefer_final_fields

import 'package:commuter/data_sources/remote_data_source.dart';
import 'package:commuter/models.dart/weather_model.dart';

class WeatherRepository {
  RemoteDataSource _remoteDataSource = RemoteDataSource();
  
  Future<Weather> getCurrentWeather() async {
    Weather currentWeather = await _remoteDataSource.getCurrentWeather();
    return currentWeather;
  }
}