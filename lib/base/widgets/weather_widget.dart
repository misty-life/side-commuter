// ignore_for_file: non_constant_identifier_names

import 'package:commuter/models.dart/weather_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget WeatherHome({
  required BuildContext context,
  required Weather weatherModel,
}) {
  return Container(
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