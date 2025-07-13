import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/widgets/weatherInfoWidgets/weather_icon_mapper.dart';
import '../../models/listview_model.dart';
import 'colum_weather.dart';

class HourlyForecastCard extends StatelessWidget {
  const HourlyForecastCard({super.key, required this.weatherModel});

  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    final List<WeatherHourStatus> hourlyForecast =
        weatherModel.hourData.take(24).map((hour) {
          final temp = hour['temp'] ?? 0;
          final condition = hour['condition'] ?? '';
          final time = hour['time']?.toString().substring(11, 16) ?? '--:--';
          final isDayHour = hour['isDay'] ?? 0;

          return WeatherHourStatus(
            temp: temp,
            imageUrl: getWeatherIcon(condition: condition, isDay: isDayHour),
            time: time,
          );
        }).toList();

    final formattedDate = DateFormat(
      'MMMM d',
    ).format(DateTime.parse(weatherModel.day));
    return Container(
      height: 230.h,
      width: 343.w,
      decoration: BoxDecoration(
        color: Color(0xff001026).withValues(alpha: .5),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        children: [
          Padding(
            padding:  EdgeInsets.only(left: 16.0.w, top: 12.h, right: 12.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Today",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontFamily: "inter",
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  formattedDate,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontFamily: "inter",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
           SizedBox(height: 25.h),
          SizedBox(
            height: 150.h,
            child: ListView.builder(
              itemCount: hourlyForecast.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final item = hourlyForecast[index];
                return Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 12.w),
                  child: ColumWeather(
                    imageUrl: item.imageUrl,
                    temp: item.temp,
                    time: item.time,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
