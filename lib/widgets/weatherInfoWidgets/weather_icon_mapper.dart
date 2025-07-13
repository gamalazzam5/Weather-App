String getWeatherIcon({required String condition, required int isDay}) {
  switch (condition.toLowerCase()) {
    case 'sunny':
      return isDay == 1
          ? 'assets/images/sunnyIcons/sunny.png'
          : 'assets/images/moonIcons/moon.png';
    case 'partly cloudy':
      return isDay == 1
          ? 'assets/images/sunnyIcons/pcloudy.png'
          : 'assets/images/moonIcons/pcloudy 0.png';
    case 'cloudy':
    case 'overcast':
      return isDay == 1
          ? 'assets/images/sunnyIcons/mcloudy.png'
          : 'assets/images/moonIcons/mcloudy 0.png';
    case 'mist':
    case 'fog':
      return isDay == 1
          ? 'assets/images/sunnyIcons/Foggy.png'
          : 'assets/images/moonIcons/foggy 0.png';
    case 'patchy rain possible':
    case 'light rain':
    case 'moderate rain':
      return isDay == 1
          ? 'assets/images/sunnyIcons/Lrain.png'
          : 'assets/images/moonIcons/Lrain 0.png';
    case 'thundery outbreaks possible':
      return isDay == 1
          ? 'assets/images/sunnyIcons/TStorm.png'
          : 'assets/images/moonIcons/Tstorm 0.png';
    case 'light snow':
    case 'moderate snow':
      return isDay == 1
          ? 'assets/images/sunnyIcons/Lsnow.png'
          : 'assets/images/moonIcons/LSnow 0.png';
    default:
      return isDay == 1
          ? 'assets/images/sunnyIcons/mcloudy.png'
          : 'assets/images/moonIcons/mcloudy 0.png';
  }
}
