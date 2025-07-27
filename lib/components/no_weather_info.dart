import 'package:flutter/cupertino.dart';

class NoWeatherInfo extends StatelessWidget {
  const NoWeatherInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'No weather information available 😞\n Start Searching Now🔍',
        style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),
      ),
    );
  }
}
