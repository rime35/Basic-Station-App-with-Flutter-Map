import 'package:flutter/material.dart';
import 'package:tekrar_uygulamam/weather_services/weather.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather/weather.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Weahter extends StatelessWidget {
  const Weahter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Container(
      child: MyHomePage(),
    )));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final cityNameController = TextEditingController();
  final weatherService = WeatherService();
  WeatherModel? weather;
  void getWeatherData() async {
    try {
      final cityName = cityNameController.text;
      final data = await weatherService.getWeather(cityName);
      setState(() {
        weather = data;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hava durumu'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: cityNameController,
              decoration: InputDecoration(labelText: 'Şehir Adı'),
            ),
            ElevatedButton(
                onPressed: () {
                  getWeatherData();
                },
                child: Text('HAVA DURUMUNU GÖSTER')),
            if (weather != null)
              Column(
                children: [
                  Text('Şehir: ${weather!.cityName}'),
                  Text('Sıcaklık: ${weather!.temp.toString()}°C'),
                  Text('Durum: ${weather!.description}'),
                  Image.network(
                      'https://openweathermap.org/img/w/${weather!.icon}.png'),
                ],
              )
          ],
        ),
      ),
    );
  }
}

class WeatherService {
  final String baseUrl =
      'https://api.openweathermap.org/data/2.5/weather?units=metric&appid=8a34741d4b118e736c2df3c8e1264529';

  Future<WeatherModel> getWeather(String cityName) async {
    final url = '$baseUrl&q=$cityName';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return WeatherModel.fromJson(json);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
