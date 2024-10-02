import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
        color: Colors.white24,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  hour?.tempC?.round().toString() ?? ' ',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Text("o",style: TextStyle(color: Colors.white),),
            ],
          ),
          Container(
            decoration: const BoxDecoration(shape: BoxShape.circle,color: Colors.teal),
            height: 50,
            child: Image.network("https:${hour?.condition?.icon.toString()}"),
          ),
          Text(DateFormat.j().format(DateTime.parse(hour?.time?.toString() ?? " ",),),style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              ),)
        ],
      ),
    );
  }
}
