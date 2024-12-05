import 'package:flutter/material.dart';
import 'package:staapp/widgets/home/announcements.dart';
import 'package:staapp/widgets/extras/header.dart';
import 'package:staapp/widgets/menu/specials.dart';
import 'package:staapp/widgets/menu/menu.dart';
import 'package:staapp/theme/theme.dart';
import 'package:staapp/theme/styles.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Center(
            child: SingleChildScrollView (
          child: Column(children: [
        Header(name: "Cafeteria Menu"),
        Specials( names: ["Pizza", "Pasta", "Expensive Stuff"]),
        Menu( names: ["Cookie", "Popcorn", "Soup"]),
      
      ]))),
    );
  }
}
