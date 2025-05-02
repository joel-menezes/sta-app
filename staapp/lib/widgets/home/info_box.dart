import 'package:flutter/material.dart';
import 'package:staapp/theme/styles.dart';
import 'package:staapp/theme/theme.dart';
import 'dart:io';

class InfoBox extends StatelessWidget {
  final String name;
  final String message;

  const InfoBox({Key? key, required this.name, required this.message})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    double widths = MediaQuery.sizeOf(context).width - 0;

    return Column(children: [
      Container(
          margin: const EdgeInsets.only(
              top: 5.0, left: 1.0, right: 1.0, bottom: 5.0),
          width: widths,
          height: null,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFF8D1230), width: 1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Card(
            elevation: 0,
            color: Colors.white,
            child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name,
                          style: theme.textTheme.displayLarge
                              ?.copyWith(color: Styles.primary)),
                      Text(message,
                          style: theme.textTheme.bodyLarge
                              ?.copyWith(color: Styles.primary)),
                    ])),
          ))
    ]);
  }
}
