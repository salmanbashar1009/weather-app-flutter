import 'package:flutter/material.dart';
import 'package:weather_app_1/models/weather_model.dart';
import 'package:weather_app_1/services/api_service.dart';
import 'package:weather_app_1/ui/components/future_forcast_list_item.dart';
import 'package:weather_app_1/ui/components/hourly_weather_list_item.dart';
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
                    const SizedBox(height: 10,),
                    const Text("Weather by Hours", style: TextStyle(color: Colors.white,fontSize: 24),),
                    const SizedBox(height: 10,),
                    SizedBox(
                      height: 150,
                      width: double.infinity,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: weatherModel?.forecast?.forecastday?[0].hour?.length ?? 0,
                        itemBuilder: (context, index){
                          Hour? hour = weatherModel?.forecast?.forecastday?[0].hour?[index];
                          return HourlyWeatherListItem(hour: hour,) ;
                        },
                      ),
                    ),
                    const SizedBox(height: 10,),
                    const Text("Next 7 days weather", style: TextStyle(color: Colors.white,fontSize: 24),),
                    const SizedBox(height: 10,),
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: weatherModel?.forecast?.forecastday?.length,
                        itemBuilder: (context, index){
                          Forecastday? forecastday = weatherModel?.forecast?.forecastday?[index];
                          return FutureForcastListitem(forecastday: forecastday ,);
                        },
                      ),
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
