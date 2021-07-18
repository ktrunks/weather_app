import 'package:flutter/material.dart';
import 'package:weather/model/weather.dart';

import 'api_end_points.dart';
import 'network_util.dart';

/// Wrapper around the open weather map api
/// https://openweathermap.org/current
class WeatherApiClient {
  final apiKey;
  final NetworkUtil netUtil;

  WeatherApiClient({required this.netUtil, this.apiKey})
      : assert(apiKey != null);

  Future<String> getCityNameFromLocation(
      {required double latitude, required double longitude}) async {
    return netUtil
        .get(
      Uri.https(
        baseUrl,
        weatherEndPoint,
      ),
      params: queryParamterLatLog(latitude, longitude),
    )
        .then((response) {
      debugPrint('response ---- ${response}');
      return response['name'];
    });
  }

  Future<Weather> getWeatherData(String cityName) async {
    return netUtil
        .get(
      Uri.https(
        baseUrl,
        weatherEndPoint,
      ),
      params: queryParamter(cityName),
    )
        .then((response) {
      return Weather.fromJson(response);
    });
  }

  Future<List<Weather>> getForecast(String cityName) async {
    return netUtil
        .get(
      Uri.https(
        baseUrl,
        weatherForecastEndPoint,
      ),
      params: queryParamter(cityName),
    )
        .then((response) {
      return Weather.fromForecastJson(response);
    });
  }

  Map<String, dynamic> queryParamter(String cityName) {
    Map<String, dynamic> data = {};
    data['q'] = cityName;
    data['appid'] = apiKey;
    return data;
  }

  Map<String, dynamic> queryParamterLatLog(double latitude, double longitude) {
    debugPrint('lat and long --- $latitude -- $longitude');
    Map<String, dynamic> data = {};
    data['lat'] = latitude.toString();
    data['lon'] = longitude.toString();
    data['appid'] = apiKey;
    return data;
  }
}
