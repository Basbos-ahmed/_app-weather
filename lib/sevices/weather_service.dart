import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/model/weather_model.dart';

class WeatherService {
  String baseUrl =
      'http://api.weatherapi.com/v1/current.json?key=1fc48d90bab844d7a03201905221608&q=London&aqi=no';
  String apiKey = '1fc48d90bab844d7a03201905221608';

  Future<WeatherModel> getWeather({required String cityName}) async {
    Uri url = Uri.parse('$baseUrl/current.json?Key=$apiKey&q=$cityName&days=7');

    http.Response response = await http.get(url);

    Map<String, dynamic> data = jsonDecode(response.body);

    WeatherModel weather = WeatherModel.fromJson(data);

    return weather;
  }
}
