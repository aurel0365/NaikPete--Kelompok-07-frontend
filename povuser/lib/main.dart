import 'package:flutter/material.dart';

import 'screen/Jadwalberangkat.dart';
import 'screen/SettingUser.dart';
import 'screen/TiketUser.dart';
import 'screen/homeUser.dart';
import 'widget/BottomBar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Naik Pete App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,  // Disable debug banner
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Set the selectedIndex to 0 initially to open the HomeScreen first
  int _selectedIndex = 0;

  // Define the list of pages/screens
  final List<Widget> _pages = [
    HomeScreens(),
    Jadwalberangkat(),
    TicketScreen(),
    AccountUser(),
  ];

  // Method to handle tab change
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,  // Set AppBar height to 0 if you don't need it
      ),
      // Wrap the body content in SafeArea to avoid any issues with notches or safe areas
      body: SafeArea(
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,  // Handle tab change
      ),
    );
  }
}
