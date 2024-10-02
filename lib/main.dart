import 'package:flutter/material.dart';
import 'package:weather_app_1/ui/home_screen.dart';

void main() {
  runApp(const MyWeatherApp());
}

class MyWeatherApp extends StatelessWidget {
  const MyWeatherApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return   const MaterialApp(
      title: "My Weather App",
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}



