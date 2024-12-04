import 'package:flutter/material.dart';
import 'package:staapp/widgets/home/announcements.dart';
import 'package:staapp/widgets/extras/header.dart';
import 'package:staapp/widgets/menu/specials.dart';
import 'package:staapp/widgets/menu/menu.dart';

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
