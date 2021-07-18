import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:weather/base/progress/progress_bloc.dart';
import 'package:weather/base/progress/progress_event.dart';
import 'package:weather/ui/home/weather_repository.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeBlocEvent, HomeBlocState> {
  final WeatherRepository weatherApiClient;
  final String city;

  HomeBloc(this.weatherApiClient, this.city) : super(DefaultState()) {
    fetchWeatherWithLocation();
  }

  @override
  HomeBlocState get initialState => DefaultState();

  /// scaffold which is used for toast or context
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Stream<HomeBlocState> mapEventToState(HomeBlocEvent event) async* {
    if (event is ProgressIndicatorEvent) {
    } else if (event is WeatherLoadedEvent) {
      yield WeatherLoaded(weather: event.weather);
    }
  }

  fetchWeatherWithLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      _showLocationDeniedDialog();
      return;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        _showLocationDeniedDialog();
        return;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      _showLocationDeniedDialog();
      return;
    }
    BlocProvider.of<ProgressBloc>(scaffoldKey.currentState!.context)
        .add(ProgressEvent());
    Geolocator.getCurrentPosition().then((value) {
      weatherApiClient
          .getWeather(city,
              latitude: value.latitude, longitude: value.longitude)
          .then((value) {
        BlocProvider.of<ProgressBloc>(scaffoldKey.currentState!.context)
            .add(ProgressEvent());

        this.add(WeatherLoadedEvent(weather: value));
      });
    });
  }

  void _showLocationDeniedDialog() {
    debugPrint('show dialog permission denied');
    showDialog(
        context: scaffoldKey.currentState!.context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: Text('Location is disabled !',
                style: TextStyle(color: Colors.black)),
            actions: <Widget>[
              FlatButton(
                child: Text(
                  'Enable!',
                  style: TextStyle(color: Colors.green, fontSize: 16),
                ),
                onPressed: () {
                  openAppSettings();
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
