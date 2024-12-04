import 'package:flutter/material.dart';
import 'dart:io';
import 'package:staapp/home/widgets/info_box.dart';

class Styles {
  static const Color primary = Color(0xff8D1230);
  static const Color secondary = Color(0xffD8AE1A);

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
