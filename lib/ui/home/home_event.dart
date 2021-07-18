import 'package:equatable/equatable.dart';
import 'package:weather/model/weather.dart';

abstract class HomeBlocEvent extends Equatable {}

class ProgressIndicatorEvent extends HomeBlocEvent {
  @override
  List<Object> get props => [];
}


class WeatherLoadedEvent extends HomeBlocEvent {
  final Weather weather;

  WeatherLoadedEvent({required this.weather});

  @override
  List<Object?> get props => [weather];
}