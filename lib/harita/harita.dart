import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../drawer_deneme.dart';
import '../weather_services/weather.dart';
import 'tiklanabilirKart.dart';
import 'package:weather/weather.dart';

class HaritaLokasyon extends StatelessWidget {
  HaritaLokasyon({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

class Haritav2 extends StatefulWidget {
  Haritav2({super.key});

  @override
  State<Haritav2> createState() => _Haritav2State();
}

class _Haritav2State extends State<Haritav2> {
  List<LatLng> pinlistesi = [
    LatLng(41.02476500000003, 40.51690378888888),
    LatLng(41.02376500000003, 40.51703799999999),
    LatLng(41.02576500000003, 40.516803799999999),
    LatLng(41.02676500000003, 40.52603799999999),
    LatLng(41.02476500000003, 40.51690378888888),
  ];

  MapController mapController = MapController();
  double currentZoom = 10.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                buildHeader(context),
                buildMenuItems(context),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.green,
          centerTitle: true,
          title: Text(
            'Harita',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        body: Center(
          child: Container(
            child: FlutterMap(
              options: MapOptions(
                center: LatLng(41.02807600000001, 40.51016699999999),
                zoom: currentZoom,
                onPositionChanged: (position, hasGesture) {
                  currentZoom = position.zoom!;
                },
              ),
              layers: [
                TileLayerOptions(
                  urlTemplate:
                      'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                  subdomains: ['a', 'b', 'c'],
                ),
                MarkerLayerOptions(
                  markers: pinlistesi
                      .map((maps) => Marker(
                          point: maps,
                          builder: (context) => IconButton(
                              onPressed: () => showModalBottomSheet(
                                  context: context,
                                  builder: (context) => Container(
                                        height: 200,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: TiklanabilirKart(),
                                      )),
                              icon: Icon(
                                Icons.location_on,
                                size: 40,
                                color: Colors.red,
                              ))))
                      .toList(),
                ),
              ],
              mapController: mapController,
            ),
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                double newZoom = (mapController.zoom ?? currentZoom) - 1.0;
                mapController.move(
                  mapController.center,
                  newZoom,
                );
                currentZoom = newZoom;
              },
              child: Icon(Icons.remove),
              backgroundColor: Colors.green,
            ),
          ],
        ));
  }

  Drawer? DraverFonk() {
    Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            buildHeader(context),
            buildMenuItems(context),
          ],
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) => Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      );
  Widget buildMenuItems(BuildContext context) => Column(
        children: [
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: Text('home'),
            onTap: () {
              Navigator.pushNamed(context, '/AnaSayfa.dart');
            },
          ),
          ListTile(
            leading: const Icon(Icons.favorite_border),
            title: Text('Favoirets'),
            onTap: () {
              Navigator.pushNamed(context, '/favorilist.dart');
            },
          ),
          ListTile(
            leading: const Icon(Icons.workspaces_outline),
            title: Text('Hava Durumu'),
            onTap: () {
              Navigator.pushNamed(context, '/weather_page.dart');
            },
          ),
          ListTile(
            leading: const Icon(Icons.update),
            title: Text('Updates'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.account_tree_outlined),
            title: Text('Plugins'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.notification_add_outlined),
            title: Text('Notifications'),
            onTap: () {},
          ),
        ],
      );
}
