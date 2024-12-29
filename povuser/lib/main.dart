import 'package:flutter/material.dart';
import 'package:pov_user/screen/homeUser.dart';
void main() {
  runApp(const PetePeteApp());
}

class PetePeteApp extends StatelessWidget {
  const PetePeteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF42C8DC),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: HomeScreen(),
    );
  }
}