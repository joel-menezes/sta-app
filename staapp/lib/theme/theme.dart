import 'package:flutter/material.dart';
import 'package:staapp/widgets/home/info_box.dart';
import 'package:staapp/theme/styles.dart';
import 'dart:io';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 35,
        // color: Color(0xFF8D1230),
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        fontSize: 12.5,
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
        fontSize: 10,
        // color: Color(0xFF8D1230),
      )),
);

ThemeData lightThemePhone = ThemeData(
  brightness: Brightness.light,
  textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 25,
        // color: Color(0xFF8D1230),
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        fontSize: 12.5,
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
        fontSize: 10,
        // color: Color(0xFF8D1230),
      )),
);

ThemeData lightThemeTV = ThemeData(
  brightness: Brightness.light,
  textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 55,
        // color: Color(0xFF8D1230),
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        fontSize: 35,
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
        fontSize: 10,
        // color: Color(0xFF8D1230),
      )),
);

ThemeData lightThemeLaptop = ThemeData(
  brightness: Brightness.light,
  textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 30,
        // color: Color(0xFF8D1230),
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        fontSize: 17,
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
        fontSize: 10,
        // color: Color(0xFF8D1230),
      )),
);

// ThemeData lightTheme = ThemeData(
//   brightness: Brightness.light,
//   useMaterial3: true,
//   textTheme: const TextTheme(
//     displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
//     bodyLarge: TextStyle(fontSize: 18, color: Colors.black87),
//   ),
//   appBarTheme: const AppBarTheme(
//     color: Colors.blue,
//     iconTheme: IconThemeData(color: Colors.white),
//   ),
//   colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
// );
