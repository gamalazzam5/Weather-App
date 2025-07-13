import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weatherapp/cubits/get_weather_cubit.dart';
import 'package:weatherapp/views/weather_info.dart';
import 'package:weatherapp/widgets/homeViewWidgets/weather_image.dart';
import '../widgets/homeViewWidgets/app_title.dart';
import '../widgets/homeViewWidgets/city_input_field.dart';
import '../widgets/homeViewWidgets/search_button.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController _controller = TextEditingController();
  GetWeatherCubit get cubit => context.read<GetWeatherCubit>();
void _fetchWeather() async {
  final city = _controller.text.trim();
  cubit.fetchWeather(city);
}
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetWeatherCubit, GetWeatherState>(
      listener: (context, state) {
       if(state is GetWeatherError){
         ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(content: Text(state.message), backgroundColor: Colors.red),
         );
       }else if (state is GetWeatherSuccess){
         Navigator.push(context, MaterialPageRoute(builder: (context){
            return WeatherInfo(weatherModel: state.weatherModel);
         },),);
       }
      },
      builder: (context, state) {
        if( state is GetWeatherLoading){
          return Scaffold(body: Center(
            child: CircularProgressIndicator(color: Color(0xff08244F),),
          ),);
        }
        return Scaffold(
          body: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Padding(
              padding:  EdgeInsets.only(top: 76.0.h),
              child: Column(
                children: [
                  const AppTitle(),
                   SizedBox(height: 107.h),
                  const WeatherImage(),
                  SizedBox(height: 200.h),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 30.0.w),
                    child: Row(
                      children: [
                        Expanded(
                          child: CityInputField(
                            controller: _controller,
                            onSubmit:_fetchWeather
                          ),
                        ),
                         SizedBox(width: 10.w),
                        SearchButton(onSubmit: _fetchWeather),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
      ,
    );
  }
}
