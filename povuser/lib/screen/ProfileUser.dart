import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'My Profile',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/profile_image.jpg'), // Ganti dengan path gambar Anda
                ),
                Positioned(
                  bottom: 0,
                  right: 4,
                  child: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.camera_alt, color: Colors.white, size: 20),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            _buildTextField(label: 'Full Name', icon: Icons.person, initialValue: 'Coding with T'),
            SizedBox(height: 16),
            _buildTextField(label: 'E-Mail', icon: Icons.email, initialValue: 'support@codingwitht.com'),
            SizedBox(height: 16),
            _buildTextField(label: 'Phone No', icon: Icons.phone, initialValue: '+92 317 8059528'),
            SizedBox(height: 16),
            _buildTextField(label: 'Password', icon: Icons.lock, initialValue: '********', obscureText: true),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 64.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text('Edit Profile', style: TextStyle(color: Colors.white, fontSize: 16.0)),
            ),
            SizedBox(height: 24),
            Text('Joined 31 October 2022', style: TextStyle(color: Colors.grey, fontSize: 14.0)),
            SizedBox(height: 12),
            TextButton(
              onPressed: () {},
              child: Text('Delete', style: TextStyle(color: Colors.red, fontSize: 14.0)),
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
          prefixIcon: Icon(icon, color: Colors.blue),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          filled: true,
          fillColor: Colors.grey[100],
        ),
        controller: TextEditingController(text: initialValue),
      ),
    );
  }
}
