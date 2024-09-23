import 'package:flutter/material.dart';
import 'package:weather_app_1/models/weather_model.dart';
import 'package:weather_app_1/services/api_service.dart';
import 'package:weather_app_1/ui/components/todays_weather.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("My Weather App"),
      ),
      body: SafeArea(
        child: FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              WeatherModel? weatherModel = snapshot.data;
              return SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    TodaysWeather(
                      weatherModel: weatherModel,
                    ),
                  ],
                ),
              );
            }
            if (snapshot.hasError) {
              return const Center(
                child: Text("Error has occurred!"),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          future: apiService.getWeatherData("Dhaka"),
        ),
      ),
    );
  }
}
