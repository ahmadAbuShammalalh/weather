import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_api1/provider/weather_provider.dart';
import 'package:weather_api1/screens/search_page.dart';

class HomePage extends StatelessWidget {
  bool flog = true;

  @override
  Widget build(BuildContext context) {
    var weatherProvider = Provider.of<WeatherProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: (weatherProvider.weather==null)?Colors.blue:weatherProvider.weather!.getColor(),
        title: const Text('Weather App'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SearchPage()));
              },
              icon: const Icon(
                Icons.search,
              )),
        ],
      ),
      body: (weatherProvider.weather==null)
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'there are no weather',
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(
                    'Start search !!',
                    style: TextStyle(fontSize: 25),
                  ),
                ],
              ),
            )
          : Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                   weatherProvider.weather!.getColor().shade200,
                    weatherProvider.weather!.getColor().shade400,
                    weatherProvider.weather!.getColor().shade500,
                    weatherProvider.weather!.getColor().shade600,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              child: Column(
                children: [
                  Spacer(flex: 2,),
                    Text(
                    '${weatherProvider.weather!.name}',
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                   Text(
                    'up dated : ${DateTime.now().hour} pm',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('${weatherProvider.weather!.getIcon()}'),
                       Text(
                        '${weatherProvider.weather!.temp}',
                        style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Column(
                        children:  [
                          Text(
                            'min temp : ${weatherProvider.weather!.temp_min}',
                            style: const TextStyle(fontSize: 13),
                          ),
                           Text(
                            'max temp : ${weatherProvider.weather!.temp_max}',
                            style: const TextStyle(fontSize: 13),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                   Text(
                    ' ${weatherProvider.weather!.main}',
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(flex: 3,),
                ],
              ),
            ),
    );
  }
}
