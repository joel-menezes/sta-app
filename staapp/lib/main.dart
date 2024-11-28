import 'package:flutter/material.dart';
import 'package:staapp/home/widgets/welcome_banner.dart';
import 'package:staapp/home/widgets/announcements.dart';
import 'package:staapp/home/widgets/featured_cafe_items.dart';
import 'package:staapp/home/widgets/spirit_meter.dart';
import 'package:staapp/home/widgets/chaplaincy_corner.dart';
import 'package:staapp/theme/theme.dart';
import 'dart:io';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'St. Augustine CHS App',
      theme: lightTheme,
      home: const MyHomePage(title: 'St. Augustine CHS App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> widgets =[
  WelcomeBanner(),
  Announcements(),
  CafeItems(),
  SpiritMeter(),
  ChaplaincyCorner(),
  ];



  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Center(
          // child: SingleChildScrollView(

              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
      children:[
        Expanded(
        child: ReorderableListView(
          onReorder: (int oldIndex, int newIndex){
            setState(() {
              if(newIndex > oldIndex){
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
        )
    )],
      //             children: <Widget>[
      //             WelcomeBanner(),
      //             Announcements(),
      //             CafeItems(),
      //             SpiritMeter(),
      //             ChaplaincyCorner(),
      // ],
    ),
    ),
    // ),
  
    );
  }
}
