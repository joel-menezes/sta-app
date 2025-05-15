import 'package:flutter/material.dart';
import 'dart:io';
import 'package:staapp/theme/styles.dart';

class InfoBox extends StatelessWidget {
  final String name;
  final String message;

  const InfoBox({Key? key, required this.name, required this.message})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(children: [
      Container(
          margin: const EdgeInsets.only(top: 10.0),
          width: 350.0,
          height: null,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFF8D1230), width: 1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Card(
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
