import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_api1/provider/weather_provider.dart';
import 'package:weather_api1/screens/home_page.dart';
import 'package:weather_api1/screens/search_page.dart';



void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context){
      return WeatherProvider();
     },
      child:MaterialApp(
        debugShowCheckedModeBanner: false,
        home:HomePage(),
      ) ,
    );
  }
}
