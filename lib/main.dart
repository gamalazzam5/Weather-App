import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app10/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app10/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app10/views/home_view.dart';


void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context)=> BlocBuilder<GetWeatherCubit, WeatherState>(
  builder: (context, state) {
    return MaterialApp(
          theme: ThemeData(
            useMaterial3: false,
            primarySwatch: getThemeColor(
              BlocProvider.of<GetWeatherCubit>(
                context,
              ).weatherModel?.weatherCondition,
            ),
          ),
          home: HomeView(),
          debugShowCheckedModeBanner: false,
        );
  },
),
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition.toLowerCase()) {
    case 'sunny':
      return Colors.amber;
    case 'partly cloudy':
      return Colors.orange;
    case 'cloudy':
    case 'overcast':
      return Colors.blueGrey;
    case 'mist':
    case 'fog':
      return Colors.teal;
    case 'patchy rain possible':
    case 'light rain':
    case 'moderate rain':
      return Colors.blue;
    case 'thundery outbreaks possible':
      return Colors.deepPurple;
    case 'light snow':
    case 'moderate snow':
      return Colors.cyan;
    default:
      return Colors.blue;
  }
}
