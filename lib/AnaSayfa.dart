import 'package:flutter/material.dart';

class AnaSayfa extends StatelessWidget {
  const AnaSayfa({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Duude'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Image.asset('assets/images/AnaSayfa.png')),
            Padding(
              padding: EdgeInsets.fromLTRB(5, 50, 5, 20),
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Colors.green)),
                  onPressed: () {
                    Navigator.pushNamed(context, 'harita/harita.dart');
                  },
                  child: Text("Yakındaki istasyonları göster")),
            ),
          ],
        ),
      ),
    );
  }
}
