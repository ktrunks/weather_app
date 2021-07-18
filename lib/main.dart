import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/shared_preferences/weather_app_shared_preference.dart';
import 'package:weather/weather_app.dart';

import 'base/simple_bloc_observer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.black,
    ),
  );
  getSharedPreferenceObject();
}

void getSharedPreferenceObject() async {
  await SharedPreferences.getInstance().then((sharedPreference) {
    WeatherAppSharedPreferences().setSharedPreference(sharedPreference);
    Bloc.observer = SimpleBlocObserver();
    runApp(WeatherApp(sharedPreference));
  });
}
