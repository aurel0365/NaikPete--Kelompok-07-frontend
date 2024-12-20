import 'package:flutter/material.dart';
import '../widgets/custom_textfield.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // Controllers untuk input data
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController referralController = TextEditingController();

  // Fungsi untuk mengirim data ke backend
  void register() async {
    // TODO: Hubungkan ini ke backend menggunakan HTTP request (POST)
    print("Registrasi data dikirim ke backend");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Isi Data',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text('Daftar menjadi mitra NaikPete\'', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 20),
            CustomTextField(hintText: 'Nama depan', controller: firstNameController),
            CustomTextField(hintText: 'Nama belakang', controller: lastNameController),
            CustomTextField(hintText: 'Nomor telepon', controller: phoneController),
            CustomTextField(hintText: 'Kota', controller: cityController),
            CustomTextField(hintText: 'Password', isPassword: true, controller: passwordController),
            CustomTextField(hintText: 'Referral code', controller: referralController),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.cyan,
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              onPressed: register,
              child: const Text('Selanjutnya', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
