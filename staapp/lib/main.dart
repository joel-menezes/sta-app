import 'package:flutter/material.dart';
import 'package:staapp/screens/home_page.dart';
import 'package:staapp/screens/menu_page.dart';
import 'package:staapp/screens/song_request.dart';
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
    
    return MaterialApp(
        title: 'St. Augustine CHS App',
        theme: lightTheme,
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        home: const MainNavigation(),
        // routes: {
        //   '/': (context) => const HomePage(),
        //   '/menu': (context) => const MenuPage(),
        //   '/songs': (context) => const SongPage(),
        // }
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

  // Screens for navigation
  static const List<Widget> _screens = [
    HomePage(),
    MenuPage(),
    SongPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex], // Display the selected screen
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // Highlight the selected tab
        onTap: _onItemTapped, // Handle tap on navigation items
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
            label: 'Music',
          ),
        ],
        selectedItemColor: Styles.primary, // Active icon color
        unselectedItemColor: Colors.grey, // Inactive icon color
        backgroundColor: Colors.white, // Background color of the nav bar
      ),
    );
  }
}