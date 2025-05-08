import 'package:staapp/theme/styles.dart';
import 'package:staapp/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:io';

class WelcomeBanner extends StatelessWidget {
  final String? name;
  const WelcomeBanner({Key? key, this.name}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double widths = MediaQuery.sizeOf(context).width < 650
        ? MediaQuery.sizeOf(context).width - 16
        : (MediaQuery.sizeOf(context).width - 72) / 2;
    final theme = Theme.of(context);
    DateTime now = DateTime.now();
    String date = DateFormat('MMMM d, y').format(now);
    return Column(children: [
      Container(
          margin: const EdgeInsets.only(top: 12.0, left: 12.0, right: 12.0),
          width: widths,
          height: null,
          decoration: BoxDecoration(
            color: Styles.primary,
            border: Border.all(color: Styles.secondary, width: 5),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Card(
              elevation: 0,
              color: Color(0xFF8D1230),
              child: Padding(
                  padding: EdgeInsets.only(
                      left: 16.0,
                      top: 16.0,
                      bottom: 16.0), // Phone 16, tv settings is 32, 20 ,20
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [
                          SizedBox(
                              width: MediaQuery.sizeOf(context).width > 650
                                  ? MediaQuery.sizeOf(context).width / 4
                                  : MediaQuery.sizeOf(context).width /
                                      2, // Changing for TV set at 180 for phone
                              child: Wrap(
                                children: [
                                  Text(
                                    'Welcome ' +
                                        (name ?? "to St. Augustine") +
                                        '!',
                                    style: theme.textTheme.displayLarge
                                        ?.copyWith(color: Colors.white),
                                    softWrap: true,
                                  ),
                                  Container(height: 10.0),
                                  Text('Today is a beautiful day 2, ' + date,
                                      style: theme.textTheme.bodyLarge
                                          ?.copyWith(color: Colors.white))
                                ],
                              )),
                          const Spacer(),
                          Container(
                            constraints: const BoxConstraints(maxHeight: 200.0),
                            width: widths / 3,
                            child: Image.asset('assets/logos/sta_logo.png',
                                fit: BoxFit.fitHeight),
                          ),
                        ]),
                      ])))),
    ]);
  }
}
