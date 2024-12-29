import 'package:flutter/material.dart';

class JadwalPetePeteApp extends StatelessWidget {
  const JadwalPetePeteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: JadwalPetePeteScreen(),
      debugShowCheckedModeBanner: false,
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
      'status': 'Termurah',
      'rute': 'Manchester - Paris',
      'waktu': '1:40 PM - 8:40 PM',
      'jarak': '5 km', // Menambahkan data jarak
    },
    {
      'nama': 'Eurolines',
      'status': '',
      'rute': 'Manchester - Paris',
      'waktu': '3:05 PM - 7:30 PM',
      'jarak': '10 km', // Menambahkan data jarak
    },
    {
      'nama': 'BlaBlaCar',
      'status': '',
      'rute': 'Manchester - Paris',
      'waktu': '1:40 PM - 8:40 PM',
      'jarak': '2 km', // Menambahkan data jarak
    },
  ];

  int _selectedTabIndex = 0; // Default index untuk "Semua Jadwal"

  @override
  Widget build(BuildContext context) {
    // Filter jadwal berdasarkan tab yang dipilih
    List<Map<String, String>> filteredJadwal = _selectedTabIndex == 0
        ? jadwalPetePete
        : jadwalPetePete
            .where((jadwal) => _isTerdekat(jadwal['jarak']!))
            .toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: const Text(
            'Jadwal Pete-pete',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 17),
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
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
              itemCount: filteredJadwal.length,
              itemBuilder: (context, index) {
                final jadwal = filteredJadwal[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                jadwal['nama']!,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              if (jadwal['status']!.isNotEmpty)
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    jadwal['status']!,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            jadwal['rute']!,
                            style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            jadwal['waktu']!,
                            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                          ),
                          if (_selectedTabIndex == 1) // Menampilkan jarak hanya di tab Terdekat
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                'Jarak ke lokasi Anda: ${jadwal['jarak']}',
                                style: TextStyle(fontSize: 14, color: Colors.blue),
                              ),
                            ),
                        ],
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

  // Logika untuk memfilter jadwal yang terdekat
  bool _isTerdekat(String jarak) {
    // Mengubah data jarak dari string menjadi angka
    double distance = double.parse(jarak.split(' ')[0]);
    return distance <= 5.0; // Jadwal yang terdekat dengan jarak <= 5 km
  }
}
