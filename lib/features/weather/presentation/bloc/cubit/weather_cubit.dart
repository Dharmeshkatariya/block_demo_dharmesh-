import 'package:bloc/bloc.dart';
import 'package:block_demo_dharmesh/features/weather/domain/use_cases/get_weather_usecase.dart';
import 'package:equatable/equatable.dart';

import '../../../../../injection_container.dart';
import '../../../data/models/weather_model.dart';
import '../../../domain/entities/weather_entity.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());


  Future<void> getWeather(WeatherEntity city) async {
    emit(WeatherLoading());

    var weatherOrFailure =
        await locator.call<GetWeatherDataUseCase>().getCurrentWeather(city);
    weatherOrFailure.fold(
      (failure) => emit(WeatherFailure(error: failure.message)),
      (weather) => emit(WeatherSuccess(weatherModel: weather)),
    );
  }

// Future<void> getWeather(
//     WeatherEntity  city ) async {
//   emit(WeatherLoading());
//
//   try {
//     var weatherState = await locator
//         .call<GetWeatherDataUseCase>()
//         .getCurrentWeather(city);
//   }catch(e){
//     print(e) ;
//     emit(WeatherFailure(error: weatherState.toString()));
//   }
//
// }
}
