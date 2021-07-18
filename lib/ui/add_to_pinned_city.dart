import 'package:flutter/material.dart';
import 'package:weather/shared_preferences/weather_app_shared_preference.dart';
import 'package:weather/util/constants.dart';
import 'package:weather/util/style.dart';

class AddToPinnedCity extends StatefulWidget {
  final List pinnedCity;

  const AddToPinnedCity(this.pinnedCity, {Key? key}) : super(key: key);

  @override
  _AddToPinnedCityState createState() => _AddToPinnedCityState();
}

class _AddToPinnedCityState extends State<AddToPinnedCity> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        WeatherAppSharedPreferences().updatePinnedCity(widget.pinnedCity);
        Navigator.pop(context, widget.pinnedCity);
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
              iconTheme: IconThemeData(
                color: Colors.white, //change your color here
              ),
              title: Text('Add to Pinned')),
          body: ListView.builder(
              // physics: ClampingScrollPhysics(),
              itemCount: city.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    if (widget.pinnedCity.contains(city.elementAt(index)))
                      widget.pinnedCity.remove(city.elementAt(index));
                    else
                      widget.pinnedCity.add(city.elementAt(index));
                    setState(() {});
                  },
                  child: ListTile(
                      title: Text(
                        city.elementAt(index),
                        style: textStyleBlack18,
                      ),
                      trailing: Text(
                          widget.pinnedCity.contains(city.elementAt(index))
                              ? 'Remove'
                              : 'Add')),
                );
              }),
        ),
      ),
    );
  }
}
