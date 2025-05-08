import 'package:staapp/widgets/home/info_box.dart';
import 'package:flutter/material.dart';
import 'package:staapp/theme/styles.dart';
import 'package:staapp/theme/theme.dart';
import 'package:staapp/widgets/home/food_tile.dart';
import 'dart:io';

class Menu extends StatelessWidget {
  final List<String> names;
  const Menu({Key? key, required this.names}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    double widths = MediaQuery.sizeOf(context).width < 650
        ? MediaQuery.sizeOf(context).width - 16
        : (MediaQuery.sizeOf(context).width - 72) / 2;
    double heights = MediaQuery.sizeOf(context).height;
    return Column(children: [
      Container(
          margin: const EdgeInsets.only(top: 12.0, left: 12.0, right: 12.0),
          width: widths,
          height: null,
          decoration: BoxDecoration(
              boxShadow: Styles.normalBoxShadow,
              borderRadius: Styles.primaryBorderRadius),
          child: Card(
            color: Colors.white,
            child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Menu',
                          style: theme.textTheme.displayLarge
                              ?.copyWith(color: Styles.primary)),
                      Column(children: [
                        for (int i = 0; i < names.length; i += 2) ...[
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                for (int j = 0;
                                    j < ((i + j == names.length) ? 1 : 2);
                                    j++)
                                  FoodTile(
                                      name: names[i + j],
                                      heights: heights,
                                      widths: widths * 0.5 - 30),
                              ]),
                          SizedBox(height: 16),
                        ]
                      ])
                    ])),
          )),
    ]);
  }
}
