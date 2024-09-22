import 'dart:convert';
import 'package:http/http.dart';
import 'package:weather_app_1/consts/urls.dart';
import 'package:weather_app_1/models/weather_model.dart';

class ApiService {
  Future<WeatherModel> getWeatherData(String searchText) async {
    String url = "$BaseUrl&q=$searchText&days=7";

    try {
      Response response = await get(Uri.parse(url));
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        WeatherModel weatherModel = WeatherModel.fromJson(json);
        return weatherModel;
      } else {
        throw "No Data found";
      }
    } catch (e) {
      print(e.toString());
      throw e.toString();
    }
  }
}
