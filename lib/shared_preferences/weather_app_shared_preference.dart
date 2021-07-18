import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// shared preference
class WeatherAppSharedPreferences {
  ///
  factory WeatherAppSharedPreferences() => _instance;

  ///
  static final WeatherAppSharedPreferences _instance =
      WeatherAppSharedPreferences.internal();

  ///
  WeatherAppSharedPreferences.internal();

  ///
  late SharedPreferences _prefs;

  /// set share preference object
  void setSharedPreference(SharedPreferences _prefs) {
    this._prefs = _prefs;
  }

  ///
  SharedPreferences getSharePreference() => _prefs;

  List getPinnedCity() {
    if (_prefs.containsKey('pinned_city')) {
      debugPrint(
          'pinned city data --- ${jsonDecode(_prefs.getString('pinned_city') ?? '')}');
      List city = jsonDecode(_prefs.getString('pinned_city') ?? '[]');
      debugPrint('pinned city data --- ${city}');

      return city;
    } else
      return ['Kuala Lumpur ', 'George Town', 'Johor Bahru'];
  }

  void updatePinnedCity(List city) {
    _prefs.setString('pinned_city', jsonEncode(city));
  }
}
