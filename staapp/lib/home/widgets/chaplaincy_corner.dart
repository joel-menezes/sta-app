import 'package:flutter/material.dart';
import 'dart:io';
import 'package:staapp/home/widgets/info_box.dart';
import 'package:staapp/theme/styles.dart';


class ChaplaincyCorner extends StatelessWidget {
  const ChaplaincyCorner({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double widths = MediaQuery.sizeOf(context).width - 16;

    return Column(children: [
      Container(
                            margin: const EdgeInsets.only(top: 12.0, left: 12.0, right: 12.0),

          width: widths,
          height: null,
          decoration: BoxDecoration(boxShadow: Styles.normalBoxShadow, borderRadius: Styles.primaryBorderRadius),

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
                     InfoBox(name: "Verse of The Day", message: 'We may throw the dice, but the LORD determines how they fall. (Proverbs 16:33)'),
                                         ])),
          ))
    ]);
  }
}
