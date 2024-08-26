import 'package:coffee_card/models/wheather_model.dart';
import 'package:coffee_card/services/weather_service.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final _weatherService = WeatherService("54c49f50e1cabc6891b273c3458c18d2");
  Weather? _weather;

  _fetchWeather() async {
    final cityName = await _weatherService.getCurrentLocation();
    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print(e);
    }
  }

  String getWeatherAnimation(String? weatherDescription) {
    if (weatherDescription == null) {
      return 'assets/sunny.json';
    }
    switch (weatherDescription.toLowerCase()) {
      case 'clouds':
        return 'assets/cloud.json';
      case 'mist':
        return 'assets/cloud.json';
      case 'smoke':
        return 'assets/cloud.json';
      case 'haze':
        return 'assets/cloud.json';
      case 'dust':
        return 'assets/cloud.json';
      case 'fog':
        return 'assets/cloud.json';
      case 'rain':
        return 'assets/rain.json';
      case 'drizzle':
        return 'assets/rain.json';
      case 'thunderstorm':
        return 'assets/thunder.json';
      case 'snow':
        return 'assets/cloud.json';
      case 'clear':
        return 'assets/sunny.json';
      case 'fog':
        return 'assets/cloudy.json';
      default:
        return 'assets/sunny.json';
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_weather?.cityName ?? 'Loading City...'),
            Lottie.asset(
              getWeatherAnimation(_weather?.weatherDescription),
              width: 100,
              height: 100,
            ),
            Text('${_weather?.temperatureCelsius.round()}' ??
                'Loading Temperature...'),
            Text(_weather?.weatherDescription ?? ''),
          ],
        ),
      ),
    );
  }
}
