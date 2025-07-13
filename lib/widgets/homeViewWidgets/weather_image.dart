import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeatherImage extends StatelessWidget {
  const WeatherImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/images/sun_cloud_rain.png",width: 284.w ,height:207.h ,);
  }
}
