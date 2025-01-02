import 'package:flutter/material.dart';

class JadwalPetePeteApp extends StatelessWidget {
  const JadwalPetePeteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF42C8DC),
        fontFamily: 'Roboto',
      ),
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
        backgroundColor: const Color(0xFF42C8DC),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const JadwalPetePeteScreen(),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF42C8DC),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: const Text(
            'Lihat Jadwal Pete-pete',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
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
        backgroundColor: const Color(0xFF42C8DC),
        elevation: 0,
        title: const Text(
          'Jadwal Pete-pete',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),

        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            color: const Color.fromARGB(255, 237, 237, 237),
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildTabItem('Semua Jadwal', 0),
                _buildTabItem('Terdekat', 1),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: jadwalPetePete.length,
              itemBuilder: (context, index) {
                final jadwal = jadwalPetePete[index];
                return AnimatedPadding(
                  duration: const Duration(milliseconds: 300),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 5,
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16),
                      title: Text(
                        jadwal['nama']!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Color(0xFF42C8DC),
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 8),
                          Text('Tujuan: ${jadwal['rute']}'),
                          const SizedBox(height: 4),
                          Text('Waktu: ${jadwal['waktu']}'),
                        ],
                      ),
                      trailing: ElevatedButton(
                        onPressed: () {
                          _showDetailDialog(context, jadwal);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF42C8DC),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Detail',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
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
    final bool isSelected = _selectedTabIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTabIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 8,
                  ),
                ]
              : [],
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? const Color(0xFF42C8DC) : Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  void _showDetailDialog(BuildContext context, Map<String, String> jadwal) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Text(
          'Detail ${jadwal['nama']}',
          style: const TextStyle(color: Color(0xFF42C8DC), fontWeight: FontWeight.bold),
        ),
        content: Text(
          'Rute: ${jadwal['rute']}\nWaktu: ${jadwal['waktu']}',
          style: const TextStyle(color: Colors.black, fontSize: 16),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Tutup',
              style: TextStyle(color: Color(0xFF42C8DC), fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
