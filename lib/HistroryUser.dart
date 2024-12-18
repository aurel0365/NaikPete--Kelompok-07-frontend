import 'package:flutter/material.dart';

void main() {
  runApp(HistoryApp());
}

class HistoryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sejarah Perjalanan',
      home: HistoryScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Jumlah tab
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
          title: Text(
            'Sejarah perjalanan',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          bottom: TabBar(
            labelColor: Colors.blue, // Warna teks tab aktif
            unselectedLabelColor: Colors.grey, // Warna teks tab non-aktif
            indicatorColor: Colors.blue, // Garis bawah tab aktif
            indicatorWeight: 3.0,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            tabs: [
              Tab(text: 'Dalam perjalanan'),
              Tab(text: 'Transaksi'),
              Tab(text: 'Perjalanan selesai'),
            ],
          ),
        ),
        body: TabBarView(
          physics: BouncingScrollPhysics(), // Smooth scroll physics
          children: [
            Center(child: Text('Dalam Perjalanan')),
            TransactionHistory(),
            Center(child: Text('Perjalanan Selesai')),
          ],
        ),
      ),
    );
  }
}

// Widget untuk menampilkan history transaksi
class TransactionHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3, // Jumlah data
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: ListTile(
            contentPadding: EdgeInsets.all(12),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                'https://via.placeholder.com/80', // Ganti dengan gambar asli
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              '11 Nov, 07.00',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'MP – Jalan Boulevard\nPanakkukang – Jalan Pettarani – Jalan Veteran',
              style: TextStyle(height: 1.5),
            ),
            trailing: Text(
              'Lihat detail',
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              // Aksi ketika item ditekan
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Detail transaksi ke-${index + 1}')),
              );
            },
          ),
        );
      },
    );
  }
}
