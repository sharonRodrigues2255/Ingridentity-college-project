import 'package:college_project/view/bottom_navigation/screens/history_screen/history_screen.dart';
import 'package:college_project/view/bottom_navigation/screens/scanner_screen/scanner_screen.dart';
import 'package:college_project/view/bottom_navigation/screens/settings_screen/settings_screen.dart';
import 'package:flutter/material.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (value) {
            selectedIndex = value;
            setState(() {});
          },
          selectedItemColor: Color.fromARGB(255, 82, 69, 198),
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.qr_code_scanner), label: "Scan"),
            BottomNavigationBarItem(
                icon: Icon(Icons.access_time), label: "History"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Settings")
          ]),
    );
  }
}

List _pages = [ScannerScreen(), History(), Settings()];
int selectedIndex = 1;
