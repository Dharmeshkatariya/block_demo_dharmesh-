part of 'weather_cubit.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {
  @override
  List<Object> get props => [];
}


class WeatherFailure extends WeatherState {
  String error;
  WeatherFailure({required this.error});
  @override
  List<Object> get props => [error];
}

class WeatherLoading extends WeatherState {
}

class WeatherSuccess extends WeatherState {
  final WeatherModel weatherModel;

  const WeatherSuccess({required this.weatherModel});
  @override
  List<Object> get props => [weatherModel];
}

