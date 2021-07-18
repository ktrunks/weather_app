import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/base/base_screen.dart';
import 'package:weather/base/error/error_bloc.dart';
import 'package:weather/base/progress/progress_bloc.dart';
import 'package:weather/route/rtn_routes.dart';
import 'package:weather/shared_preferences/weather_app_shared_preference.dart';
import 'package:weather/ui/home/home_state.dart';
import 'package:weather/util/color.dart';
import 'package:weather/util/style.dart';
import 'package:weather/widgets/weather_widget.dart';

import 'home_bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  //Used to add events in to Bloc
  late HomeBloc _homeBloc;
  late ErrorBloc _errorBlocSink;
  late ProgressBloc _progressBlocSink;

  @override
  void dispose() {
    super.dispose();
    _homeBloc.close();
    _errorBlocSink.close();
    _progressBlocSink.close();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    _homeBloc = BlocProvider.of<HomeBloc>(context);
    _errorBlocSink = BlocProvider.of<ErrorBloc>(context);
    _progressBlocSink = BlocProvider.of<ProgressBloc>(context);
    return BaseScreen(screenWidget: body(), scaffoldKey: _homeBloc.scaffoldKey);
  }

  Widget body() {
    var height;
    height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;

    return Container(
      // height: height,
      child: BlocBuilder<HomeBloc, HomeBlocState>(
        builder: (context, state) {
          debugPrint('current state --- ${state}');
          if (state is WeatherLoaded) {
            return Column(
              children: [
                _homeBloc.city == ''
                    ? AppBar(
                        title: Text(('Weather App')),
                      )
                    : Container(),
                WeatherWidget(
                  weather: state.weather,
                ),
                _homeBloc.city == ''
                    ? Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          FlatButton(
                            color: backgroundColor,
                            child: Text(
                              "Pinned City Weather ",
                              style: textStyle16White,
                            ),
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, WeatherAppRoutes.pinnedCityDetails,
                                  arguments: WeatherAppSharedPreferences()
                                      .getPinnedCity());
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      )
                    : Container(),
              ],
            );
          } else if (state is WeatherError || state is WeatherEmpty) {
            String errorText = 'There was an error fetching weather data';
            if (state is WeatherError) {
              if (state.errorCode == 404) {
                errorText = 'We have trouble fetching weather for';
              }
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.error_outline,
                  color: Colors.redAccent,
                  size: 24,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  errorText,
                  style: textStyle16White,
                ),
                FlatButton(
                  child: Text(
                    "Try Again",
                    style: textStyle16White,
                  ),
                  onPressed: _homeBloc.fetchWeatherWithLocation(),
                )
              ],
            );
          } else
            return Container();
        },
      ),
    );
  }

  onClickOfDelete(Object data, Object listData) {}

  void onClickOfAddStore() {}

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
