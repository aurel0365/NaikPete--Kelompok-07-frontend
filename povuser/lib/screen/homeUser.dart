import 'package:flutter/material.dart';

class HomeScreens extends StatefulWidget {
  const HomeScreens({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: const Color(0xFF42C8DC),
                          child: const Icon(Icons.person, color: Colors.white, size: 30),
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Halo,",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "Michael Sawitto",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search, color: Colors.grey),
                      hintText: "Search",
                      contentPadding: EdgeInsets.all(16),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 40.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: 800, // Maksimal lebar gambar
                          maxHeight: 400, // Maksimal tinggi gambar
                        ),
                        child: Image.asset(
                          'assets/images/Tiket.png',
                          fit: BoxFit.cover, // Gambar tetap proporsional
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Align(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "Layanan yang anda butuhkan",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 20),
                LayoutBuilder(
                  builder: (context, constraints) {
                    int crossAxisCount = constraints.maxWidth > 600 ? 4 : 2;
                    return GridView.count(
                      crossAxisCount: crossAxisCount,
                      shrinkWrap: true,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        _buildFeatureCard(Icons.directions_bus, "Pete-pete"),
                        _buildFeatureCard(Icons.confirmation_num, "Tiket One-Day"),
                        _buildFeatureCard(Icons.route, "Rute"),
                        _buildFeatureCard(Icons.location_on, "Halte"),
                        _buildFeatureCard(Icons.schedule, "Jadwal"),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureCard(IconData icon, String label) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: const Color(0xFF42C8DC)),
            const SizedBox(height: 10),
            Text(
              label,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
