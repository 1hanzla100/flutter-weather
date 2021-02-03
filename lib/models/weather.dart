class WeatherData {
  String condition;
  num temperature;
  double feelsLike;
  double temperatureMin;
  double temperatureMax;
  String humidity;
  num windSpeed;
  String country;
  String name;

  WeatherData(
      {this.condition,
      this.temperature,
      this.feelsLike,
      this.temperatureMin,
      this.temperatureMax,
      this.humidity,
      this.windSpeed,
      this.country,
      this.name});

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      condition: json['weather'][0]['main'],
      temperature: (json['main']['temp'] - 273.15).round(),
      feelsLike: json['main']['feels_like'],
      temperatureMin: json['main']['temp_min'],
      temperatureMax: json['main']['temp_max'],
      humidity: json['main']['humidity'].toString(),
      windSpeed: json['wind']['speed'],
      country: json['sys']['country'],
      name: json['name'],
    );
  }
}
