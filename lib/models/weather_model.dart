class WeatherModel{
  final  String cityName;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String weatherCondition;
  final DateTime date;
  final String? image;


  WeatherModel({
    required this.cityName,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherCondition,
    required this.date,
    required this.image,

  });

  factory WeatherModel.fromJson( json) {
    return WeatherModel(
      cityName: json['location']['name'],
      date: DateTime.parse(json['current']['last_updated']),
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      weatherCondition: json['forecast']['forecastday'][0]['day']['condition']['text'],
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],

    );

  }
}