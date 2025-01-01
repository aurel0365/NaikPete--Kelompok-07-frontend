import 'package:flutter/material.dart';
import 'package:flutter_pete/screens/schedulemaps_screen.dart';
import 'package:latlong2/latlong.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TrayekListScreen(),
    );
  }
}

class TrayekListScreen extends StatelessWidget {
  final List<Map<String, dynamic>> trayekList = [
    {
      'time': '07.30',
      'name': 'Trayek A',
      'description': 'MP – Jalan Boulevard Panakkukang – Jalan Pettarani – Jalan Dr. Ratulangi',
      'location': LatLng(-5.147665, 119.432731),
    },
    {
      'time': '08.30',
      'name': 'Trayek B',
      'description': 'MP – Jalan Sudirman – Jalan Pettarani – Jalan Alauddin',
      'location': LatLng(-5.144500, 119.436000),
    },
    {
      'time': '09.30',
      'name': 'Trayek C',
      'description': 'MP – Jalan Veteran – Jalan AP Pettarani – Jalan Dr. Ratulangi',
      'location': LatLng(-5.139072, 119.417488),
    },
    {
      'time': '10.30',
      'name': 'Trayek D',
      'description': 'MP – Jalan Boulevard Panakkukang – Jalan Alauddin',
      'location': LatLng(-5.135825, 119.429993),
    },
    {
      'time': '11.30',
      'name': 'Trayek E',
      'description': 'MP – Jalan Perintis – Jalan AP Pettarani – Jalan Urip Sumoharjo',
      'location': LatLng(-5.131532, 119.438939),
    },
  ];

  void navigateToMap(BuildContext context, Map<String, dynamic> trayek) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MapScreen(
          trayekName: trayek['name'],
          description: trayek['description'],
          location: trayek['location'],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jadwal dan Trayek'),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: trayekList.length,
        itemBuilder: (context, index) {
          final trayek = trayekList[index];
          return GestureDetector(
            onTap: () => navigateToMap(context, trayek),
            child: Card(
              margin: EdgeInsets.all(8.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.directions_bus,
                      size: 40,
                      color: Colors.blue,
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          trayek['time'],
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          trayek['name'],
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '1.5 km halte terdekat dari lokasimu',
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(height: 4),
                        Text(
                          trayek['description'],
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}