import 'package:flutter/material.dart';
import 'package:staapp/widgets/home/info_box.dart';
import 'package:staapp/theme/styles.dart';
import 'package:staapp/theme/theme.dart';
import 'dart:io';

class ChaplaincyCorner extends StatelessWidget {
  const ChaplaincyCorner({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double widths = MediaQuery.sizeOf(context).width < 650
        ? MediaQuery.sizeOf(context).width - 16
        : (MediaQuery.sizeOf(context).width - 72) / 2;
    final theme = Theme.of(context);

    return Column(children: [
      Container(
          margin: const EdgeInsets.only(top: 12.0, left: 12.0, right: 12.0),
          width: widths,
          height: null,
          decoration: BoxDecoration(
              boxShadow: Styles.normalBoxShadow,
              borderRadius: Styles.primaryBorderRadius),
          child: Card(
            elevation: 0,
            color: Colors.white,
            child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Chaplaincy Corner',
                          style: theme.textTheme.displayLarge
                              ?.copyWith(color: Styles.primary)),
                      InfoBox(
                          name: "Verse of The Day",
                          message:
                              'We may throw the dice, but the LORD determines how they fall. (Proverbs 16:33)'),
                    ])),
          ))
    ]);
  }
}
