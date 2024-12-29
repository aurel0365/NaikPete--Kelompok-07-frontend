import 'package:flutter/material.dart';

class Forgotpass extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double screenWidth = constraints.maxWidth;
          double padding = screenWidth * 0.1; 
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: padding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50),
                  Text(
                    'Lupa \nKata sandi',
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      color: Color(0XFF42C8DC),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Masukkan email Anda untuk proses verifikasi,\nkami akan mengirimkan kode ke email Anda',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.normal,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 30),
                  TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      hintText: 'Masukkan Email anda',
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 15,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0XFF42C8DC),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      onPressed: () {
                      },
                      child: Text(
                        'Next',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
