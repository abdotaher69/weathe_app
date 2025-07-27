import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/screens/home_veiw.dart';

import 'cubits/get_current_weather_cubit/get_weather_cubit.dart';
import 'cubits/get_current_weather_cubit/get_weather_states.dart';
import 'models/weather_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
          builder: (context) {
            return BlocBuilder<GetWeatherCubit, WeatherState>(
              builder: (context, state) {

                  return MaterialApp(


                      debugShowCheckedModeBanner: false,
                      theme: ThemeData(

                          useMaterial3: false,
                          primarySwatch: getWeatherColor(BlocProvider
                              .of<GetWeatherCubit>(context)
                              .w2
                              ?.weatherCondition)
                      ),
                      home: HomeVeiw()

                  );

              },
            );
          }
      ),


    );
  }


}

MaterialColor getWeatherColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }

  switch (condition.toLowerCase()) {
    case 'sunny':
    case 'clear':
      return Colors.amber;

    case 'partly cloudy':
    case 'cloudy':
    case 'overcast':
      return Colors.grey;

    case 'mist':
    case 'fog':
    case 'freezing fog':
      return Colors.blueGrey;

    case 'patchy rain possible':
    case 'light rain':
    case 'moderate rain':
    case 'patchy light rain':
    case 'moderate rain at times':
    case 'heavy rain':
    case 'heavy rain at times':
    case 'light rain shower':
    case 'moderate or heavy rain shower':
    case 'torrential rain shower':
    case 'light drizzle':
    case 'patchy light drizzle':
      return Colors.blue;

    case 'freezing drizzle':
    case 'light freezing rain':
    case 'moderate or heavy freezing rain':
    case 'patchy freezing drizzle possible':
    case 'heavy freezing drizzle':
      return Colors.cyan;

    case 'light snow':
    case 'patchy light snow':
    case 'moderate snow':
    case 'heavy snow':
    case 'light snow showers':
    case 'moderate or heavy snow showers':
    case 'blizzard':
    case 'blowing snow':
      return Colors.indigo;

    case 'thundery outbreaks possible':
    case 'patchy light rain with thunder':
    case 'moderate or heavy rain with thunder':
    case 'patchy light snow with thunder':
    case 'moderate or heavy snow with thunder':
      return Colors.deepPurple;

    case 'ice pellets':
    case 'light sleet':
    case 'moderate or heavy sleet':
    case 'light sleet showers':
    case 'moderate or heavy sleet showers':
    case 'light showers of ice pellets':
    case 'moderate or heavy showers of ice pellets':
      return Colors.lightBlue;

    default:
      return Colors.teal; // fallback for unrecognized conditions
  }
}
