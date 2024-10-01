import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_1/models/weather_model.dart';

class HourlyWeatherListItem extends StatelessWidget {
  const HourlyWeatherListItem({super.key, this.hour});

  final Hour? hour;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.white24, borderRadius: BorderRadius.circular(20),),
      child: Column(
      ),
    );
  }
}
