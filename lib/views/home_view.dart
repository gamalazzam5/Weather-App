import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app10/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app10/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app10/views/search_view.dart';
import 'package:weather_app10/widgets/weather_info.dart';

import '../widgets/no_weather_info.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Weather App"),

        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => SearchView()));
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitialState) {
            return const NoWeatherBody();
          } else if (state is WeatherLoadedState) {
            return WeatherInfo();
          } else {
            return const Text("oops There was an error");
          }
        },
      ),
    );
  }
}
