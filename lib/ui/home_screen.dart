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
  final _textFieldController = TextEditingController();
  String queryText = "auto:ip";

  _showTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Search Location"),
            content: TextField(
              controller: _textFieldController,
              decoration: const InputDecoration(
                  hintText: "search by city, zip, lan & lat.",
                  hintStyle: TextStyle(color: Colors.grey)),
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel")),
              ElevatedButton(
                  onPressed: () {
                    if (_textFieldController.text.isEmpty) {
                      return;
                    }
                    Navigator.pop(context, _textFieldController.text);
                  },
                  child: const Text("OK")),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("My Weather App"),
        actions: [
          IconButton(
            onPressed: () async {
              _textFieldController.clear();
              String text = await _showTextInputDialog(context);
              setState(() {
                queryText = text;
              });
            },
            icon:  const Icon(Icons.search,)
          ),
          IconButton(
            onPressed: () {
              setState(() {
                queryText = "auto:ip";
              });
            },
            icon: const Icon(Icons.my_location),
          ),
        ],
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
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Weather by Hours",
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 150,
                      width: double.infinity,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: weatherModel
                                ?.forecast?.forecastday?[0].hour?.length ??
                            0,
                        itemBuilder: (context, index) {
                          Hour? hour = weatherModel
                              ?.forecast?.forecastday?[0].hour?[index];
                          return HourlyWeatherListItem(
                            hour: hour,
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Next 7 days weather",
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: weatherModel?.forecast?.forecastday?.length,
                        itemBuilder: (context, index) {
                          Forecastday? forecastday =
                              weatherModel?.forecast?.forecastday?[index];
                          return FutureForcastListitem(
                            forecastday: forecastday,
                          );
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
          future: apiService.getWeatherData(queryText),
        ),
      ),
    );
  }
}
