import 'package:flutter/material.dart';
import 'package:staapp/home/widgets/welcome_banner.dart';
import 'package:staapp/home/widgets/announcements.dart';
import 'package:staapp/home/widgets/featured_cafe_items.dart';
import 'package:staapp/home/widgets/spirit_meter.dart';
import 'package:staapp/home/widgets/chaplaincy_corner.dart';
import 'package:staapp/theme/theme.dart';
import 'dart:io';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> widgets = [
    WelcomeBanner(),
    Announcements(),
    CafeItems(),
    SpiritMeter(),
    ChaplaincyCorner(),
  ];

  @override
  Widget build(BuildContext context) {
    double widths = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth < 650) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                  child: ReorderableListView(
                onReorder: (int oldIndex, int newIndex) {
                  setState(() {
                    if (newIndex > oldIndex) {
                      newIndex -= 1;
                    }
                    final widget = widgets.removeAt(oldIndex);
                    widgets.insert(newIndex, widget);
                  });
                },
                children: [
                  for (int index = 0; index < widgets.length; index++)
                    Container(
                      key: ValueKey(index),
                      child: widgets[index],
                    )
                ],
              ))
            ],
          );
        } else {
          return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            WelcomeBanner(),
                            CafeItems(),
                            ChaplaincyCorner()
                          ]),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Announcements(),
                            SpiritMeter(),
                          ]),
                    ])
              ]);
        }
      }),
    );
  }
}
