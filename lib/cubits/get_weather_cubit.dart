import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weatherapp/services/weather_service.dart';
import '../models/weather_model.dart';

part 'get_weather_state.dart';

class GetWeatherCubit extends Cubit<GetWeatherState> {
  GetWeatherCubit(this._weatherService) : super(GetWeatherInitial());

  final WeatherService _weatherService;

  Future<void> fetchWeather(String cityName) async {
    if (cityName.trim().isEmpty) {
      emit(GetWeatherError('City name can not be empty'));
      return;
    }
    emit(GetWeatherLoading());
    try {
      final weatherModel = await _weatherService.getCurrentWeather(
        cityName: cityName.trim(),
      );
      emit(GetWeatherSuccess(weatherModel));
    } catch (e) {
      final message = e.toString().replaceFirst('Exception: ', '');
      emit(GetWeatherError(message));
    }
  }
}
