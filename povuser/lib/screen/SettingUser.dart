import 'package:flutter/material.dart';
import 'FaqUser.dart';
import 'HistroryUser.dart';
import 'ProfileUser.dart';

class AccountUser extends StatelessWidget {
  const AccountUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9), // Latar belakang abu-abu muda
      appBar: AppBar(
        title: const Text(
          'Account User',
          style: TextStyle(
            color: Color(0xFF42C8DC),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFFFFFFF), // Latar belakang putih
        elevation: 1,
        iconTheme: const IconThemeData(color: Color(0xFF000000)), // Ikon hitam
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profil Pengguna
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
            const SizedBox(height: 32),

            // Menu Pengaturan
            SettingItem(
              icon: Icons.settings,
              title: 'My Profile',
              iconColor: const Color(0xFF42C8DC), // Ikon biru
              textColor: const Color(0xFF000000), // Teks hitam
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditProfileScreen(),
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
                    builder: (context) => HistoryScreen(),
                  ),
                );
              },
            ),
            SettingItem(
              icon: Icons.help_outline,
              title: 'FAQ',
              iconColor: const Color(0xFF42C8DC), // Ikon biru
              textColor: const Color(0xFF000000), // Teks hitam
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FAQPage(),
                  ),
                );
              },
            ),
            const Spacer(),

            // Logout Button
            SettingItem(
              icon: Icons.logout,
              title: 'Logout',
              iconColor: const Color(0xFFD9534F), // Ikon merah
              textColor: const Color(0xFFD9534F), // Teks merah
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
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
      ),
    );
  }
}
