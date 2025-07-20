class WeatherModel {
  final String cityName;
  final DateTime date;
  final double? minTemp;
  final double? maxTemp;
  final double? avgTemp;
  final String state;
  final String? image;

  WeatherModel({
    required this.cityName,
    required this.date,
    required this.state,
    required this.avgTemp,
    required this.maxTemp,
    required this.minTemp,
    required this.image,
  });

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
        state: json["forecast"]["forecastday"][0]['hour'][0]["condition"]
            ["text"],
        avgTemp: json["forecast"]["forecastday"][0]["day"]["avgtemp_c"],
        maxTemp: json["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
        minTemp: json["forecast"]["forecastday"][0]["day"]["mintemp_c"],
        cityName: json["location"]["name"],
        date: DateTime.parse(json["current"]["last_updated"]),
        image: json['current']['condition']['icon']);
  }
}
