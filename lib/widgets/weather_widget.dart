import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/model/weather.dart';
import 'package:weather/util/style.dart';
import 'package:weather/util/weather_icon_mapper.dart';
import 'package:weather/widgets/value_tile.dart';

import 'forecast_horizontal_widget.dart';

class WeatherWidget extends StatelessWidget {
  final Weather weather;

  WeatherWidget({required this.weather}) : assert(weather != null);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        const SizedBox(
          height: 40,
        ),
        Text(
          this.weather.cityName.toUpperCase(),
          style: textStyleBlack18,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          this.weather.description.toUpperCase(),
          style: textStyleBlack15,
        ),
        Padding(
          child: Divider(
            color: Colors.grey,
          ),
          padding: EdgeInsets.all(10),
        ),
        ForecastHorizontal(
          weathers: weather.forecast,
          key: UniqueKey(),
        ),
        Padding(
          child: Divider(
            color: Colors.grey,
          ),
          padding: EdgeInsets.all(10),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          ValueTile(
            "wind speed",
            '${this.weather.windSpeed} m/s',
            iconData: WeatherIcons.clear_day,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Center(
                child: Container(
              width: 1,
              height: 30,
            )),
          ),
          ValueTile(
            "sunrise",
            DateFormat('h:m a').format(DateTime.fromMillisecondsSinceEpoch(
                this.weather.sunrise * 1000)),
            iconData: WeatherIcons.clear_day,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Center(
                child: Container(
              width: 1,
              height: 30,
            )),
          ),
          InkWell(
            onTap: () {},
            child: ValueTile(
              "sunset",
              DateFormat('h:m a').format(DateTime.fromMillisecondsSinceEpoch(
                  this.weather.sunset * 1000)),
              iconData: WeatherIcons.clear_day,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Center(
                child: Container(
              width: 1,
              height: 30,
            )),
          ),
          InkWell(
            onTap: () {},
            child: ValueTile(
              "humidity",
              '${this.weather.humidity}%',
              iconData: WeatherIcons.clear_day,
            ),
          ),
        ]),
      ],
    );
  }
}
