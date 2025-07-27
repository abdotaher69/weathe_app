import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/models/weather_model.dart';

import '../../screens/search_veiw.dart';
import '../../service/weather_service.dart';
import 'get_weather_states.dart';

class GetWeatherCubit extends Cubit<WeatherState>{
  GetWeatherCubit():super(initialState());
    WeatherModel? w2;

  getWeather({required String cityName})async{
    try{
    WeatherService w1=WeatherService(dio: Dio());
       w2= await w1.getCurrentWeather(cityName);
      emit(WeatherLoadedState(weatherModel: w2!));
    }
    catch(e){
      print("---------------------------------------------------------");
      print(e.toString());

    emit(WeatherErrorState());
  }


  }


}