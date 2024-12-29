import 'package:flutter/material.dart';
import 'ProfileUser.dart';

class AccountUser extends StatelessWidget {
  const AccountUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaturan'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        elevation: 4,
        iconTheme: const IconThemeData(color: Colors.white),
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
                color: Colors.blueGrey[50],
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.person, size: 40, color: Colors.white),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Aurelia Nata',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'aureldjijd@gmail.com',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Menu Pengaturan
            const Divider(),
            SettingItem(
              icon: Icons.person_outline,
              title: 'Profile Saya',
              onTap: () {
                // Navigasi ke halaman "Profile Saya"
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Profileuser(),
                  ),
                );
              },
            ),
            SettingItem(
              icon: Icons.history,
              title: 'Riwayat',
              onTap: () {
                // Navigasi ke halaman "Riwayat"
              },
            ),
            SettingItem(
              icon: Icons.question_answer,
              title: 'FAQ',
              onTap: () {
                // Navigasi ke halaman "FAQ"
              },
            ),
            const Spacer(),

            // Logout Button
            SettingItem(
              icon: Icons.logout,
              title: 'Keluar',
              iconColor: Colors.red,
              textColor: Colors.red,
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
    this.iconColor = Colors.black,
    this.textColor = Colors.black,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: iconColor,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: textColor,
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
