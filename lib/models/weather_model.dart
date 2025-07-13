class WeatherModel {
  final String cityName;
  final double avgTemp;
  final double minTemp;
  final double maxTemp;
  final double humidity;
  final double wind;
  final double totalPrecipRain;
  final String day;
  final String weatherCondition;
  final int isDay;
  final List<Map<String, dynamic>> hourData;

  WeatherModel({ required this.weatherCondition,
    required this.cityName,
    required this.hourData,
    required this.avgTemp,
    required this.minTemp,
    required this.maxTemp,
    required this.humidity,
    required this.wind,
    required this.totalPrecipRain,
    required this.day,
    required this.isDay
  });

  factory WeatherModel.fromJson(json) {
    final location = json['location'];
    final forecastDay = json['forecast']['forecastday'][0];
    final day = forecastDay['day'];
    final hours = forecastDay['hour'];
    List<Map<String, dynamic>> hourData =
    hours.map<Map<String, dynamic>>((hour) {
      return {
        'time': hour['time'],
        'temp': hour['temp_c'],
        'condition': hour['condition']['text'],
        'isDay':hour['is_day']
      };
    }).toList();
    return WeatherModel(
      avgTemp: day['avgtemp_c'].toDouble(),
      minTemp: day['mintemp_c'].toDouble(),
      maxTemp: day['maxtemp_c'].toDouble(),
      humidity: day['avghumidity'].toDouble(),
      wind: day['maxwind_kph'].toDouble(),
      totalPrecipRain: day['totalprecip_mm'].toDouble(),
      cityName: location['name'].toString(),
      day: forecastDay['date'],
      weatherCondition:day['condition']['text'] ,
      hourData: hourData,
      isDay: json['current']['is_day']??0
    );
  }
}