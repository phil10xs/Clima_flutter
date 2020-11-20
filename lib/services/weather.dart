import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = 'a965100e8925d8c60846fdf526dfd5e2';
const  openWeatherMapURL =  'https://samples.openweathermap.org/data/2.5/weather';

class WeatherModel {

  Future<dynamic> getCityWeather (String cityName) async {
    var url = '$openWeatherMapURL?q=$cityName&appid=$apiKey';

    NetworkHelper networkHelper = NetworkHelper(url);

    var weatherData =  await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async{
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper (
        '$openWeatherMapURL?q=London&appid=439d4b804bc8187953eb36d2a8c26a02');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temperature) {
    if (temperature > 25) {
      return 'It\'s 🍦 time';
    } else if (temperature > 20) {
      return 'Time for shorts and 👕';
    } else if (temperature < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
