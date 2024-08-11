
import 'package:block_demo_dharmesh/features/weather/domain/entities/weather_entity.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../export.dart';
import '../models/weather_model.dart';


abstract class WeatherNetworkDb {
  Future<Either<Failure, WeatherModel>> getCurrentWeather(WeatherEntity city);
}