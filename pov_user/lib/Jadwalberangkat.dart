import 'package:flutter/material.dart';

class JadwalPetePeteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: JadwalPetePeteScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class JadwalPetePeteScreen extends StatelessWidget {
  final List<Map<String, String>> jadwalPetePete = [
    {
      'rute': 'Pasar Sentral - Mall Ratu Indah',
      'waktu': '08:00 - 10:00',
    },
    {
      'rute': 'Panakkukang - Kampus UNM',
      'waktu': '09:30 - 11:30',
    },
    {
      'rute': 'Bandara - Karebosi',
      'waktu': '12:00 - 14:00',
    },
    {
      'rute': 'Mall Phinisi Point - Pantai Losari',
      'waktu': '15:00 - 17:00',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jadwal Pete-Pete'),
        backgroundColor: Colors.lightBlue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Cek Jadwal Keberangkatan',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: jadwalPetePete.length,
                itemBuilder: (context, index) {
                  final jadwal = jadwalPetePete[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.directions_bus,
                        color: Colors.lightBlue,
                      ),
                      title: Text(
                        jadwal['rute']!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text('Waktu: ${jadwal['waktu']}'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
