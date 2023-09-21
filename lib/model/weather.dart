


 import 'package:flutter/material.dart';

class Weather {

   String? main;
   String? name;
   double? temp;
   double? temp_max;
   double? temp_min;
   String? description;

   Weather({
     this.main,
     this.name,
     this.temp,
     this.temp_max,
     this.temp_min,
     this.description
   });

   factory Weather.fromjson(Map<String, dynamic>responseBody){
     return Weather(
         name: responseBody["name"],
         description: responseBody["weather"][0]["description"],
         temp_max: responseBody["main"]["temp_max"],
         temp_min: responseBody["main"]["temp_min"],
         main: responseBody["weather"][0]["main"],
         temp: responseBody["main"]["temp"]
     );
   }

   getColor() {
     if (this.main!.toLowerCase() == 'clear') {
       return Colors.yellow;
     }
     else if(this.main!.toLowerCase() == 'clouds'){
       return Colors.blue;
     }
   }

   getIcon() {
     if (this.description!.toLowerCase() == '	clear sky') {
       return 'images/clear.png';
     }
     else if(this.description!.toLowerCase() == '	few clouds') {
       return 'images/icon2.png';
     }
     else if(this.description!.toLowerCase() == 'scattered clouds') {
       return 'images/icon3.png';
     }
     else
       return 'images/icon3.png';

   }

 }