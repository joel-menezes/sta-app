import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:home_widget/home_widget.dart';
import 'package:flutter/material.dart';
import 'package:staapp/screens/home_page.dart';
import 'package:staapp/screens/menu_page.dart';
import 'package:staapp/screens/song_request.dart';
import 'package:staapp/screens/profile.dart';
import 'package:staapp/theme/theme.dart';
import 'package:staapp/theme/styles.dart';
import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';
import 'package:flutter/foundation.dart';
import 'data.dart';

import 'dart:io';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final currentUser = FirebaseAuth.instance.currentUser;

  print(currentUser);

  if (currentUser == null) FirebaseAuth.instance.signInAnonymously();

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
String appGroupId = 'com.staugustinechs.app';           
 String iOSWidgetName = 'DayNumberSmall';
 String androidWidgetName = 'DayNumberSmall'; 


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }



void updateWidgets(String day) {            
  HomeWidget.saveWidgetData<String>(
      'day_number', day);
  HomeWidget.updateWidget(
    iOSName: iOSWidgetName,
    androidName: androidWidgetName,
  );
}   

int? dayNumber;
bool loading = true;
String  errorMessage = '';
  Future<void> fetchDayNumber() async {
    try {
      final response = await http.get(Uri.parse(
          'https://us-central1-staugustinechsapp.cloudfunctions.net/getDayNumber'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          dayNumber = data['data']
              ['dayNumber']; // Extract the day number from the API response
              updateWidgets(dayNumber.toString());
          loading = false;
        });
      } else {
        setState(() {
          errorMessage =
              'Failed to load day number. Status code: ${response.statusCode}';
          loading = false;
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = 'Error: ${e.toString()}';
        loading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    
    setState((){
      fetchDayNumber();
      // updateWidgets(dayNumber.toString());
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
