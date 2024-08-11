
import 'package:block_demo_dharmesh/features/weather/domain/entities/weather_entity.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures.dart';
import '../../data/models/weather_model.dart';

abstract class WeatherRepository {
  Future<Either<Failure, WeatherModel>> getCurrentWeather(WeatherEntity cityName);

}