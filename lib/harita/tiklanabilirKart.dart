import 'dart:math';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:latlong2/latlong.dart';
import 'harita.dart';

class TiklanabilirKart extends StatelessWidget {
  TiklanabilirKart({super.key});
  List<LatLng> pinler = [
    LatLng(41.02476500000003, 40.51690378888888),
    LatLng(41.02376500000003, 40.51703799999999),
    LatLng(41.02576500000003, 40.516803799999999),
    LatLng(41.02676500000003, 40.52603799999999),
    LatLng(41.02476500000003, 40.51690378888888),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade100,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: Column(
          /* mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start, */
          children: [
            Center(
              child: Text(
                'Ümraniye şarj istasyonu',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.wc_sharp,
                  color: Colors.green,
                  size: 40,
                ),
                SizedBox(
                  height: 50,
                ),
                Icon(
                  Icons.medical_information_sharp,
                  color: Colors.red,
                  size: 40,
                ),
                SizedBox(
                  height: 20,
                ),
                Icon(
                  Icons.food_bank_sharp,
                  color: Colors.red,
                  size: 40,
                ),
                SizedBox(
                  height: 20,
                ),
                Icon(
                  Icons.charging_station_sharp,
                  color: Colors.red,
                  size: 40,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              /* crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end, */
              children: [
                TextButton(
                    onPressed: () {
                      googleMaps(context, pinler.last);
                    },
                    child: Text(
                      'Google Haritalarda göster',
                      textAlign: TextAlign.center,
                      selectionColor: Colors.green,
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_forward_outlined))
              ],
            )
          ],
        ),
      ),
    );
  }
}

void googleMaps(BuildContext context, LatLng konum) async {
  Uri googleUrl = Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=${konum.latitude},${konum.longitude}');
  if (await canLaunchUrl(googleUrl)) {
    await launchUrl(googleUrl);
  } else {
    throw 'Could not open the map.';
  }
}
