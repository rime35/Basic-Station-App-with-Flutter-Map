import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tekrar_uygulamam/AnaSayfa.dart';
import 'package:tekrar_uygulamam/weather_services/weather_page.dart';
import 'package:tekrar_uygulamam/y%C3%B6nlendirme_Sayfasi.dart';
import 'drawer_deneme.dart';
import 'favorilist.dart';
import 'harita/harita.dart';

class RouteGenerator {
  static Route<dynamic>? routeGenerate(RouteSettings settings) {
    switch (settings.name) {
      case '/favorilist.dart':
        return MaterialPageRoute(
          builder: (context) => Favorites(),
        );
      case '/weather_page.dart':
        return MaterialPageRoute(builder: (context) => Weahter());
      case '/favorilist.dart':
        return MaterialPageRoute(
          builder: (context) => Favorites(),
        );
      case '/AnaSayfa.dart':
        return MaterialPageRoute(
          builder: (context) => AnaSayfa(),
        );
      case '/drawer_deneme.dart':
        return MaterialPageRoute(
          builder: (context) => DrawerKullanimi(),
        );
      case '/yönlendirme_Sayfasi.dart':
        return MaterialPageRoute(
          builder: (context) => GoogleMapsPage(),
        );
      case '/':
        return MaterialPageRoute(
          builder: (context) => AnaSayfa(),
        );
      case 'harita/harita.dart':
        return MaterialPageRoute(
          builder: (context) => Haritav2(),
        );
    }
  }
}
