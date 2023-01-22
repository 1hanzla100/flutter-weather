class WeatherData {
  String condition;
  num temperature;
  num feelsLike;
  num pressure;
  num visibility;
  String humidity;
  num windSpeed;
  String country;
  String name;
  String icon;

  WeatherData(
      {
      required this.condition,
      required this.temperature,
      required this.feelsLike,
      required this.visibility,
      required this.pressure,
      required this.humidity,
      required this.windSpeed,
      required this.country,
      required this.name,
      required this.icon});

  factory WeatherData.fromJson(Map<dynamic, dynamic> json) {
    return WeatherData(
      condition: json['weather'][0]['main'],
      temperature: (json['main']['temp']).round(),
      feelsLike: (json['main']['feels_like']).round(),
      visibility: (json['visibility'] / 1000).round(),
      pressure: (json['main']['pressure']),
      humidity: json['main']['humidity'].toString(),
      windSpeed: (json['wind']['speed'] * 3.6),
      country: json['sys']['country'],
      name: json['name'],
      icon: json['weather'][0]['icon'],
    );
  }
}
