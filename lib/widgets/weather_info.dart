import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app10/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app10/main.dart';
import 'package:weather_app10/models/weather_model.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            getThemeColor(weatherModel.weatherCondition),
            getThemeColor(weatherModel.weatherCondition)[300]!,
            getThemeColor(weatherModel.weatherCondition)[50]!,
          ],
        ),
      ),

      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            weatherModel.cityName,
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
          ),
          Text(
            "updated at ${weatherModel.date.hour}:${weatherModel.date.minute}",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network("https:${weatherModel.image}"),
              Text(
                "${weatherModel.temp.round()}",
                style: TextStyle(fontSize: 27, fontWeight: FontWeight.w600),
              ),
              Column(
                children: [
                  Text(
                    "MaxTemp: ${weatherModel.maxTemp.round()}",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "MinTemp:  ${weatherModel.minTemp.round()}",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ],
          ),
          Text(
            weatherModel.weatherCondition,
            style: TextStyle(fontSize: 27, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
