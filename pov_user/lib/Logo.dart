import 'package:alp_naikpete/splashscreen.dart';
import 'package:flutter/material.dart';

class Logo extends StatefulWidget {
  @override
  _LogoState createState() => _LogoState();
}

class _LogoState extends State<Logo> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MySplashScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/logo.png', // Replace with your logo
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}