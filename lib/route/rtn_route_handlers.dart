import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/base/error/error_bloc.dart';
import 'package:weather/base/progress/progress_bloc.dart';
import 'package:weather/network/api_end_points.dart';
import 'package:weather/network/network_util.dart';
import 'package:weather/network/weather_api_client.dart';
import 'package:weather/ui/add_to_pinned_city.dart';
import 'package:weather/ui/home/home_bloc.dart';
import 'package:weather/ui/home/home_screen.dart';
import 'package:weather/ui/home/weather_repository.dart';
import 'package:weather/ui/pinned_city_detail.dart';

/// root application launch
final Handler rootHandler =
    Handler(handlerFunc: (context, params) => getHomeScreen() //getHome()
        );

Widget getHomeScreen() {
  return MultiBlocProvider(
    providers: [
      BlocProvider<HomeBloc>(
        create: (_) => HomeBloc(
            WeatherRepository(
                weatherApiClient: WeatherApiClient(
              netUtil: NetworkUtil(),
              apiKey: weather_api_key,
            )),
            ''),
      ),
      BlocProvider<ErrorBloc>(
        create: (_) => ErrorBloc(),
      ),
      BlocProvider<ProgressBloc>(
        create: (_) => ProgressBloc(),
      ),
    ],
    child: HomeScreen(),
  );
}

final Handler pinnedCityDetailsHandler =
    Handler(handlerFunc: (context, params) {
  var obj = ModalRoute.of(context!)!.settings.arguments;
  return PinnedCityDetails(obj as List);
} //getHome()
        );

final Handler addToPinnedCityHandler = Handler(handlerFunc: (context, params) {
  var obj = ModalRoute.of(context!)!.settings.arguments;
  return AddToPinnedCity(
    obj as List,
  );
} //getHome()
    );
