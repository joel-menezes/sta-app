import 'package:flutter/material.dart';
import 'package:staapp/widgets/home/announcements.dart';
import 'package:staapp/widgets/extras/header.dart';
import 'package:staapp/widgets/menu/specials.dart';
import 'package:staapp/widgets/menu/menu.dart';
import 'package:staapp/theme/theme.dart';
import 'package:staapp/theme/styles.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Align(
          alignment: Alignment.topCenter,
          child: Container(
              height: 500,
              decoration: BoxDecoration(
                color: Color(0xFF870029),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ))),
    );
  }
}
