import 'package:equatable/equatable.dart';
import 'package:weather/model/weather.dart';

abstract class HomeBlocState extends Equatable {}

class DefaultState extends HomeBlocState {
  DefaultState();

  @override
  List<Object> get props => [];
}

class WeatherEmpty extends HomeBlocState {
  @override
  List<Object?> get props => [];
}

class WeatherLoading extends HomeBlocState {
  @override
  List<Object?> get props => [];
}

class WeatherLoaded extends HomeBlocState {
  final Weather weather;

  WeatherLoaded({required this.weather}) : assert(weather != null);

  @override
  List<Object?> get props => [weather];
}

class WeatherError extends HomeBlocState {
  final int errorCode;
  final errorMessage;

  WeatherError({required this.errorCode, required this.errorMessage})
      : assert(errorCode != null);

  @override
  List<Object?> get props => [errorCode, errorMessage];
}
