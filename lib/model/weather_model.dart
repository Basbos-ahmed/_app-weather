import 'dart:convert';

import 'package:flutter/foundation.dart';

class WeatherModel {
  final String? date;
  final double? temp;
  final double? maxTemp;
  final double? minTemp;
  final String? weatherStateName;

  WeatherModel(
      {required this.date,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherStateName});

  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data["forecast"]?["forecastday"]?["day"]?[0]["astro"];
    print(data);

    return WeatherModel(
        date: data['location']['localtime'],
        temp: jsonData?['avgtemp_c'],
        maxTemp: jsonData?['maxtemp_c'],
        minTemp: jsonData?['mintemp_c'],
        weatherStateName: jsonData?['condition']?['text']);
  }

  @override
  String toString() {
    return 'tem = $temp minTemp = $minTemp date = $date';
  }
}
