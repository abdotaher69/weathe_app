import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/get_current_weather_cubit/get_weather_cubit.dart';
import '../main.dart';
import '../models/weather_model.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({super.key});


  @override
  Widget build(BuildContext context) {
      var weathercubit=BlocProvider.of<GetWeatherCubit>(context);
      WeatherModel weatherModel=weathercubit.w2!;
      bool image=true;
      if(weatherModel.image!.contains("http")){
        image=false;

      }

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            getWeatherColor(weatherModel.weatherCondition),
            getWeatherColor(weatherModel.weatherCondition)[300]!,
            getWeatherColor(weatherModel.weatherCondition)[100]!,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
      ),),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(weatherModel.cityName,style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,),textAlign: TextAlign.center,)
            ,Text("updated at ${weatherModel.date.hour}:${weatherModel.date.minute}",style: TextStyle(fontSize: 20),),
            SizedBox(height: 20,)
            ,Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
             image?Image.network("https:${weatherModel.image}",height: 100,):Image.network("${weatherModel.image}",height: 100,),
              Text(weatherModel.temp.toString(),style: TextStyle(fontSize: 30),),
               Column(children: [
                 Text("max temp ${weatherModel.maxTemp.floor().toString()}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                 Text("min temp ${weatherModel.minTemp.floor().toString()}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)

               ],)

            ],)
            ,SizedBox(height: 20,),
            Text(weatherModel.weatherCondition,style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),)

          ],

        ),
      ),
    );
}
}