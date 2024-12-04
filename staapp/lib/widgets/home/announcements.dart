import 'package:staapp/widgets/home/info_box.dart';
import 'package:flutter/material.dart';
import 'package:staapp/theme/styles.dart';
import 'dart:io';

class Announcements extends StatelessWidget {
  const Announcements({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    double widths = MediaQuery.sizeOf(context).width < 650
        ? MediaQuery.sizeOf(context).width - 16
        : (MediaQuery.sizeOf(context).width - 72) / 2;

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
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Announcements Board',
                          style: theme.textTheme.displayLarge
                              ?.copyWith(color: Styles.primary)),
                      InfoBox(
                          name: 'Animal Rights Committee',
                          message:
                              "Attention all animal rights committee members! There will be a yearbook photo this Thurs. Nov. 14th immediately following am announcements in the main foyer."),
                      InfoBox(
                          name: 'Athletic Council',
                          message:
                              "Friday night intramurals are back! Volleyball tournament will take place Nov. 29th. Registration begins in the back of the caf on Nov. 18. See AC's posters around the school for more information"),
                      InfoBox(
                          name: 'Library',
                          message:
                              "Due to the Math Contest and OSSLT preparation sessions on Wednesday Nov 13, the library will be closed before school and during Periods 1 & 2."),
                    ])),
          )),
    ]);
  }
}