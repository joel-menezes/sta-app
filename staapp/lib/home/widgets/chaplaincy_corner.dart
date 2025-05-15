import 'package:flutter/material.dart';
import 'dart:io';
import 'package:staapp/home/widgets/info_box.dart';

class ChaplaincyCorner extends StatelessWidget {
  const ChaplaincyCorner({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          margin: const EdgeInsets.only(top: 20.0),
          width: 350.0,
          height: null,
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                  color: Colors.black54,
                  blurRadius: 10,
                  offset: Offset(0, 0),
                  spreadRadius: 0.1,
                  blurStyle: BlurStyle.normal)
            ],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Card(
            color: Colors.white,
            child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Chaplaincy Corner',
                          style: new TextStyle(
                            fontSize: 20,
                            color: Color(0xFF8D1230),
                            fontWeight: FontWeight.bold,
                          )),
                      InfoBox(
                          name: "Verse of The Day",
                          message:
                              'We may throw the dice, but the LORD determines how they fall. (Proverbs 16:33)'),
                    ])),
          ))
    ]);
  }
}
