// ignore_for_file: prefer_final_fields

import 'package:commuter/base/utilities/weather_utility.dart';
import 'package:commuter/models.dart/weather_model.dart';
import 'package:commuter/repositories/weather_repository.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier{
  WeatherRepository _weatherRepository = WeatherRepository();
  late Weather currentWeather;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void setLoading(bool state) {
    _isLoading = state;
    notifyListeners();
  }

  void getCurrentWeather() async {
    setLoading(true);
    Map<String, double> coord = await getCurrentCoord();
    assert(coord["lat"] != null && coord["lon"] != null);
    
    currentWeather = await _weatherRepository.getCurrentWeather(lat: coord["lat"]!, lon: coord["lon"]!);
    setLoading(false);
  }
}