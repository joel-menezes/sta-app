import 'package:flutter/material.dart';
import 'package:staapp/widgets/home/info_box.dart';
import 'package:staapp/theme/theme.dart';
import 'dart:io';

class Styles {
  static const Color primary = Color(0xff8D1230);
  static const Color white = Colors.white;
  static const Color secondary = Color(0xffD8AE1A);
  static const String fontFamilyTitles = 'Raleway';
   static const String fontFamilyNormal = 'SourceSansPro';

  // Phone Variables
  static const int phoneWidth = 649;
  static const double phonePadding = 16.0;

  // TV Variables
  static const int TVWidth = 1920;

  // Website Variables

  static const TextStyle h1 = TextStyle(
    fontSize: 20,
    color: Color(0xFF8D1230),
    fontWeight: FontWeight.bold,
  );

  static final BorderRadius primaryBorderRadius = BorderRadius.circular(20);

  static final normalBoxShadow = [
    const BoxShadow(
      color: Color.fromRGBO(3, 0, 0, 0.3),
      spreadRadius: 0,
      blurRadius: 5,
      offset: Offset.zero,
    )
  ];
}
