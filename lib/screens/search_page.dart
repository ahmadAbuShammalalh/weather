


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_api1/provider/weather_provider.dart';
import '../model/weather_model.dart';

class SearchPage extends StatelessWidget {
 String? cityName;
 TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var weatherProvider = Provider.of<WeatherProvider>((context));
    return Scaffold(
      appBar: AppBar(
        title: const Text('search city'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children:  [
            const SizedBox(height: 50),
            TextFormField(
              style: const TextStyle(fontSize: 25),
              onEditingComplete: ()async{
                cityName =controller.text;
                WeatherModel weatherModel =WeatherModel();
                 weatherProvider.setWeather(await weatherModel.getWeather(cityName!),);
                 Navigator.of(context).pop();
              },
              controller: controller,
              decoration:  InputDecoration(
                border: const OutlineInputBorder(),
                    hintText: 'Enter city Name',
                     labelText: 'city Name',
                     labelStyle: const TextStyle(
                       fontSize: 25
                     ),
                     hintStyle: const TextStyle(
                       fontSize:25
                     ),
                suffix: IconButton(onPressed: (){}, icon: const Icon(Icons.search))

              ),
            ),

          ],
        ),
      ),
    );
  }
}
