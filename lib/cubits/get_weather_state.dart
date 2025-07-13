part of 'get_weather_cubit.dart';

@immutable
sealed class GetWeatherState {
  const GetWeatherState();
}

final class GetWeatherInitial extends GetWeatherState {
  const GetWeatherInitial();
}

final class GetWeatherLoading extends GetWeatherState {
  const GetWeatherLoading();
}

final class GetWeatherSuccess extends GetWeatherState {
  final WeatherModel weatherModel;

  const GetWeatherSuccess(this.weatherModel);
}

final class GetWeatherError extends GetWeatherState {
  final String message;

  const GetWeatherError(this.message);
}
