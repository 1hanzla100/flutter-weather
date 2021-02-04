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
      {this.condition,
      this.temperature,
      this.feelsLike,
      this.visibility,
      this.pressure,
      this.humidity,
      this.windSpeed,
      this.country,
      this.name,
      this.icon});

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    // String iconSelector(icon, iconCode) {
    //   if (icon >= 200 && icon < 233) {
    //     return 'thunder.svg';
    //   }
    //   if (icon >= 300 && icon < 332) {
    //     return 'rainy-5.svg';
    //   }
    //   if (icon >= 500 && icon < 532) {
    //     return 'rainy-6.svg';
    //   }
    //   if (icon >= 600 && icon < 632) {
    //     return 'snowy-3.svg';
    //   }
    //   if (icon == 800) {
    //     if (iconCode[2] == "d") {
    //       return 'day.svg';
    //     }
    //     if (iconCode[2] == "n") {
    //       return 'night.svg';
    //     }
    //   }

    //   if (icon > 800) {
    //     if (iconCode[2] == "d") {
    //       return 'cloudy-day-3.svg';
    //     }
    //     if (iconCode[2] == "n") {
    //       return 'cloudy-night-3.svg';
    //     }
    //   }
    //   if (icon >= 700 && icon < 800) {
    //     if (iconCode[2] == "d") {
    //       return 'cloudy-day-2.svg';
    //     }
    //     if (iconCode[2] == "n") {
    //       return 'cloudy-night-2.svg';
    //     }
    //   }
    // }

    return WeatherData(
      condition: json['weather'][0]['main'],
      temperature: (json['main']['temp'] - 273.15).round(),
      feelsLike: (json['main']['feels_like'] - 273.15).round(),
      visibility: (json['visibility'] / 1000).round(),
      pressure: (json['main']['pressure']),
      humidity: json['main']['humidity'].toString(),
      windSpeed: json['wind']['speed'],
      country: json['sys']['country'],
      name: json['name'],
      icon: json['weather'][0]['icon'],
    );
  }
}
