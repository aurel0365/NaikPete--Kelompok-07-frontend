import 'package:flutter/material.dart';

class JadwalPetePeteApp extends StatelessWidget {
  const JadwalPetePeteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const JadwalPetePeteScreen()),
            );
          },
          child: const Text('Lihat Jadwal Pete-pete'),
        ),
      ),
    );
  }
}

class JadwalPetePeteScreen extends StatefulWidget {
  const JadwalPetePeteScreen({super.key});

  @override
  _JadwalPetePeteScreenState createState() => _JadwalPetePeteScreenState();
}

class _JadwalPetePeteScreenState extends State<JadwalPetePeteScreen> {
  final List<Map<String, String>> jadwalPetePete = [
    {
      'nama': 'Pete-pete A',
      'rute': 'Manchester - Paris',
      'waktu': '1:40 PM',
    },
    {
      'nama': 'Pete-pete B',
      'rute': 'Liverpool - London',
      'waktu': '3:05 PM',
    },
    {
      'nama': 'Pete-pete C',
      'rute': 'Berlin - Munich',
      'waktu': '5:00 PM',
    },
  ];

  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          'Jadwal Pete-pete',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 17),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            color: Colors.black,
            height: 100,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildTabItem('Semua Jadwal', 0),
                  _buildTabItem('Terdekat', 1),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: jadwalPetePete.length,
              itemBuilder: (context, index) {
                final jadwal = jadwalPetePete[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    title: Text(
                      jadwal['nama']!,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Tujuan: ${jadwal['rute']}'),
                        Text('Waktu: ${jadwal['waktu']}'),
                      ],
                    ),
                    trailing: ElevatedButton(
                      onPressed: () {
                        // Tampilkan detail jadwal
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Row(
                              children: [
                                Text('Detail ${jadwal['nama']}'),
                                const Spacer(),
                                IconButton(
                                  icon: const Icon(Icons.close),
                                  onPressed: () => Navigator.pop(context),
                                ),
                              ],
                            ),
                            content: Text('Rute: ${jadwal['rute']}\nWaktu: ${jadwal['waktu']}'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  // Tambahkan logika untuk melihat lokasi
                                  Navigator.pop(context);
                                },
                                child: const Text('Lihat Lokasi'),
                              ),
                            ],
                          ),
                        );
                      },
                      child: const Text('Detail'),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabItem(String title, int index) {
    bool isSelected = _selectedTabIndex == index;

    return InkWell(
      onTap: () {
        setState(() {
          _selectedTabIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        decoration: BoxDecoration(
          border: isSelected
              ? Border.all(color: Colors.blue, width: 2)
              : null,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey,
            fontSize: 16,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const JadwalPetePeteApp());
}
