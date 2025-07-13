import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/widgets/weatherInfoWidgets/weather_icon_mapper.dart';

class WeatherMainIcon extends StatelessWidget {
  const WeatherMainIcon({super.key, required this.weatherModel});

  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          getWeatherIcon(
            condition: weatherModel.weatherCondition.toLowerCase(),
            isDay: weatherModel.isDay,
          ),
          height: 207.h,
          width: 284.w,
        ),

        Column(
          children: [
            Text(
              "${weatherModel.avgTemp.round()}°C",
              style: TextStyle(
                fontSize: 64.sp,
                color: Colors.white,
                fontFamily: "inter",
              ),
            ),
             Text(
              "Precipitations",
              style: TextStyle(
                fontSize: 18.sp,
                color: Colors.white,
                fontFamily: "inter",
              ),
            ),
            Text(
              "Max.: ${weatherModel.maxTemp.round()}º Min.: ${weatherModel.minTemp.round()}º",
              style: TextStyle(
                fontSize: 18.sp,
                color: Colors.white,
                fontFamily: "inter",
              ),
            ),
          ],
        ),
      ],
    );
  }
}
