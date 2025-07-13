import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weatherapp/models/weather_model.dart';
import '../widgets/weatherInfoWidgets/hourly_forecast_card.dart';
import '../widgets/weatherInfoWidgets/weather_header.dart';
import '../widgets/weatherInfoWidgets/weather_main_icon.dart';
import '../widgets/weatherInfoWidgets/weather_status_bar.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({super.key, required this.weatherModel});

  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ConstrainedBox(
        constraints: BoxConstraints(minHeight: screenHeight),

        child: IntrinsicHeight(
          child: Container(
            height: screenHeight,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: const [
                  Color(0xff08244F),
                  Color(0xff134CB5),
                  Color(0xff0B42AB),
                ],
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 45.h, left: 30.w, right: 30.w),
              child: Column(
                children: [
                  WeatherHeader(weatherModel: weatherModel),
                  SizedBox(height: 30.h),

                  WeatherMainIcon(weatherModel: weatherModel),
                  SizedBox(height: 30.h),
                  WeatherStatusBar(weatherModel: weatherModel),
                  SizedBox(height: 20.h),
                  HourlyForecastCard(weatherModel: weatherModel),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
