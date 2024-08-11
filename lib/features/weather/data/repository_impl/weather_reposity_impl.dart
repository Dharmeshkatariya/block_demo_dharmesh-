import 'package:block_demo_dharmesh/features/weather/domain/entities/weather_entity.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../export.dart';
import '../models/weather_model.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherNetworkDb weatherNetworkDb;

  WeatherRepositoryImpl({required this.weatherNetworkDb});

  @override
  Future<Either<Failure, WeatherModel>> getCurrentWeather(
      WeatherEntity cityName) async {
    return await weatherNetworkDb.getCurrentWeather(cityName);
  }
}
