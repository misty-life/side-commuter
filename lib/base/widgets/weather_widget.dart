// ignore_for_file: non_constant_identifier_names

import 'package:commuter/models.dart/weather_model.dart';
import 'package:flutter/material.dart';

Widget WeatherHome({
  required BuildContext context,
  required Weather weatherModel,
}) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.9,
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.deepPurpleAccent),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
      children: [
        Image.network(
          "https://openweathermap.org/img/wn/${weatherModel.icon}@4x.png",
          width: MediaQuery.of(context).size.width * 0.5,
        ),
        Text("날씨 : ${weatherModel.weahter}"),
        Text("설명 : ${weatherModel.description}"),
        Text("현재 기온 : ${weatherModel.temp}"),
        Text("체감 온도 : ${weatherModel.feelLike}"),
        Text("최저 ~ 최대 기온 : ${weatherModel.tempMin} ~ ${weatherModel.tempMax}"),
        Text(weatherModel.localName),
      ],
    ),
  );
}