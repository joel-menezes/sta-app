import 'package:flutter/material.dart';
import 'package:staapp/screens/home_page.dart';
import 'package:staapp/screens/menu_page.dart';
import 'package:staapp/screens/song_request.dart';
import 'package:staapp/screens/profile.dart';
import 'package:staapp/theme/theme.dart';
import 'package:staapp/theme/styles.dart';
import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'dart:io';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    return MaterialApp(
      title: 'St. Augustine CHS App',
      theme: (MediaQuery.sizeOf(context).width == 1920
          ? lightThemeTV
          : (MediaQuery.sizeOf(context).width < Styles.phoneWidth
              ? lightThemePhone
              : lightThemeLaptop)),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      home: const MainNavigation(),
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0; // Tracks the currently selected tab

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _screens = [
      HomePage(changeTab: _onItemTapped),
      MenuPage(),
      SongPage(),
      ProfilePage(),
    ];
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.music_note),
            label: 'Songs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Styles.primary,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
      ),
    );
  }
}
