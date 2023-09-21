import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:weather/weather.dart';

class WeatherModel {
  final String cityName;
  final double temp;
  final String description;
  final String icon;
  WeatherModel(this.cityName, this.temp, this.description, this.icon);
  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      json['name'],
      json['main']['temp'],
      json['weather'][0]['description'],
      json['weather'][0]['icon'],
    );
  }
}
