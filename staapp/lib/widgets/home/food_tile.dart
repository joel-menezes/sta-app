import 'package:flutter/material.dart';
import 'dart:io';
import 'package:staapp/theme/styles.dart';

class FoodTile extends StatelessWidget {
  final String name;
  final double heights;
  final double widths;

  const FoodTile(
      {Key? key,
      required this.name,
      required this.heights,
      required this.widths})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
        margin: const EdgeInsets.all(3.0),
        width: widths * 0.3 - 12,
        height: 150 / 600 * heights,
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFF8D1230), width: 1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Card(
          color: Colors.white,
          child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(name,
                        textAlign: TextAlign.center,
                        style: new TextStyle(
                          fontSize: 10,
                          color: Color(0xFF8D1230),
                          fontWeight: FontWeight.bold,
                        )),
                  ])),
        ));
  }
}
