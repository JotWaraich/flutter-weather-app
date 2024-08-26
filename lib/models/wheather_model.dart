class Weather {
  final String cityName;
  final double temperatureCelsius;
  final String weatherDescription;

  Weather({
    required this.cityName,
    required this.temperatureCelsius,
    required this.weatherDescription,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'],
      temperatureCelsius: json['main']['temp'].toDouble(),
      weatherDescription: json['weather'][0]['main'],
    );
  }
}
