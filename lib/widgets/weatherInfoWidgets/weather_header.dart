import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../models/weather_model.dart';

class WeatherHeader extends StatelessWidget {
  const WeatherHeader({
    super.key,
    required this.weatherModel,
  });

  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
          onPressed: () => Navigator.pop(context),
          padding: EdgeInsets.zero,
        ),
        Image.asset(
          "assets/images/location_icon.png",
          color: Colors.white,
        ),
        SizedBox(width: 12.w),
        Text(
          weatherModel.cityName,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
            fontFamily: "inter",
          ),
        ),
      ],
    );
  }
}