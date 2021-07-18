import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/ui/application/application_bloc.dart';
import 'package:weather/ui/application/application_event.dart';
import 'package:weather/util/color.dart';

import 'route/rtn_routes.dart';

/// application launch
class WeatherApp extends StatefulWidget {
  final SharedPreferences sharedPreference;

  WeatherApp(this.sharedPreference);

  @override
  WeatherAppState createState() => WeatherAppState();
}

class WeatherAppState extends State<WeatherApp> {
  @override
  void initState() {
    super.initState();
    final router = FluroRouter();

    WeatherAppRoutes.router = router;
    WeatherAppRoutes.configureRoutes(router);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ApplicationBloc>(
          create: (_) => ApplicationBloc(widget.sharedPreference)
            ..add(ApplicationInitialEvent()),
        ),
      ],
      child: MaterialApp(
          initialRoute: WeatherAppRoutes.root,
          debugShowCheckedModeBanner: false,
          title: 'Weather',
          onGenerateRoute: WeatherAppRoutes.router.generator,
          theme: ThemeData(
              primaryColor: Colors.black,
              backgroundColor: white,
              buttonColor: Colors.black,
              accentColor: Colors.blue,
              primarySwatch: MaterialColor(0xff000000, primarySwatchcolor),
              unselectedWidgetColor: Colors.black,
              primaryIconTheme: IconThemeData(
                color: Colors.black,
              ),
              errorColor: Colors.red,
              iconTheme: IconThemeData(
                color: Colors.white,
              ),
              accentIconTheme: IconThemeData(
                color: Colors.white, // FAB icon color
              ))),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
