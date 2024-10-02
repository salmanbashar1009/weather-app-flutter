import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_1/models/weather_model.dart';

class FutureForcastListitem extends StatelessWidget {
  const FutureForcastListitem({super.key, this.forecastday});

  final Forecastday? forecastday;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Colors.white24,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Row(
        children: [
          Image.network(
              "https:${forecastday?.day?.condition?.icon.toString()}"),
          Expanded(
            child: Text(
              DateFormat.MMMEd()
                  .format(DateTime.parse(forecastday?.date.toString() ?? " ")),
              style: const TextStyle(color: Colors.white),
            ),
          ),
          Expanded(
            child: Text(
              forecastday?.day?.condition?.text ?? " ",
              style: const TextStyle(color: Colors.white),
            ),
          ),
          Expanded(
            child: Text(
              "${forecastday?.day?.maxtempC?.round().toString()}/${forecastday?.day?.mintempC?.round().toString()}",
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
