import '../../models/weather_model.dart';

class WeatherState{

}



class initialState extends WeatherState{


}
class WeatherLoadedState extends WeatherState{
  final WeatherModel weatherModel;
  WeatherLoadedState({required this.weatherModel});

}
class WeatherErrorState extends WeatherState{

}
