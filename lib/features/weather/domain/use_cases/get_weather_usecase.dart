

import 'package:block_demo_dharmesh/features/weather/domain/entities/weather_entity.dart';
import 'package:block_demo_dharmesh/features/weather/domain/repository/weather_repository.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures.dart';
import '../../data/models/weather_model.dart';

class GetWeatherDataUseCase {
  final WeatherRepository weatherRepo;
  GetWeatherDataUseCase({required this.weatherRepo});

  Future<Either<Failure, WeatherModel>> getCurrentWeather(WeatherEntity cityName) async {
    try {
      return await weatherRepo.getCurrentWeather(cityName);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}