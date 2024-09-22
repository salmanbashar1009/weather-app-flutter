import 'package:flutter/material.dart';
import 'package:flutter_weather_bg_null_safety/flutter_weather_bg.dart';
import 'package:weather_app_1/models/weather_model.dart';

class TodaysWeather extends StatelessWidget {
 final WeatherModel? weatherModel;
  const TodaysWeather({super.key, this.weatherModel});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WeatherBg(weatherType: WeatherType.heavyRainy, width: MediaQuery.of(context).size.width,  height: 300),
      ],
    );
  }
}
