import 'package:flutter/material.dart';
import 'dart:io';
import 'package:staapp/widgets/home/info_box.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 15,
        color: Color(0xFF8D1230),
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        fontSize: 10,
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
        fontSize: 10,
        color: Color(0xFF8D1230),
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
