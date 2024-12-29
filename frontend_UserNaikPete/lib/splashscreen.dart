import 'package:flutter/material.dart';

class MySplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0), // Padding kiri dan kanan
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center, // Rata tengah
              children: [
                Text(
                  'Selamat datang di NaikPete',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center, // Teks rata tengah
                ),
                SizedBox(height: 20), // Jarak yang lebih besar
                Text(
                  'Silahkan memilih anda ingin masuk sebagai?',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center, // Teks rata tengah
                ),
                SizedBox(height: 30), // Jarak antara teks dan tombol
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF42C8DC),
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12), // Sedikit lebih besar
                    minimumSize: Size(200, 50), // Tombol sedikit lebih besar
                  ),
                  onPressed: () {
                    print('Masuk sebagai Pengemudi');
                  },
                  child: Text('Masuk sebagai Pengemudi'),
                ),
                SizedBox(height: 15), // Jarak antar tombol
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF42C8DC),
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12), // Sedikit lebih besar
                    minimumSize: Size(200, 50), // Tombol sedikit lebih besar
                  ),
                  onPressed: () {
                    print('Masuk sebagai Penumpang');
                  },
                  child: Text('Masuk sebagai Penumpang'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
