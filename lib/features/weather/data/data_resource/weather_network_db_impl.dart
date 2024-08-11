import 'dart:convert';

import 'package:block_demo_dharmesh/features/weather/data/data_resource/weather_network_db.dart';
import 'package:block_demo_dharmesh/features/weather/domain/entities/weather_entity.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;

import '../../../../export.dart';
import '../models/weather_model.dart';

const openWeatherAPIKey = '4af409a4c67493e64a7c44c96d9c51e3';


class WeatherNetworkDbImpl implements WeatherNetworkDb {


  @override
  Future<Either<Failure, WeatherModel>> getCurrentWeather(WeatherEntity city) async {
    try {
      final res = await http.get(
        Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?q=${city.cityName}&APPID=$openWeatherAPIKey',
        ),
      );

      if (res.statusCode == 200) {
        final weatherModel = WeatherModel.fromJson(json.decode(res.body));
        return Right(weatherModel);
      } else {
        return Left(Failure(message: 'Failed to load weather data: ${res.statusCode}'));
      }
    } catch (e) {
      return Left(Failure(message: 'Failed to load weather data: ${e.toString()}'));
    }
  }
  // @override

  // Future<WeatherModel> getCurrentWeather(WeatherEntity city) async {
  //   final res = await http.get(
  //     Uri.parse(
  //       'https://api.openweathermap.org/data/2.5/forecast?q=${city.cityName}&APPID=$openWeatherAPIKey',
  //     ),
  //   );
  //
  //   if (res.statusCode == 200) {
  //     return WeatherModel.fromJson(res.body);
  //   } else {
  //     throw Exception('Failed to load weather data');
  //   }
  // }



}