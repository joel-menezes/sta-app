import 'package:flutter/material.dart';
import 'package:staapp/home/widgets/announcements.dart';
import 'package:staapp/home/extras/header.dart';
import 'package:staapp/home/menu/specials.dart';
import 'package:staapp/home/menu/menu.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(children: [
        Header(),
        Specials(),
        Menu(),
      ])),
    );
  }
}
