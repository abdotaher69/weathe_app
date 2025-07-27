import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/screens/search_veiw.dart';

import '../components/no_weather_info.dart';
import '../components/weather_info.dart';
import '../cubits/get_current_weather_cubit/get_weather_cubit.dart';
import '../cubits/get_current_weather_cubit/get_weather_states.dart';
import '../main.dart';

class HomeVeiw extends StatelessWidget {
  const HomeVeiw({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        actions: [IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchVeiw()));
        }, icon: Icon(Icons.search))],
        title: Text("Weather App",style: TextStyle(fontSize: 20),)),
      body:BlocBuilder<GetWeatherCubit,WeatherState>(builder: (context,state){
        if(state is WeatherLoadedState){
          return WeatherInfo();
        }else if(state is WeatherErrorState){
          return Center(child: Text("something went wrong please try again"));
        }
        else{
          return NoWeatherInfo();}

      })
    );
  }
}
