import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weatherapp/cubits/get_weather_cubit.dart';
import 'package:weatherapp/services/weather_service.dart';
import 'package:weatherapp/views/home_view.dart';


void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: BlocProvider(
        create: (context) => GetWeatherCubit(WeatherService(Dio())),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomeView(),
        ),
      ),
    );
  }
}
