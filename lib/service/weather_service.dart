import 'dart:developer';

import 'package:weather_app/models/weather_model.dart';
import 'package:dio/dio.dart';


class WeatherService{
  final Dio dio ;
  final baseUrl="http://api.weatherapi.com/v1";
  final String apiKey="72200d149e854f3498f144451252307";
  WeatherService({required this.dio});
       Future<WeatherModel>getCurrentWeather(String city)async{

  try{
    final respone =await dio.get("$baseUrl/forecast.json?key=$apiKey&q=${city}&days=1");
    return WeatherModel.fromJson(respone.data);
  }on DioException catch(e){
    final String msg=e.response?.data["error"]["message"]??"opps there was an error";


print("-------------------------------------------------------111");
    throw Exception(msg);


  }catch(e){

    throw Exception("opps there was an error");


  }

  }
}