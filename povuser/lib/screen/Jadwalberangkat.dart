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
      'jarak': '5 km',
    },
    {
      'nama': 'Eurolines',
      'status': '',
      'rute': 'Manchester - Paris',
      'waktu': '3:05 PM - 7:30 PM',
      'jarak': '10 km',
    },
    {
      'nama': 'BlaBlaCar',
      'status': '',
      'rute': 'Manchester - Paris',
      'waktu': '1:40 PM - 8:40 PM',
      'jarak': '2 km',
    },
  ];

  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Filter jadwal berdasarkan tab yang dipilih

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
