import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/base/error/error_bloc.dart';
import 'package:weather/base/progress/progress_bloc.dart';
import 'package:weather/network/api_end_points.dart';
import 'package:weather/network/network_util.dart';
import 'package:weather/network/weather_api_client.dart';
import 'package:weather/route/rtn_routes.dart';
import 'package:weather/util/color.dart';
import 'package:weather/util/style.dart';

import 'home/home_bloc.dart';
import 'home/home_screen.dart';
import 'home/weather_repository.dart';

class PinnedCityDetails extends StatefulWidget {
  const PinnedCityDetails(this.city, {Key? key}) : super(key: key);

  final List city;

  @override
  _PinnedCityDetailsState createState() => _PinnedCityDetailsState();
}

class _PinnedCityDetailsState extends State<PinnedCityDetails>
    with TickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: widget.city.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: backgroundColor,
          onPressed: () {
            Navigator.pushNamed(context, WeatherAppRoutes.addToPinnedCity,
                    arguments: widget.city)
                .then((value) {
              debugPrint('value ---- ${value}');
              debugPrint(' old value ---- ${widget.city}');
              List city = value as List;
              if (_controller.length != city.length) {
                debugPrint('new data added -- ${value}');
                _controller.dispose();
                _controller =
                    TabController(length: widget.city.length, vsync: this);
              } else {
                _controller =
                    TabController(length: widget.city.length, vsync: this);
              }
              setState(() {});
            });
          },
          child: Icon(
            Icons.add,
            color: white,
          ),
        ),
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
          title: Text('Pinned City Weather'),
        ),
        body: Column(
          children: [
            Container(
              height: 40,
              child: TabBar(
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: backgroundColor,
                tabs: getListOfCity(),
                controller: _controller,
              ),
            ),
            Expanded(
                child: TabBarView(
              controller: _controller,
              children: getListWeatherDetailsWidget(),
            ))
          ],
        ));
  }

  List<Widget> getListOfCity() {
    List<Widget> city = [];
    for (int i = 0; i < widget.city.length; i++) {
      city.add(Text(
        '${widget.city.elementAt(i)}',
        style: textStyleBlack16,
      ));
    }

    debugPrint('tab length --- ${city.length}');
    return city;
  }

  List<Widget> getListWeatherDetailsWidget() {
    List<Widget> weatherWidget = [];
    for (int i = 0; i < widget.city.length; i++) {
      weatherWidget.add(MultiBlocProvider(
        providers: [
          BlocProvider<HomeBloc>(
            create: (_) => HomeBloc(
                WeatherRepository(
                    weatherApiClient: WeatherApiClient(
                  netUtil: NetworkUtil(),
                  apiKey: weather_api_key,
                )),
                widget.city.elementAt(i)),
          ),
          BlocProvider<ErrorBloc>(
            create: (_) => ErrorBloc(),
          ),
          BlocProvider<ProgressBloc>(
            create: (_) => ProgressBloc(),
          ),
        ],
        child: HomeScreen(),
      ));
    }

    return weatherWidget;
  }
}
