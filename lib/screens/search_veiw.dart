import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/service/weather_service.dart';

import '../cubits/get_current_weather_cubit/get_weather_cubit.dart';

class SearchVeiw extends StatelessWidget {
  const SearchVeiw({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("Search City"),),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: TextField(
            onSubmitted: (value)async{
            var getweathercubit=  BlocProvider.of<GetWeatherCubit>(context);
            getweathercubit.getWeather(cityName: value);

                Navigator.pop(context);



            },


            decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.yellow)),
              hintText: "Enter Search City",
              hintStyle: TextStyle(fontSize: 20),
              suffixIcon: Icon(Icons.search),
              label: Text("Search"),
              contentPadding: EdgeInsets.symmetric(vertical: 40),
            ),
          )
        ),
      ),

    );
  }
}

