import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weatherapp/widgets/weatherInfoWidgets/row_item.dart';
import '../../models/weather_model.dart';

class WeatherStatusBar extends StatelessWidget {
  const WeatherStatusBar({super.key, required this.weatherModel});

  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 47.h,
      width: 343.w,
      decoration: BoxDecoration(
        color: Color(0xff001026).withValues(alpha: .5),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          RowItem(
            imageUrl: "assets/images/rain_status_icon.png",
            prograss: "${weatherModel.totalPrecipRain.round()}%",
          ),
          RowItem(
            imageUrl: "assets/images/humidity_status_icon.png",
            prograss: "${weatherModel.humidity.round()}%",
          ),
          RowItem(
            imageUrl: "assets/images/wind_status_icon.png",
            prograss: "${weatherModel.wind.round()}km/h",
          ),
        ],
      ),
    );
  }
}
