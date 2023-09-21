

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_api1/model/weather.dart';


class WeatherModel{

 Future <Weather> getWeather(String cityName)async{
    String url ='https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=c904f8d947cb2ba2de575acd525c4280';
    http.Response  response =  await http.get(Uri.parse(url));
     Map<String,dynamic>  responseBody = jsonDecode(response.body);
    Weather weather = Weather.fromjson(responseBody);
   return weather;
  }

}
