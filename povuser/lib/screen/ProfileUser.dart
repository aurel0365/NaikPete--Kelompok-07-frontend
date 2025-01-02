import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Latar belakang putih
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color.fromARGB(255, 255, 255, 255)), // Ikon putih dengan kode hex
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'My Profile',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                const CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/profile_image.jpg'), // Ganti dengan path gambar Anda
                ),
                Positioned(
                  bottom: 0,
                  right: 4,
                  child: Container(
                    height: 35,
                    width: 35,
                    decoration: const BoxDecoration(
                      color: Color(0xFF42C8DC), // Biru utama
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.camera_alt, color: Colors.white, size: 20), // Ikon putih
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            _buildTextField(
              label: 'Full Name',
              icon: Icons.person,
              initialValue: 'Coding with T',
            ),
            const SizedBox(height: 16),
            _buildTextField(
              label: 'E-Mail',
              icon: Icons.email,
              initialValue: 'support@codingwitht.com',
            ),
            const SizedBox(height: 16),
            _buildTextField(
              label: 'Phone No',
              icon: Icons.phone,
              initialValue: '+92 317 8059528',
            ),
            const SizedBox(height: 16),
            _buildTextField(
              label: 'Password',
              icon: Icons.lock,
              initialValue: '********',
              obscureText: true,
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF42C8DC), // Biru utama
                padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 64.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Text(
                'Edit Profile',
                style: TextStyle(color: Colors.white, fontSize: 16.0), // Teks putih
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Joined 31 October 2022',
              style: TextStyle(color: Colors.grey, fontSize: 14.0), // Teks abu-abu
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Delete',
                style: TextStyle(color: Colors.red, fontSize: 14.0), // Teks merah untuk aksi hapus
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required IconData icon,
    required String initialValue,
    bool obscureText = false,
  }) {
    return SizedBox(
      height: 56,
      child: TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: const Color(0xFF42C8DC)), // Ikon dengan warna biru utama
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          filled: true,
          fillColor: Colors.grey[100], // Latar belakang input abu-abu muda
        ),
        controller: TextEditingController(text: initialValue),
      ),
    );
  }
}
