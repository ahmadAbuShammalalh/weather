


import 'package:flutter/cupertino.dart';
import 'package:weather_api1/model/weather.dart';


class WeatherProvider extends ChangeNotifier{

  Weather? weather;

  setWeather(Weather weather){
    this.weather = weather;
    notifyListeners();
  }

}