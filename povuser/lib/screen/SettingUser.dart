import 'package:flutter/material.dart';
import 'HistroryUser.dart';
import 'ProfileUser.dart';

class AccountUser extends StatelessWidget {
  const AccountUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF), // Latar belakang putih
      appBar: AppBar(
        title: const Text(
          'Account User',
          style: TextStyle(color: Color(0xFF000000)), // Teks hitam
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFFFFFFF), // Latar belakang putih
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF000000)), // Ikon hitam
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profil Pengguna
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/profile.jpg'), // Ganti dengan path gambar Anda
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Text(
                            'Aurelia Nata',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color(0xFF000000), // Teks hitam
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(
                            Icons.edit,
                            color: Color(0xFF42C8DC), // Ikon biru
                            size: 20,
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'aureldjijd@gmail.com',
                        style: TextStyle(color: Colors.grey[700]), // Warna teks abu-abu
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Menu Pengaturan
            SettingItem(
              icon: Icons.settings,
              title: 'My profile',
              iconColor: const Color(0xFF42C8DC), // Ikon biru
              textColor: const Color(0xFF000000), // Teks hitam
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  EditProfileScreen(),
                  ),
                );
              },
            ),
            SettingItem(
              icon: Icons.account_balance_wallet,
              title: 'History',
              iconColor: const Color(0xFF42C8DC), // Ikon biru
              textColor: const Color(0xFF000000), // Teks hitam
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  HistoryScreen(),
                  ),
                );
              },
            ),
            SettingItem(
              icon: Icons.people,
              title: 'FAQ',
              iconColor: const Color(0xFF42C8DC), // Ikon biru
              textColor: const Color(0xFF000000), // Teks hitam
              onTap: () {
                // Tambahkan navigasi
              },
            ),
            const Spacer(),

            // Logout Button
            SettingItem(
              icon: Icons.logout,
              title: 'Logout',
              iconColor: const Color(0xFF42C8DC), // Ikon biru
              textColor: const Color(0xFF000000), // Teks hitam
              onTap: () {
                // Tambahkan logika logout
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Widget untuk item menu setting
class SettingItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color iconColor;
  final Color textColor;
  final VoidCallback onTap;

  const SettingItem({
    required this.icon,
    required this.title,
    this.iconColor = const Color(0xFF42C8DC), // Default warna ikon biru
    this.textColor = const Color(0xFF000000), // Default warna teks hitam
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: iconColor.withOpacity(0.1), // Latar belakang ikon transparan
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: iconColor, // Warna ikon
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: textColor, // Warna teks
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: Colors.grey,
      ),
      onTap: onTap,
    );
  }
}
